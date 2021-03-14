#include "shell.h"
#include <cstring>
#include "xprintf.h"

Shell shell;

extern cmd_pair_t _shell_start[];
extern cmd_pair_t _shell_end[];

void Shell::init(const char* prompt)
{
    m_cursor = 0;
    m_tail = 0;
    m_is_esc_arrow = false;
    m_is_esc_seq = false;
    m_tab_pair = nullptr;
    std::strcpy(m_prompt, prompt);
    m_cmd_pair = _shell_start;
    m_cur_cmd_id = 0;
    xprintf("\033c");
    clear(0);
    this->prompt();
}

void Shell::prompt()
{
    xprintf("%s:", m_prompt);
}

void Shell::process_char(char key)
{
	if (get_line(key) == false)
	{
		return;
	}

	uint32_t idx = save_to_history(&m_cmdline);
	if (idx == UINT32_MAX)
	{
		prompt();
		return;
	}

	execute_cmd(&m_shell_cmds[idx]);
}

int32_t Shell::get_num(char* str)
{
    int32_t val, cur_c;
	uint32_t len = strlen(str);
	uint32_t pos = 0;
	int32_t val_sign = 1;
	bool is_hex = false;
	val = 0;
	while (pos < len)
	{
		char c = str[pos];
		cur_c = -1;
		if ((c>'9') && (c>'Z'))
		{
			c -= ('a' - 'A');
		}
		if ((c=='-') && (pos == 0))
		{
			val_sign = -1;
		}
		else if ((c=='0') && (pos<len) && (str[pos+1]=='x'))
		{
			is_hex = true;
			pos++;
		}
		else if ((c>='0') && (c<='9'))
		{
			cur_c = c - '0';
		}
		else if ((c>='A') && (c<='F'))
		{
			cur_c = c - 'A' + 10;
		}

		if (cur_c != -1)
		{
			if (is_hex)
			{
				val = (val * 0x10) + cur_c;
			}
			else
			{
				val = (val * 10) + cur_c;
			}
		}

		pos++;
	}
	return (val * val_sign);
}

void Shell::clear(uint32_t left)
{
    if (left > 0)
    {
    	xprintf("\033[%dD", left);
    }
    xprintf("\033[K");
}

bool Shell::get_line(char c)
{
    char *cmd_string = m_cmdline;

    if (c != 0x09) // 'tab'
    {
        m_tab_pair = nullptr;
    }
    if (c >= 'A' && c <= 'Z')
    {
        c += 32;
    }
    if ((c == '\n') || (c == '\r'))
    {
        // end of line
        *(cmd_string + m_cmdline_tail) = '\0';
        m_cmdline_cursor = m_cmdline_tail = 0;
        xprintf("\n");
        return true;
    }
    else if (c == '\b')
    {
        // backspace
        if (m_cmdline_cursor > 0)
        {
            clear(1);
            if (m_cmdline_cursor < m_cmdline_tail)
            {
                memmove(cmd_string + m_cmdline_cursor - 1, cmd_string + m_cmdline_cursor,
                    m_cmdline_tail - m_cmdline_cursor);
                cmd_string[m_cmdline_tail - 1] = '\0';
                xprintf("\033[s%s\033[u", cmd_string + m_cmdline_cursor - 1);
            }
            m_cmdline_cursor--;
            m_cmdline_tail--;
        }
    }
    else if (c == 0x7F || c > 127)
    {
        // delete
        if (m_cmdline_cursor < m_cmdline_tail)
        {
        	clear(0);
            if (m_cmdline_cursor < (m_cmdline_tail - 1))
            {
                memmove(cmd_string + m_cmdline_cursor, cmd_string + m_cmdline_cursor + 1,
                    m_cmdline_tail - (m_cmdline_cursor + 1));
                cmd_string[m_cmdline_tail - 1] = '\0';
                xprintf("\033[s%s\033[u", cmd_string + m_cmdline_cursor);
            }
            m_cmdline_tail--;
        }
    }
    else if (c == 0x1B)
    {
        if (m_is_esc_seq == true)
        {
            // double 'esc', clear command line
        	clear(m_cmdline_cursor);
            m_cmdline_cursor = m_cmdline_tail = 0;
            m_is_esc_seq = false;
        }
        else
        {
            // start esc symbol
            m_is_esc_seq = true;
        }
    }
    else if ((c == 0x5B) && (m_is_esc_seq))
    {
        // start arrow symbol
        m_is_esc_arrow = true;
    }
    else if (m_is_esc_arrow && ((c == 0x61) || (c == 0x62)))
    {
        // up/down
        m_is_esc_seq = false;
        m_is_esc_arrow = false;
        if (m_head_idx == 0)
        {
            return false;
        }
        clear(m_cmdline_tail);
        if (c == 0x61)
        {
            m_cmd_idx = (0 == m_cmd_idx) ? m_head_idx - 1 : m_cmd_idx - 1;
        }
        else if (c == 0x62)
        {
            m_cmd_idx = m_cmd_idx >= (m_head_idx - 1) ? 0 : m_cmd_idx + 1;
        }
        strcpy(m_cmdline, m_shell_cmds[m_cmd_idx]);
        m_cmdline_cursor = m_cmdline_tail = strlen(m_shell_cmds[m_cmd_idx]);
        xprintf("%s", m_shell_cmds[m_cmd_idx]);
    }
    else if (m_is_esc_arrow && ((c == 0x63) || (c == 0x64)))
    {
        // right/left
        m_is_esc_seq = false;
        m_is_esc_arrow = false;
        if (c == 0x63 && m_cmdline_cursor < m_cmdline_tail)
        {
            m_cmdline_cursor++;
            xprintf("\033[1C");
        }
        else if (c == 0x64 && m_cmdline_cursor > 0)
        {
            m_cmdline_cursor--;
            xprintf("\033[1D");
        }
    }
    else if (m_is_esc_arrow && ((c == 0x31) || (c == 0x34)))
    {
        // home/end
        if (c == 0x31)
        {
            xprintf("\033[%dD", m_cmdline_cursor);
            m_cmdline_cursor = 0;
        }
        else if (c == 0x34)
        {
            xprintf("\033[%dC", m_cmdline_tail - m_cmdline_cursor);
            m_cmdline_cursor = m_cmdline_tail;
        }
    }
    else if (m_is_esc_arrow && (c == 0x7E))
    {
        // home/end
        m_is_esc_seq = false;
        m_is_esc_arrow = false;
    }
    else if (m_cmdline_cursor > 0 && c == 0x09)
    {
        // tab
        if (m_tab_pair == nullptr)
        {
            m_tab_pair = m_cmd_pair;
        }
        const cmd_pair_t* cmd_pair = (m_tab_pair + 1) == _shell_end ? m_cmd_pair : (m_tab_pair + 1);
        while(cmd_pair != m_tab_pair)
        {
            if(memcmp(m_cmdline, cmd_pair->name, m_cmdline_cursor) == 0)
            {
                strcpy(m_cmdline, cmd_pair->name);
                m_cmdline_tail = strlen(cmd_pair->name);
                xprintf("\033[s");
                clear(0);
                xprintf("%s\033[u", cmd_pair->name + m_cmdline_cursor);
                m_tab_pair = cmd_pair;
                break;
            }
            if (++cmd_pair == _shell_end)
            {
                cmd_pair = m_cmd_pair;
            }
        }
    }
    else if (m_cmdline_tail < SHELL_MAX_COMMAND_LINE && (c > 31 && c < 127))
    {
        // character
        m_is_esc_seq = false;
        m_is_esc_arrow = false;
        clear(0);
        xprintf("%c", c);
        if (m_cmdline_cursor < m_cmdline_tail)
        {
            memmove(cmd_string + m_cmdline_cursor + 1, cmd_string + m_cmdline_cursor,
                m_cmdline_tail - m_cmdline_cursor);
            cmd_string[m_cmdline_tail + 1] = '\0';
            xprintf("\033[s%s\033[u", cmd_string + m_cmdline_cursor + 1);
        }
        *(cmd_string + m_cmdline_cursor) = c;
        m_cmdline_cursor++;
        m_cmdline_tail++;
    }
    // not end of line
    return false;
}

const char* Shell::status_to_string(status_e status)
{
    const char *pointer = NULL;
    switch (status)
    {
        case STATUS_OK:
            pointer = "[OK]";
            break;
        case STATUS_FAIL:
            pointer = "[FAIL]";
            break;
        case STATUS_ABORT:
            pointer = "[ABORT]";
            break;
        case STATUS_INV_PAR:
            pointer = "[INV_PAR]";
            break;
        case STATUS_NOT_IMP:
            pointer = "[NOT_IMP]";
            break;
        case STATUS_RUNNING:
            pointer = "[RUNNING]";
            break;
    }
    return pointer;
}

void Shell::print_status(status_e status)
{
    const char *pointer;
    pointer = status_to_string(status);
    xprintf("%s\n", pointer);
}

void Shell::parse_cmd(uint32_t argc, char * const argv[])
{
    status_e status;
    const cmd_pair_t* cmd_pair = m_cmd_pair;

    while (cmd_pair != _shell_end)
    {
        if (strcmp(argv[0], cmd_pair->name) == 0)
        {
            m_cur_cmd_id++;
            status = cmd_pair->proc(argc, argv);
            if (status == STATUS_INV_PAR)
            {
                xprintf("%s \t %s\n", cmd_pair->name, cmd_pair->help);
            }
            print_status(status);
            return;
        }
        cmd_pair++;
    }
    xprintf("STATUS_NOT_FOUND\n");
}

uint32_t Shell::save_to_history(void *arg)
{
    if (*(char*)arg == 0)
    {
        return UINT32_MAX;
    }

    for (uint32_t i = 0; i < m_head_idx; i++)
    {
        if (0 == strcmp(m_shell_cmds[i], (char*)arg))
        {
            memmove(m_shell_cmds + i, m_shell_cmds + i + 1, (m_head_idx - i - 1) * SHELL_MAX_COMMAND_LINE);
            m_head_idx--;
            break;
        }
    }

    if (m_head_idx == SHELL_MAX_CMD_IN_HISTORY)
    {
        memmove(m_shell_cmds, m_shell_cmds + 1, (m_head_idx - 1) * SHELL_MAX_COMMAND_LINE);
        m_head_idx--;
    }

    strcpy(m_shell_cmds[m_head_idx], (char*)arg);

    m_head_idx++;
    m_cmd_idx = m_head_idx;

    return m_head_idx - 1;
}

void Shell::execute_cmd(void *arg)
{
    m_num_tokens = 0;
    strcpy(m_shell_cmds[SHELL_MAX_CMD_IN_HISTORY], (char*) arg);

    m_token[m_num_tokens] = strtok(m_shell_cmds[SHELL_MAX_CMD_IN_HISTORY], " ");
    while (m_token[m_num_tokens])
    {
        ++(m_num_tokens);
        m_token[m_num_tokens] = strtok((char *)NULL, " ,");
    }

    if(m_num_tokens)
    {
        parse_cmd(m_num_tokens, m_token);
        xprintf("\n");
    }

    prompt();
}

status_e cmd_clear_screen(uint32_t argc, char * const argv[])
{
    (void)(argc);
    (void)(argv);
    //xprintf("\033[2J\033[1;1H");
    xprintf("\033c");
    shell.prompt();
    return STATUS_OK;
}

SHELL_COMMAND(cls, "clear screen", cmd_clear_screen);

status_e shell_cmd_help(uint32_t argc, char * const argv[])
{
    const cmd_pair_t *cmd_pair = _shell_start;
    char *filter = NULL;

    if (argc > 1)
    {
        filter = argv[1];
        for (uint32_t i = 0; filter[i]; i++)
        {
            filter[i] = 'A' <= filter[i] && filter[i] <= 'Z' ? filter[i] + 'a' - 'A' : filter[i];
        }
    }
    while (cmd_pair != _shell_end)
    {
        if ((NULL == filter) || ((NULL != filter) && (NULL != strstr(cmd_pair->name, filter))))
        {
            xprintf("%s \t %s\n", cmd_pair->name, cmd_pair->help);
        }
        cmd_pair++;
    }
    return STATUS_OK;
}

SHELL_COMMAND(help, "show available commands", shell_cmd_help);