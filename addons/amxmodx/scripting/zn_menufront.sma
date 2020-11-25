#define ADMIN_LEVEL ADMIN_BAN

const PDATA_SAFE = 2
const OFFSET_CSMENUCODE = 205
const OFFSET_LINUX = 5 // offsets 5 higher in Linux builds

#include <amxmodx>
#include <fakemeta>
#include <reapi>

public plugin_init() {
	register_plugin("[ZN] Menu Front", "1.2", "baarsik");
	register_clcmd("amxmodmenu", "OpenMenu");
	register_menucmd(register_menuid("Admin Menu"), 1023, "MenuHandler");
}

public OpenMenu(id) {
	if(!is_user_connected(id) || ~get_user_flags(id) & ADMIN_LEVEL)
		return PLUGIN_CONTINUE;
	
	new menu[512], len, keys = MENU_KEY_0;
	len += formatex(menu[len], charsmax(menu) - len, "\yМеню администратора^n^n")
	len += formatex(menu[len], charsmax(menu) - len, "\w1. Кикнуть игрока^n");
	keys += MENU_KEY_1;
	len += formatex(menu[len], charsmax(menu) - len, "\w2. Забанить игрока^n");
	keys += MENU_KEY_2;
	len += formatex(menu[len], charsmax(menu) - len, "\w3. Убить игрока^n");
	keys += MENU_KEY_3;
	len += formatex(menu[len], charsmax(menu) - len, "\w4. Сменить карту^n");
	keys += MENU_KEY_4;
	len += formatex(menu[len], charsmax(menu) - len, "\w5. Создать голосование за карту^n");
	keys += MENU_KEY_5;
	len += formatex(menu[len], charsmax(menu) - len, "\w6. Завершить раунд^n");
	keys += MENU_KEY_6;
	len += formatex(menu[len], charsmax(menu) - len, "^n\w0. Выход");
	if (pev_valid(id) == PDATA_SAFE) set_pdata_int(id, OFFSET_CSMENUCODE, 0, OFFSET_LINUX);
	show_menu(id, keys, menu, -1, "Admin Menu");
	return PLUGIN_HANDLED;
}

public MenuHandler(id, key) {
	if (!is_user_connected(id) || ~get_user_flags(id) & ADMIN_LEVEL)
		return PLUGIN_HANDLED;
	
	switch (key) {
		case 0: client_cmd(id, "amx_kickmenu");
		case 1: client_cmd(id, "amx_banmenu");
		case 2: client_cmd(id, "amx_slapmenu");
		case 3: client_cmd(id, "amx_mapmenu");
		case 4: client_cmd(id, "amx_votemapmenu");
		case 5: rg_round_end(5.0, WINSTATUS_DRAW, ROUND_NONE, "default", "default", false);
	}
	return PLUGIN_HANDLED;
}