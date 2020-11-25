#define get_currency(%1)		zp_get_user_ammo_packs(%1)
#define set_currency(%1,%2)		zp_set_user_ammo_packs(%1,%2)
#define get_souls(%1)			zp_get_user_souls(%1)
#define set_souls(%1,%2)		zp_set_user_souls(%1,%2)
#define is_user_vip(%1)			zp_get_user_vip(%1)

#include <amxmodx>
#include <amxmisc>
#include <fun>
#include <engine>
#include <fakemeta_util>
#include <hamsandwich>
#include <cstrike>
#include <zombienightmare>

#define VERSION				"2.4.1"

#define FLAG_A (1<<0)
#define FLAG_B (1<<1)
#define FLAG_C (1<<2)
#define FLAG_D (1<<3)
#define FLAG_E (1<<4)
#define FLAG_F (1<<5)
#define FLAG_G (1<<6)
#define FLAG_H (1<<7)
#define FLAG_I (1<<8)
#define FLAG_J (1<<9)
#define FLAG_K (1<<10)
#define FLAG_L (1<<11)
#define FLAG_M (1<<12)
#define FLAG_N (1<<13)
#define FLAG_O (1<<14)
#define FLAG_P (1<<15)
#define FLAG_Q (1<<16)

#define ITEM_SIZELEN 128
#define ITEM_MAXLEN (ITEM_SIZELEN - 1)
#define MAX_CATEGORY_ITEMS 30
#define GAMEMODE_OFF -1
#define CATEGORY_OFF -1

new const MAXBPAMMO[] = { -1, 52, -1, 90, 1, 32, 1, 100, 90, 1, 120, 100, 100, 90, 90, 90, 100, 120, 30, 120, 200, 32, 90, 120, 90, 2, 35, 90, 90, -1, 100 }
new const AMMOTYPE[][] = { "", "357sig", "", "762nato", "", "buckshot", "", "45acp", "556nato", "", "9mm", "57mm", "45acp", "556nato", "556nato", "556nato",
	"45acp", "9mm", "338magnum", "9mm", "556natobox", "buckshot", "556nato", "9mm", "762nato", "", "50ae", "556nato", "762nato", "", "57mm" }
const PRIMARY_WEAPONS_BIT_SUM = (1<<CSW_SCOUT)|(1<<CSW_XM1014)|(1<<CSW_MAC10)|(1<<CSW_AUG)|(1<<CSW_UMP45)|(1<<CSW_SG550)|(1<<CSW_GALIL)|(1<<CSW_FAMAS)|(1<<CSW_AWP)|
	(1<<CSW_MP5NAVY)|(1<<CSW_M249)|(1<<CSW_M3)|(1<<CSW_M4A1)|(1<<CSW_TMP)|(1<<CSW_G3SG1)|(1<<CSW_SG552)|(1<<CSW_AK47)|(1<<CSW_P90)
const SECONDARY_WEAPONS_BIT_SUM = (1<<CSW_P228)|(1<<CSW_ELITE)|(1<<CSW_FIVESEVEN)|(1<<CSW_USP)|(1<<CSW_GLOCK18)|(1<<CSW_DEAGLE)
const PEV_ADDITIONAL_AMMO = pev_iuser1

new const INI_FILE[] = "zn_buymenu.ini"

enum _:BCATEGORY {
	PISTOL = 0,
	SHOTGUN,
	AUTOMATE,
	RIFLE,
	MACHINEGUN,
	ITEM,
	ZITEM,
	VIP,
	KNIFE
}

enum _:LIMITS {
	ROUNDS,
	PLAYERS,
	MAX_USED
}

enum _:USED_TYPE {
	USER_USED,
	ALL_USED
}
	

new ItemMenu[33][BCATEGORY], ItemName[BCATEGORY][MAX_CATEGORY_ITEMS][ITEM_SIZELEN], ItemTodo[BCATEGORY][MAX_CATEGORY_ITEMS][ITEM_SIZELEN],
ItemCost[BCATEGORY][MAX_CATEGORY_ITEMS], ItemSouls[BCATEGORY][MAX_CATEGORY_ITEMS], ItemFlags[BCATEGORY][MAX_CATEGORY_ITEMS], ItemCounter[BCATEGORY], ItemUsed[33][BCATEGORY][MAX_CATEGORY_ITEMS],
ItemLimit[LIMITS][BCATEGORY][MAX_CATEGORY_ITEMS], ItemPlayerUsed[BCATEGORY][MAX_CATEGORY_ITEMS], bool:HasKnife[33][MAX_CATEGORY_ITEMS]

new g_ItemCallBack, g_BuyMenuCallBack
new g_maxplayers = 32, g_msgStatusIcon, g_msgSayText
new CurrentMode = -1
new UserSteamID[33][35]
new UserCategory[33]

public plugin_init() {
	// Registers
	register_plugin("[ZN] Buy Menu", VERSION, "Felix_Font / baarsik")
	register_hook()
	register_srvcmd("buymenu", "plugin_functions")
	register_logevent("RoundEnd", 2, "1=Round_End")
	register_logevent("RoundStart", 2, "1=Round_Start")
	RegisterHam(Ham_Player_PreThink, "player", "Ham_PreThink_Post", true)
	register_dictionary("zn_buymenu.txt")
	
	// Global vars
	g_BuyMenuCallBack = menu_makecallback("BuyMenuCallBack")
	g_ItemCallBack = menu_makecallback("ItemsCallBack")
	g_msgStatusIcon = get_user_msgid("StatusIcon")
	g_msgSayText = get_user_msgid("SayText")
	g_maxplayers = get_maxplayers()
}

public register_hook() {
	new const g_szBuyCommands[][] = {
	        "usp", "glock", "deagle", "p228", "elites",
	        "fn57", "m3", "xm1014", "mp5", "tmp", "p90",
	        "mac10", "ump45", "ak47", "galil", "famas",
	        "sg552", "m4a1", "aug", "scout", "awp", "g3sg1",
	        "sg550", "m249", "vest", "vesthelm", "flash",
	        "hegren", "sgren", "defuser", "nvgs", "shield",
	        "primammo", "secammo", "km45", "9x19mm", "nighthawk",
	        "228compact", "fiveseven", "12gauge", "autoshotgun",
	        "mp", "c90", "cv47", "defender", "clarion", "krieg552",
	        "bullpup", "magnum", "d3au1", "krieg550",
	        "buy", "buyequip", "cl_autobuy",
	        "cl_rebuy", "cl_setautobuy", "cl_setrebuy", "client_buy_open"
	}
	for(new i = 0; i < sizeof g_szBuyCommands; i++)
	{
		register_clcmd(g_szBuyCommands[i], "BuySystem_Hook");
	}
}

public BuySystem_Hook(id) {
	main_menu(id)
	return PLUGIN_HANDLED;
}

public Ham_PreThink_Post(id) {
	if(!is_user_alive(id))
		return HAM_IGNORED;

	message_begin(MSG_ONE, g_msgStatusIcon, _, id);
	write_byte(1);
	write_string("buyzone");
	write_byte(0);
	write_byte(160);
	write_byte(0);
	message_end();
	return HAM_IGNORED;
}

public plugin_precache()
{
	file_init()
}

public zn_user_infected_pre(id)
{
	show_menu(id, 0, "^n", 1)
}

public client_authorized(id)
{
	client_cmd(id, "setinfo ^"_vgui_menus^" ^"0^"")
	new SteamID[35]
	get_user_authid(id,SteamID,34)
	if(!equal(UserSteamID[id], SteamID)) for(new index = 0; index < BCATEGORY; index++) for(new i = 0; i < MAX_CATEGORY_ITEMS; i++) {
		ItemUsed[id][index][i] = 0
		HasKnife[id][i] = false
	}
	UserSteamID[id] = SteamID
	UserCategory[id] = CATEGORY_OFF
}

public client_infochanged(id)
{
	new result[2]
	get_user_info(id, "_vgui_menus", result, 1)
	if(str_to_num(result) != 0) client_cmd(id, "setinfo ^"_vgui_menus^" ^"0^"")
}

public plugin_functions()
{
	new arg[12]
	read_argv(1, arg , 32)
	remove_quotes(arg)
	
	if(equali("reload", arg)) file_init_pre()
	else if(equali("info", arg) || equali("help", arg)) items_info()
	else {
		server_print("################")
		server_print("# BuyMenu Console Manager")
		server_print("# USE ^"buymenu *command*^":")
		server_print("# ^"reload^" - reload items")
		server_print("# ^"info^" or ^"help^" - show this message")
		server_print("################")
	}
}

public main_menu(id)
{
	if(!is_user_connected(id) || !is_user_alive(id))
		return PLUGIN_HANDLED;
	
	if(zp_get_user_zombie(id))
	{
		items_menu(id, ZITEM)
		return PLUGIN_HANDLED;
	}
	
	new ammopacks = zp_get_user_ammo_packs(id)
	new souls = zp_get_user_souls(id)
		
	static szbuffer[256]
	formatex(szbuffer, charsmax(szbuffer), "%L^n\d%d %L \y| \d%d %L", id, "BM_MAIN_MENU", ammopacks, id, "BM_CURRENCY", souls,
		id, souls % 10 == 0 ? "BM_SOULS0" : souls == 1 ? "BM_SOULS1" : souls > 4 ? "BM_SOULS0" : "BM_SOULS2")
	new g_MainMenu = menu_create(szbuffer, "main_handler")
	formatex(szbuffer, charsmax(szbuffer), "%L", id, "BM_PISTOLS_MENU")
	menu_additem(g_MainMenu, szbuffer, _, _, g_BuyMenuCallBack)
	formatex(szbuffer, charsmax(szbuffer), "%L", id, "BM_SHOTGUNS_MENU")
	menu_additem(g_MainMenu, szbuffer, _, _, g_BuyMenuCallBack)
	formatex(szbuffer, charsmax(szbuffer), "%L", id, "BM_AUTOMATES_MENU")
	menu_additem(g_MainMenu, szbuffer, _, _, g_BuyMenuCallBack)
	formatex(szbuffer, charsmax(szbuffer), "%L", id, "BM_RIFLES_MENU")
	menu_additem(g_MainMenu, szbuffer, _, _, g_BuyMenuCallBack)
	formatex(szbuffer, charsmax(szbuffer), "%L", id, "BM_MACHINEGUNS_MENU")
	menu_additem(g_MainMenu, szbuffer, _, _, g_BuyMenuCallBack)
	formatex(szbuffer, charsmax(szbuffer), "%L^n", id, "BM_EXTRAITEMS_MENU")
	menu_additem(g_MainMenu, szbuffer, _, _, g_BuyMenuCallBack)
	formatex(szbuffer, charsmax(szbuffer), "%L", id, "BM_KNIFE_MENU")
	menu_additem(g_MainMenu, szbuffer, _, _, g_BuyMenuCallBack)
	formatex(szbuffer, charsmax(szbuffer), "%L", id, "BM_VIPITEMS_MENU")
	menu_additem(g_MainMenu, szbuffer, _, _, g_BuyMenuCallBack)
	formatex(szbuffer, charsmax(szbuffer), "%L", id, "BM_EXIT")
	menu_setprop(g_MainMenu, MPROP_EXITNAME, szbuffer)
	menu_setprop(g_MainMenu, MPROP_PERPAGE, 0)
	menu_addblank(g_MainMenu, 1)
	menu_additem(g_MainMenu, szbuffer)
	menu_setprop(g_MainMenu, MPROP_NUMBER_COLOR, "\w")
	menu_display(id, g_MainMenu, 0)
	return PLUGIN_HANDLED;
}

public main_handler(id, menu, item)
{
	if (item == MENU_EXIT)
	{
		menu_destroy(menu)
		return PLUGIN_HANDLED
	}
	switch(item)
	{
		case 0:	items_menu(id, PISTOL)
		case 1:	items_menu(id, SHOTGUN)
		case 2:	items_menu(id, AUTOMATE)
		case 3:	items_menu(id, RIFLE)
		case 4:	items_menu(id, MACHINEGUN)
		case 5:	if(zp_get_user_zombie(id)) items_menu(id, ZITEM); else items_menu(id, ITEM)
		case 6: items_menu(id, KNIFE)
		case 7: items_menu(id, VIP)
	}
	menu_destroy(menu)
	return PLUGIN_HANDLED
}

public items_menu(id, scategory)
{
	if(PISTOL > scategory > ZITEM)
		return PLUGIN_HANDLED;
		
	new szTemp[196]
	new ammopacks = zp_get_user_ammo_packs(id)
	new souls = zp_get_user_souls(id)
	
	switch(scategory)
	{
		case PISTOL:
		{
			formatex(szTemp, charsmax(szTemp), "%L^n\d%d %L \y| \d%d %L", id, "BM_PISTOLS_MENU", ammopacks, id, "BM_CURRENCY", souls,
				id, souls % 10 == 0 ? "BM_SOULS0" : souls == 1 ? "BM_SOULS1" : souls > 4 ? "BM_SOULS0" : "BM_SOULS2")
			ItemMenu[id][PISTOL] = menu_create(szTemp, "items_handler")
			UTIL_FormatMenu(PISTOL, id)
		}
		case SHOTGUN:
		{
			formatex(szTemp, charsmax(szTemp), "%L^n\d%d %L \y| \d%d %L", id, "BM_SHOTGUNS_MENU", ammopacks, id, "BM_CURRENCY", souls,
				id, souls % 10 == 0 ? "BM_SOULS0" : souls == 1 ? "BM_SOULS1" : souls > 4 ? "BM_SOULS0" : "BM_SOULS2")
			ItemMenu[id][SHOTGUN] = menu_create(szTemp, "items_handler")
			UTIL_FormatMenu(SHOTGUN, id)
		}
		case AUTOMATE:
		{
			formatex(szTemp, charsmax(szTemp), "%L^n\d%d %L \y| \d%d %L", id, "BM_AUTOMATES_MENU", ammopacks, id, "BM_CURRENCY", souls,
				id, souls % 10 == 0 ? "BM_SOULS0" : souls == 1 ? "BM_SOULS1" : souls > 4 ? "BM_SOULS0" : "BM_SOULS2")
			ItemMenu[id][AUTOMATE] = menu_create(szTemp, "items_handler")
			UTIL_FormatMenu(AUTOMATE, id)
		}
		case RIFLE:
		{
			formatex(szTemp, charsmax(szTemp), "%L^n\d%d %L \y| \d%d %L", id, "BM_RIFLES_MENU", ammopacks, id, "BM_CURRENCY", souls,
				id, souls % 10 == 0 ? "BM_SOULS0" : souls == 1 ? "BM_SOULS1" : souls > 4 ? "BM_SOULS0" : "BM_SOULS2")
			ItemMenu[id][RIFLE] = menu_create(szTemp, "items_handler")
			UTIL_FormatMenu(RIFLE, id)
		}
		case MACHINEGUN:
		{
			formatex(szTemp, charsmax(szTemp), "%L^n\d%d %L \y| \d%d %L", id, "BM_MACHINEGUNS_MENU", ammopacks, id, "BM_CURRENCY", souls,
				id, souls % 10 == 0 ? "BM_SOULS0" : souls == 1 ? "BM_SOULS1" : souls > 4 ? "BM_SOULS0" : "BM_SOULS2")
			ItemMenu[id][MACHINEGUN] = menu_create(szTemp, "items_handler")
			UTIL_FormatMenu(MACHINEGUN, id)
		}
		case ITEM:
		{
			formatex(szTemp, charsmax(szTemp), "%L^n\d%d %L \y| \d%d %L", id, "BM_EXTRAITEMS_MENU", ammopacks, id, "BM_CURRENCY", souls,
				id, souls % 10 == 0 ? "BM_SOULS0" : souls == 1 ? "BM_SOULS1" : souls > 4 ? "BM_SOULS0" : "BM_SOULS2")
			ItemMenu[id][ITEM] = menu_create(szTemp, "items_handler")
			UTIL_FormatMenu(ITEM, id)
		}
		case ZITEM:
		{
			formatex(szTemp, charsmax(szTemp), "%L^n\d%d %L \y| \d%d %L", id, "BM_ZEXTRAITEMS_MENU", ammopacks, id, "BM_CURRENCY", souls,
				id, souls % 10 == 0 ? "BM_SOULS0" : souls == 1 ? "BM_SOULS1" : souls > 4 ? "BM_SOULS0" : "BM_SOULS2")
			ItemMenu[id][ZITEM] = menu_create(szTemp, "items_handler")
			UTIL_FormatMenu(ZITEM, id)
		}
		case KNIFE:
		{
			formatex(szTemp, charsmax(szTemp), "%L^n\d%d %L \y| \d%d %L", id, "BM_KNIFE_MENU", ammopacks, id, "BM_CURRENCY", souls,
				id, souls % 10 == 0 ? "BM_SOULS0" : souls == 1 ? "BM_SOULS1" : souls > 4 ? "BM_SOULS0" : "BM_SOULS2")
			ItemMenu[id][KNIFE] = menu_create(szTemp, "items_handler")
			UTIL_FormatMenu(KNIFE, id)
		}
		case VIP:
		{
			formatex(szTemp, charsmax(szTemp), "%L^n\d%d %L \y| \d%d %L", id, "BM_VIPITEMS_MENU", ammopacks, id, "BM_CURRENCY", souls,
				id, souls % 10 == 0 ? "BM_SOULS0" : souls == 1 ? "BM_SOULS1" : souls > 4 ? "BM_SOULS0" : "BM_SOULS2")
			ItemMenu[id][VIP] = menu_create(szTemp, "items_handler")
			UTIL_FormatMenu(VIP, id)
		}
	}
	UserCategory[id] = scategory
	return PLUGIN_HANDLED;
}

public items_handler(id, menu, item)
{
	if (item == MENU_EXIT)
		return PLUGIN_HANDLED;
		
	ItemGive_Post(id, UserCategory[id], item);
	UserCategory[id] = CATEGORY_OFF;
	return PLUGIN_HANDLED;
}

public BuyMenuCallBack(id, menu, item) {
	new is_zombie = zp_get_user_zombie(id)
	switch(item)
	{
		case 0: if(is_zombie || ItemCounter[PISTOL] < 1) return ITEM_DISABLED;
		case 1: if(is_zombie || ItemCounter[SHOTGUN] < 1) return ITEM_DISABLED;
		case 2: if(is_zombie || ItemCounter[AUTOMATE] < 1) return ITEM_DISABLED;
		case 3: if(is_zombie || ItemCounter[RIFLE] < 1) return ITEM_DISABLED;
		case 4: if(is_zombie || ItemCounter[MACHINEGUN] < 1) return ITEM_DISABLED;
		case 5:
		{
			if(is_zombie)
			{
				new szTemp[128]
				formatex(szTemp, charsmax(szTemp), "%L", id, "BM_ZEXTRAITEMS_MENU")
				menu_item_setname(menu, item, szTemp)
			}
			if((is_zombie && ItemCounter[ITEM] < 1) || (!is_zombie && ItemCounter[ZITEM] < 1)) return ITEM_DISABLED;
		}
		case 6: if(ItemCounter[KNIFE] < 1) return ITEM_DISABLED;
		case 7: if(is_zombie || ItemCounter[VIP] < 1) return ITEM_DISABLED;
	}
	return ITEM_IGNORE;
}

public ItemsCallBack(id, menu, item)
{
	new ActivePlayers = UTIL_ReturnPlayers();
	for(new i = 0; i < BCATEGORY; i++)
	{
		if(menu != ItemMenu[id][i])
			continue;
		
		if(i == VIP && !is_user_vip(id)) return ITEM_DISABLED;
		if(i == KNIFE && HasKnife[id][item]) return ITEM_IGNORE;
		
		if(get_currency(id) < ItemCost[i][item] || get_souls(id) < ItemSouls[i][item])
			return ITEM_DISABLED;
		
		if((ItemFlags[i][item] & FLAG_A) && CurrentMode == GAMEMODE_OFF || (ItemFlags[i][item] & FLAG_B) && CurrentMode != GAMEMODE_OFF
		||(ItemFlags[i][item] & FLAG_B) && CurrentMode != GAMEMODE_OFF || (ItemFlags[i][item] & FLAG_C) && zp_get_user_first_zombie(id)
		|| (ItemFlags[i][item] & FLAG_D) && zp_get_user_last_zombie(id) || (ItemFlags[i][item] & FLAG_E) && zp_get_user_last_human(id)
		|| (ItemFlags[i][item] & FLAG_F) && CurrentMode == MODE_INFECTION || (ItemFlags[i][item] & FLAG_G) && CurrentMode == MODE_MULTI
		|| ActivePlayers < ItemLimit[PLAYERS][i][item]  || ItemUsed[id][i][item] == -1
		|| ((ItemFlags[i][item] & FLAG_M) && ItemUsed[id][i][item] >= ItemLimit[ROUNDS][i][item])|| (!(ItemFlags[i][item] & FLAG_M) && ItemUsed[id][i][item] > 0)
		|| ItemPlayerUsed[i][item] > ItemLimit[MAX_USED][i][item]) return ITEM_DISABLED;
		break;
	}
	return ITEM_IGNORE;
}

public RoundEnd()
{
	for(new id = 1; id <= g_maxplayers; id++)
	{
		if(is_user_connected(id))
		for(new index = 0; index < BCATEGORY; index++)
		{
			for(new item = 0; item < MAX_CATEGORY_ITEMS; item++)
			{
				if(ItemUsed[id][index][item] > 0)
				{
					if(ItemFlags[index][item] & FLAG_M)
					{
						ItemUsed[id][index][item] = 0;
					}
					else
					{
						ItemUsed[id][index][item]--;
					}
				}
				ItemPlayerUsed[index][item] = 0;
			}
		}
	}
}

public RoundStart()
{
	new prefix[32];
	zp_get_server_prefix(prefix, charsmax(prefix));
	zp_colored_print(0, "^x04[%s]^x01 %L", prefix, LANG_PLAYER, "BM_PRESS_B");
}

public file_init_pre()
{
		for(new id = 1; id <= g_maxplayers; id++)
		{
			for(new category = 0; category < BCATEGORY; category++)
			{
				menu_destroy(ItemMenu[id][category]);
				ItemCounter[category] = 0;
				for(new i = 0; i < MAX_CATEGORY_ITEMS; i++)
				{
					ItemUsed[id][category][i] = 0;
					ItemPlayerUsed[category][i] = 0;
				}
			}
		}
		new prefix[32];
		zp_get_server_prefix(prefix, charsmax(prefix));
		file_init();
		log_amx("[%s] Buymenu has been reloaded", prefix);
}

public file_init()
{
	new cfgdir[32], filepath[100], linedata[1024], category = -1;
	get_configsdir(cfgdir, charsmax(cfgdir));
	formatex(filepath, charsmax(filepath), "%s/%s", cfgdir, INI_FILE);
	if (!file_exists(filepath))
	{
		set_fail_state("File not exists");
	}
	new file = fopen(filepath,"rt");
	while (!feof(file))
	{
		fgets(file, linedata, charsmax(linedata));
		replace(linedata, charsmax(linedata), "^n", "");
		trim(linedata);
		if(!linedata[0] || linedata[0] == '/' || linedata[0] == '#')
			continue;
			
		if(linedata[0] == '[')
		{
			switch(linedata[1])
			{
				case 'P': category = PISTOL;
				case 'S': category = SHOTGUN;
				case 'A': category = AUTOMATE;
				case 'R': category = RIFLE;
				case 'M': category = MACHINEGUN;
				case 'I': category = ITEM;
				case 'Z': category = ZITEM;
				case 'K': category = KNIFE;
				case 'V': category = VIP;
				default:  category = -1;
			}
			continue;
		}
		if(linedata[0] == '}')
		{
			category = -1;
			continue;
		}
		if(linedata[0] != '"' || category < 0)
			continue;
		
		new ItemCostText[12], ItemSoulsText[12], ItemFlagsText[25], ItemRoundLimit[6], ItemMinPlayers[6], ItemMaxUsed[6];
		parse(linedata, ItemName[category][ItemCounter[category]], ITEM_MAXLEN, ItemTodo[category][ItemCounter[category]],
			ITEM_MAXLEN, ItemCostText, 11, ItemSoulsText, 11, ItemFlagsText, 24, ItemRoundLimit, 5, ItemMinPlayers, 5, ItemMaxUsed, 5);
		trim(ItemName[category][ItemCounter[category]]);
		ItemCost[category][ItemCounter[category]] = str_to_num(ItemCostText);
		ItemSouls[category][ItemCounter[category]] = str_to_num(ItemSoulsText);
		ItemFlags[category][ItemCounter[category]] = read_flags(ItemFlagsText);
		ItemLimit[ROUNDS][category][ItemCounter[category]] = str_to_num(ItemRoundLimit);
		ItemLimit[PLAYERS][category][ItemCounter[category]] = str_to_num(ItemMinPlayers);
		if(strlen(ItemMaxUsed) > 0)
		{
			ItemLimit[MAX_USED][category][ItemCounter[category]] = str_to_num(ItemMaxUsed);
		}
		else
		{
			ItemLimit[MAX_USED][category][ItemCounter[category]] = 1000;
		}
		ItemCounter[category]++;
	}
	fclose(file);
	return;
}

public items_info()
{
	for(new i = 0; i < BCATEGORY; i++)
	{	
		server_print("##############");
		for(new index = 0; index < ItemCounter[i]; index++)
		{
			new flags[12];
			get_flags(ItemFlags[i][index],flags,11);
			server_print("#%d | Item: %s | Todo ID: %s | Category ID: %d | Cost: %d | Flags: %s",
				(index+1), ItemName[i][index],  ItemTodo[i][index], i, ItemCost[i][index], flags);
		}
	}
}

public zp_round_started(gamemode)
{
	CurrentMode = gamemode
}

public zp_round_ended()
{
	CurrentMode = GAMEMODE_OFF
}

stock ItemGive_Post(const id, const category, const item)
{
	if(category == KNIFE && HasKnife[id][item])
	{
		zp_force_buy_extra_item(id, zp_get_extra_item_id(ItemTodo[category][item]), true);
		return PLUGIN_CONTINUE;
	}
	if(get_currency(id) < ItemCost[category][item] || get_souls(id) < ItemSouls[category][item]) return PLUGIN_CONTINUE;
	if(equal(ItemTodo[category][item], "weapon_", 7)) UTIL_GiveWeapon(id, ItemTodo[category][item])
	else zp_force_buy_extra_item(id, zp_get_extra_item_id(ItemTodo[category][item]), true)
	if(ItemCost[category][item] > 0) set_currency(id, get_currency(id) - ItemCost[category][item])
	if(ItemSouls[category][item] > 0) set_souls(id, get_souls(id) - ItemSouls[category][item])
	if(ItemFlags[category][item] & FLAG_M) ItemUsed[id][category][item]++
	else ItemUsed[id][category][item] = ItemLimit[ROUNDS][category][item]
	if(category == KNIFE) HasKnife[id][item] = true
	ItemPlayerUsed[category][item]++
	return PLUGIN_CONTINUE;
}
stock UTIL_FormatMenu(const category, const id)
{
	for(new item = 0; item < ItemCounter[category]; item++) {
		new szItem[512], cost[32], players[64]
		new ActivePlayers = UTIL_ReturnPlayers()
		formatex(players, charsmax(players), "%L", id, "BM_MIN_PLAYERS", ItemLimit[PLAYERS][category][item])
		new name[ITEM_SIZELEN]; name = ItemName[category][item]
		new flags = ItemFlags[category][item]
		if(category == VIP && !is_user_vip(id)) formatex(cost, charsmax(cost), "\rVIP")
		else if(ItemCost[category][item] == 0 && ItemSouls[category][item] == 0) formatex(cost, charsmax(cost), "\r%L", id, "BM_FREE")
		else if(ItemCost[category][item] > 0 && ItemSouls[category][item] == 0) formatex(cost, charsmax(cost), "\r%d %L", ItemCost[category][item], id, "BM_CURRENCY")
		else if(ItemCost[category][item] == 0 && ItemSouls[category][item] == 1) formatex(cost, charsmax(cost), "\r%d %L", ItemSouls[category][item], id, "BM_SOULS1")
		else if(ItemCost[category][item] == 0 && ItemSouls[category][item] > 1) formatex(cost, charsmax(cost), "\r%d %L", ItemSouls[category][item], id, "BM_SOULS2")
		else if(ItemSouls[category][item] == 1) formatex(cost, charsmax(cost), "\r%d %L \y| \r%d %L", ItemCost[category][item], id, "BM_CURRENCY", ItemSouls[category][item], id, "BM_SOULS1")
		else formatex(cost, charsmax(cost), "\r%d %L \y| \r%d %L", ItemCost[category][item], id, "BM_CURRENCY", ItemSouls[category][item], id, "BM_SOULS2")
		if(category == KNIFE && (HasKnife[id][item] || (ItemCost[category][item] == 0 && ItemSouls[category][item] == 0))) formatex(szItem, charsmax(szItem), "%s", name)
		else if(ItemLimit[PLAYERS][category][item] > 0 && ItemLimit[PLAYERS][category][item] > ActivePlayers) formatex(szItem, charsmax(szItem), "%s", players)
		else if(flags & FLAG_L) formatex(szItem, charsmax(szItem), "%L      \y[%s\y]", id, name, cost)
		else formatex(szItem, charsmax(szItem), "%s      \y[%s\y]", name, cost)
		menu_additem(ItemMenu[id][category], szItem, _, _, g_ItemCallBack)
	}
	new szTemp[64]
	formatex(szTemp, charsmax(szTemp), "%L", id, "BM_BACK")
	menu_setprop(ItemMenu[id][category], MPROP_BACKNAME, szTemp)
	formatex(szTemp, charsmax(szTemp), "%L", id, "BM_NEXT")
	menu_setprop(ItemMenu[id][category], MPROP_NEXTNAME, szTemp)
	formatex(szTemp, charsmax(szTemp), "%L", id, "BM_EXIT")
	menu_setprop(ItemMenu[id][category], MPROP_EXITNAME, szTemp)
	menu_setprop(ItemMenu[id][category], MPROP_NUMBER_COLOR, "\w")
	menu_display(id, ItemMenu[id][category], 0)
}

stock UTIL_ReturnPlayers()
{
	new players
	for(new id = 1; id <= g_maxplayers; id++) if(is_user_connected(id)) players++
	
	return players;
}

stock UTIL_GiveWeapon(const id, const weapon[])
{
	if(!is_user_connected(id))
		return;
	
	new weaponid = get_weaponid(weapon)
	if(!weaponid) return;
	
	if(((1<<weaponid) & PRIMARY_WEAPONS_BIT_SUM)) UTIL_DropWeapons(id, 1)
	else if(((1<<weaponid) & SECONDARY_WEAPONS_BIT_SUM)) UTIL_DropWeapons(id, 2)
	fm_give_item(id, weapon)
	ExecuteHamB(Ham_GiveAmmo, id, MAXBPAMMO[weaponid], AMMOTYPE[weaponid], MAXBPAMMO[weaponid])
}

stock UTIL_DropWeapons(const id, const dropwhat)
{
	static weapons[32], num = 0, i, weaponid
	get_user_weapons(id, weapons, num)
	for (i = 0; i < num; i++) {
		weaponid = weapons[i]
		if ((dropwhat == 1 && ((1<<weaponid) & PRIMARY_WEAPONS_BIT_SUM)) || (dropwhat == 2 && ((1<<weaponid) & SECONDARY_WEAPONS_BIT_SUM))) {
			static wname[32], weapon_ent
			get_weaponname(weaponid, wname, charsmax(wname))
			weapon_ent = fm_find_ent_by_owner(-1, wname, id)
			set_pev(weapon_ent, PEV_ADDITIONAL_AMMO, cs_get_user_bpammo(id, weaponid))
			engclient_cmd(id, "drop", wname)
			cs_set_user_bpammo(id, weaponid, 0)
		}
	}
}

zp_colored_print(target, const message[], any:...)
{
	static buffer[512], i, argscount
	argscount = numargs()
	if (!target)
	{
		static player
		for (player = 1; player <= g_maxplayers; player++)
		{
			if (!is_user_connected(player))
				continue;
			
			static changed[5], changedcount // [5] = max LANG_PLAYER occurencies
			changedcount = 0
			for (i = 2; i < argscount; i++)
			{
				if (getarg(i) == LANG_PLAYER) {
					setarg(i, 0, player)
					changed[changedcount] = i
					changedcount++
				}
			}
			vformat(buffer, charsmax(buffer), message, 3)
			message_begin(MSG_ONE_UNRELIABLE, g_msgSayText, _, player)
			write_byte(player)
			write_string(buffer)
			message_end()
			for (i = 0; i < changedcount; i++)
				setarg(changed[i], 0, LANG_PLAYER)
		}
	}
	else
	{
		vformat(buffer, charsmax(buffer), message, 3)
		message_begin(MSG_ONE, g_msgSayText, _, target)
		write_byte(target)
		write_string(buffer)
		message_end()
	}
}