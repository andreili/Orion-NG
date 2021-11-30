#pragma once

#include <cstdint>

#define SHELL_MAX_TOKENS 10
#define SHELL_MAX_CMD_IN_HISTORY 10
#define SHELL_MAX_COMMAND_LINE 64

typedef enum
{
	STATUS_OK,
	STATUS_FAIL,
	STATUS_ABORT,
	STATUS_INV_PAR,
	STATUS_NOT_IMP,
	STATUS_RUNNING,
} status_e;

typedef status_e (*shell_proc)(uint32_t argc, char* const argv[]);

typedef struct
{
	const char* name;
	const char* help;
	shell_proc  proc;
} cmd_pair_t;

class Shell
{
public:
    void init(const char* prompt);
    void prompt();
    void process_char(char key);
    static int32_t get_num(char* str);
private:
    uint32_t    m_cursor;
    uint32_t    m_tail;
    char        m_prompt[16];
    const cmd_pair_t* m_tab_pair;
    const cmd_pair_t* m_cmd_pair;
    char*       m_token[SHELL_MAX_TOKENS];
    char        m_cmdline[SHELL_MAX_COMMAND_LINE];
    uint32_t    m_cmdline_cursor;
    uint32_t    m_cmdline_tail;
	char		m_shell_cmds[SHELL_MAX_CMD_IN_HISTORY+1][SHELL_MAX_COMMAND_LINE];
    uint32_t    m_head_idx;
    uint32_t    m_cmd_idx;
    bool        m_is_esc_seq;
    bool        m_is_esc_arrow;
    uint32_t    m_cur_cmd_id;
    uint32_t    m_num_tokens;

    void clear(uint32_t left);
    bool get_line(char c);
    const char* status_to_string(status_e status);
    void print_status(status_e status);
    void parse_cmd(uint32_t argc, char * const argv[]);
    uint32_t save_to_history(void *arg);
    void execute_cmd(void *arg);
};

extern Shell shell;

#define SHELL_COMMAND(_name, _help, _proc) 	\
	static cmd_pair_t _shell_##_name 		\
	__attribute__ ((section(".shellcmds"))) \
	__attribute__ ((used)) 					\
	__attribute__ ((unused)) 				\
	= { 									\
			.name = #_name, 				\
			.help = (_help), 				\
			.proc = (_proc) 				\
	};
