/*================================================================================
 [Plugin Customization]
=================================================================================*/

// Text
new const ZP_PREFIX[] =      "SERVER"
new const BUY_MOTD[] =       "https://cerberus.by/motd/demo.html"

// Limits
new const ZP_MAX_AMMO =      1000
new const ZP_MAX_AMMO_VIP =  1500
new const ZP_MAX_SOULS =     8
new const ZP_MAX_SOULS_VIP = 12

// Zombie nightvision color
new const ZP_NVG_ZOMBIE_R =  50
new const ZP_NVG_ZOMBIE_G =  0
new const ZP_NVG_ZOMBIE_B =  0

// Human nightvision color
new const ZP_NVG_HUMAN_R =   0
new const ZP_NVG_HUMAN_G =   50
new const ZP_NVG_HUMAN_B =   0

/*================================================================================
 Customization ends here! Yes, that's it. Editing anything beyond
 here is not officially supported. Proceed at your own risk...
=================================================================================*/

/*================================================================================
 Changelog -- 3.0
==================================================================================
1.  Обновлено для работы с AMXX 1.8.3 + ReHLDS + ReGameDLL
2.  Удален экстра-предмет 'Zombie Madness'
==================================================================================
 Changelog -- 2.1
==================================================================================
1.  В конце раунда живые зомби получают 1 ОП, живые люди - 2 ОП
2.  Випы могут иметь бесконечные патроны
3.  Исправлен баг с фонариком за зомби
4.  Исправлен баг с коротким префиксом в плагинах
5.  Исправлен визуальный баг с 5 очков здоровья у человека
6.  AK74U - Увеличен урон и уменьшена отдача
7.  Цепное заражение - Увеличен радиус действия
8.  Добавлен нейтив zn_get_user_class - возвращает тип зомби или CLASS_HUMAN
9.  Добавлен плагин zn_aim_info
10. Полностью удалены режимы Немезида и Выживший
11. Удалены конфиги кастомизации экстра-предметов и классов зомби
12. Полностью переработан концепт HUD'а игрока, старый был удален
13. При нажатии на [T] (спрей) показываются ОП и души
14. Души склоняются по правилам русского языка
15. Ножи можно покупать во время раунда, но они установятся только в следующем
16. Количество ОП и душ отображается в меню покупок и в меню зомби классов
==================================================================================
 Changelog -- 2.0
==================================================================================
1.  Исправлен редкий баг, позволяющий получить здоровье зомби за человека
2.  Оптимизация: fw_CmdStart заменен на register_impulse
3.  Оптимизация: fw_ClientCommand заменен на register_clcmd
4.  Оптимизация: длинный прыжок переведен из fw_PlayerPreThink в fw_PlayerDuck
5.  Будучи замороженным, игрок не может поворачивать камеру
6.  Будучи замороженным, игрок не может приседать
7.  Добавлена возможность покупать зомби класс за ОП и души
8.  Скорость танка увеличена до 185(ранее 180)
9.  Радиус цепного заражения увеличен до 65(ранее 50)
10. Оптимизировано получение get_gametime()
11. Первому зомби возвращаются не только ОП за покупку, но и души
12. Полностью удалено описание зомби класса
13. Максимальное количество душ 8/12(ранее 10/15)
14. Добавлен новый вариант воскрешения(при каждом заражении все зомби воскресают)
15. Оружия полностью переработаны
16. Для VIP игроков отдельный модификатор гравитации
17. Новое сохранение ОП и душ (на карту)
18. До начала раунда люди не получают урона от падения
19. Когда играют 1-2 зомби, сила отбрасывания равна 35%
==================================================================================
Changelog -- 1.3
==================================================================================
1.  VIP игроки получают 25 дополнительных единиц здоровья, будучи людьми
2.  В чате закрыта уязвимость, связанная с использованием cstrike_english.txt
3.  Перебалансированы некоторые экстра-итемы
4.  Добавлена возможность заражать с 1 удара
5.  Если есть немезида, покупка "Смертельной пули" запрещена
6.  Здоровье зомби незначительно уменьшено
7.  Теперь первые зомби в режиме "Массовое заражение" получают 2х здоровье
8.  Меню покупок(BuyMenu) теперь бесплатно, но только .amxx
==================================================================================
Changelog -- 1.2
==================================================================================
1.  Добавлен свой коэффициент получения ОП для випов(+25%)
2.  DeathMsg заражения изменен: отображается убийство ножом не в голову
3.  Сделан свой menufront(amxmodmenu)
4.  Мульти-инфекция теперь вызывается как обычный режим заражения
5.  Добавлена поддержка AmxModX 1.8.3
6.  Удалены все hud сообщения, кроме информера
7.  Разделение цен на покупку патронов разного типа
8.  Возможность покупать патроны в кастомных оружиях
9.  Увеличенное количество патронов в запасе(+50%)
10. Новый код заражения: сперва нужно "убить" человека
==================================================================================
 Changelog -- 1.1
==================================================================================
1.  ПНВ отключается при смерти
2.  Исправлено моргание световой гранаты и фонарика в ПНВ
3.  При завершении раунда, завершается и отсчет до первого зомби
4.  ПНВ более тусклый
5.  Добавлен туман
6.  Удалены лишние квары
7.  Добавлен нейтив, показывающий префикс
8.  Добавлена музыка в начале раунда
9.  При первом заражении дается 7 секунд на выбор класса
10. Добавлена вторая валюта - Души
11. Души ограничены(для об. игроков - 16, для VIP игроков - 24)
12. Добавлен нейтив для проверки на наличие VIP статуса
13. VIP статус отображается в таблице игроков [TAB]
14. Добавлена экстра "Цепное заражение", "Смертельная пуля"
15. Переписана экстра "M4A1 Gold", "Deagle Gold"
16. Обновлено меню покупок под две валюты
17. Переписан код добавления предметов в меню покупок
18. В меню покупок добавлен раздел для VIP игроков
19. Добавлен чат с разделением команд(Zombie/Human) и отображением статуса VIP
20. Удалены режимы "Куча на кучу" и "Чума"
==================================================================================
 Changelog -- END
=================================================================================*/

#include <amxmodx>
#include <amxmisc>
#include <cstrike>
#include <engine>
#include <fakemeta>
#include <hamsandwich>
#include <reapi>
#include <xs>

/*================================================================================
 [Constants, Offsets, Macros]
=================================================================================*/

// Plugin Version
new const PLUGIN_VERSION[] = "3.0"

// Customization files
new const ZP_CUSTOMIZATION_FILE[] = "zombienightmare.ini"

// Limiters for stuff not worth making dynamic arrays out of (increase if needed)
const MAX_CSDM_SPAWNS = 128
const MAX_STATS_SAVED = 64

// Customization file sections
enum {
	SECTION_NONE = 0,
	SECTION_GENERAL,
	SECTION_ACCESS_FLAGS,
	SECTION_PLAYER_MODELS,
	SECTION_WEAPON_MODELS,
	SECTION_GRENADE_SPRITES,
	SECTION_SOUNDS,
	SECTION_AMBIENCE_SOUNDS,
	SECTION_BUY_MENU_WEAPONS,
	SECTION_EXTRA_ITEMS_WEAPONS,
	SECTION_HARD_CODED_ITEMS_COSTS,
	SECTION_WEATHER_EFFECTS,
	SECTION_SKY,
	SECTION_LIGHTNING,
	SECTION_ZOMBIE_DECALS,
	SECTION_KNOCKBACK,
	SECTION_OBJECTIVE_ENTS,
	SECTION_SVC_BAD
}

// Access flags
enum {
	ACCESS_ENABLE_MOD = 0,
	ACCESS_ADMIN_MENU,
	ACCESS_MODE_INFECTION,
	ACCESS_MODE_MULTI,
	ACCESS_MAKE_ZOMBIE,
	ACCESS_MAKE_HUMAN,
	ACCESS_RESPAWN_PLAYERS,
	ACCESS_ADMIN_MODELS,
	ACCESS_VIP,
	MAX_ACCESS_FLAGS
}

// Task offsets
enum (+= 100) {
	TASK_MODEL = 2000,
	TASK_TEAM,
	TASK_SPAWN,
	TASK_BLOOD,
	TASK_AURA,
	TASK_BURN,
	TASK_FLASH,
	TASK_CHARGE,
	TASK_SHOWHUD,
	TASK_MAKEZOMBIE,
	TASK_THUNDER_PRE,
	TASK_THUNDER,
	TASK_AMBIENCESOUNDS,
	TASK_COUNTDOWN
}

// IDs inside tasks
#define ID_MODEL (taskid - TASK_MODEL)
#define ID_TEAM (taskid - TASK_TEAM)
#define ID_SPAWN (taskid - TASK_SPAWN)
#define ID_BLOOD (taskid - TASK_BLOOD)
#define ID_AURA (taskid - TASK_AURA)
#define ID_BURN (taskid - TASK_BURN)
#define ID_FLASH (taskid - TASK_FLASH)
#define ID_CHARGE (taskid - TASK_CHARGE)
#define ID_SHOWHUD (taskid - TASK_SHOWHUD)

// BP Ammo Refill task
#define REFILL_WEAPONID args[0]

// For weapon buy menu handlers
#define WPN_STARTID g_menu_data[id][1]
#define WPN_MAXIDS ArraySize(g_primary_items)
#define WPN_SELECTION (g_menu_data[id][1]+key)
#define WPN_AUTO_ON g_menu_data[id][2]
#define WPN_AUTO_PRI g_menu_data[id][3]
#define WPN_AUTO_SEC g_menu_data[id][4]

// For player list menu handlers
#define PL_ACTION g_menu_data[id][0]

// For remembering menu pages
#define MENU_PAGE_ZCLASS g_menu_data[id][5]
#define MENU_PAGE_EXTRAS g_menu_data[id][6]
#define MENU_PAGE_PLAYERS g_menu_data[id][7]

// For extra items menu handlers
#define EXTRAS_CUSTOM_STARTID (EXTRA_WEAPONS_STARTID + ArraySize(g_extraweapon_names))

// Menu selections
const MENU_KEY_AUTOSELECT = 7
const MENU_KEY_BACK = 7
const MENU_KEY_NEXT = 8
const MENU_KEY_EXIT = 9

// Hard coded extra items
enum {
	EXTRA_NVISION = 0,
	EXTRA_ANTIDOTE,
	EXTRA_INFBOMB,
	EXTRA_WEAPONS_STARTID
}

// Game modes
enum {
	MODE_NONE = 0,
	MODE_INFECTION,
	MODE_MULTI,
	MODE_CUSTOM
}

// ZP Teams
const ZP_TEAM_NO_ONE = 0
const ZP_TEAM_ANY = 0
const ZP_TEAM_ZOMBIE = (1<<0)
const ZP_TEAM_HUMAN = (1<<1)

// Zombie classes
const ZCLASS_NONE = -1

// HUD messages
const Float:HUD_EVENT_X = -1.0
const Float:HUD_EVENT_Y = 0.17
const Float:HUD_INFECT_X = 0.02
const Float:HUD_INFECT_Y = 0.27
const Float:HUD_SPECT_X = -1.0
const Float:HUD_SPECT_Y = 0.76
const Float:HUD_STATS_X = 1.0 // 0.02
const Float:HUD_STATS_Y = 0.25 // 0.92
const HUD_STATS_COLOR_R = 0
const HUD_STATS_COLOR_G = 200
const HUD_STATS_COLOR_B = 0

// Hack to be able to use Ham_Player_ResetMaxSpeed (by joaquimandrade)
new Ham:Ham_Player_ResetMaxSpeed = Ham_Item_PreFrame

// CS Player PData Offsets (win32)
const PDATA_SAFE = 2
const OFFSET_PAINSHOCK = 108 // ConnorMcLeod
const OFFSET_CSTEAMS = 114
const OFFSET_CSMONEY = 115
const OFFSET_CSMENUCODE = 205
const OFFSET_FLASHLIGHT_BATTERY = 244
const OFFSET_CSDEATHS = 444
const OFFSET_MODELINDEX = 491 // Orangutanz
const OFFSET_NEXTATTACK = 83

// CS Player CBase Offsets (win32)
const OFFSET_ACTIVE_ITEM = 373

// CS Weapon CBase Offsets (win32)
const OFFSET_WEAPONOWNER = 41

// Linux diff's
const OFFSET_LINUX = 5 // offsets 5 higher in Linux builds
const OFFSET_LINUX_WEAPONS = 4 // weapon offsets are only 4 steps higher on Linux

// CS Teams
enum {
	FM_CS_TEAM_UNASSIGNED = 0,
	FM_CS_TEAM_T,
	FM_CS_TEAM_CT,
	FM_CS_TEAM_SPECTATOR
}
new const CS_TEAM_NAMES[][] = { "UNASSIGNED", "TERRORIST", "CT", "SPECTATOR" }

// Some constants
const UNIT_SECOND = (1<<12);
const IMPULSE_FLASHLIGHT = 100;
const STEPTIME_SILENT = 999;
const FFADE_IN = 0x0000;
const FFADE_STAYOUT = 0x0004;
const PEV_SPEC_TARGET = pev_iuser2;

// Max BP ammo for weapons
new const AMMOCOST[] = {
	0, // N--
	2, // p228
	0, // N--
	3, // scout
	0, // N--
	3, // xm1014
	0, // N--
	1, // mac10
	3, // aug
	0, // N--
	1, // elite
	2, // fiveseven
	1, // ump45
	4, // sg550
	3, // galil
	3, // famas
	1, // usp
	1, // glock18
	5, // awp
	1, // mp5navy
	5, // m249
	3, // m3
	3, // m4a1
	1, // tmp
	4, // g3sg1
	0, // N--
	2, // deagle
	3, // sg552
	3, // ak47
	0, // N--
	2 // p90
}

new const MAXBPAMMO[] = { -1, 78, -1, 135, 1, 48, 1, 150, 135, 1, 180, 150, 150, 135, 135, 135, 150, 180,
			45, 180, 300, 48, 135, 180, 135, 2, 52, 135, 135, -1, 150 }

// Max Clip for weapons
new const MAXCLIP[] = { -1, 13, -1, 10, -1, 7, -1, 30, 30, -1, 30, 20, 25, 30, 35, 25, 12, 20,
			10, 30, 100, 8, 30, 30, 20, -1, 7, 30, 30, -1, 50 }

// Amount of ammo to give when buying additional clips for weapons
new const BUYAMMO[] = { -1, 13, -1, 30, -1, 8, -1, 12, 30, -1, 30, 50, 12, 30, 30, 30, 12, 30,
			10, 30, 30, 8, 30, 30, 30, -1, 7, 30, 30, -1, 50 }

// Ammo IDs for weapons
new const AMMOID[] = { -1, 9, -1, 2, 12, 5, 14, 6, 4, 13, 10, 7, 6, 4, 4, 4, 6, 10,
			1, 10, 3, 5, 4, 10, 2, 11, 8, 4, 2, -1, 7 }

// Offsets for buyammo code
new const OFFSET_AMMO[] = { 0, 385, 0, 378, 0, 381, 0, 382, 380, 0, 386, 383, 382, 380, 380, 380,
			382, 386, 377, 386, 379, 381, 380, 386, 378, 0, 384, 380, 378, 0, 383 }

// Ammo Type Names for weapons
new const AMMOTYPE[][] = { "", "357sig", "", "762nato", "", "buckshot", "", "45acp", "556nato", "", "9mm", "57mm", "45acp",
			"556nato", "556nato", "556nato", "45acp", "9mm", "338magnum", "9mm", "556natobox", "buckshot",
			"556nato", "9mm", "762nato", "", "50ae", "556nato", "762nato", "", "57mm" }

// Weapon IDs for ammo types
new const AMMOWEAPON[] = { 0, CSW_AWP, CSW_SCOUT, CSW_M249, CSW_AUG, CSW_XM1014, CSW_MAC10, CSW_FIVESEVEN, CSW_DEAGLE,
			CSW_P228, CSW_ELITE, CSW_FLASHBANG, CSW_HEGRENADE, CSW_SMOKEGRENADE, CSW_C4 }

// Primary and Secondary Weapon Names
new const WEAPONNAMES[][] = { "", "P228 Compact", "", "Schmidt Scout", "", "XM1014 M4", "", "Ingram MAC-10", "Steyr AUG A1",
			"", "Dual Elite Berettas", "FiveseveN", "UMP 45", "SG-550 Auto-Sniper", "IMI Galil", "Famas",
			"USP .45 ACP Tactical", "Glock 18C", "AWP Magnum Sniper", "MP5 Navy", "M249 Para Machinegun",
			"M3 Super 90", "M4A1 Carbine", "Schmidt TMP", "G3SG1 Auto-Sniper", "", "Desert Eagle .50 AE",
			"SG-552 Commando", "AK-47 Kalashnikov", "", "ES P90" }

// Weapon entity names
new const WEAPONENTNAMES[][] = { "", "weapon_p228", "", "weapon_scout", "weapon_hegrenade", "weapon_xm1014", "weapon_c4", "weapon_mac10",
			"weapon_aug", "weapon_smokegrenade", "weapon_elite", "weapon_fiveseven", "weapon_ump45", "weapon_sg550",
			"weapon_galil", "weapon_famas", "weapon_usp", "weapon_glock18", "weapon_awp", "weapon_mp5navy", "weapon_m249",
			"weapon_m3", "weapon_m4a1", "weapon_tmp", "weapon_g3sg1", "weapon_flashbang", "weapon_deagle", "weapon_sg552",
			"weapon_ak47", "weapon_knife", "weapon_p90" }

// CS sounds
new const sound_flashlight[] = "items/flashlight1.wav"
new const sound_buyammo[] = "items/9mmclip1.wav"
new const sound_armorhit[] = "player/bhit_helmet-1.wav"

// Explosion radius for custom grenades
const Float:NADE_EXPLOSION_RADIUS = 240.0

// HACK: pev_ field used to store additional ammo on weapons
const PEV_ADDITIONAL_AMMO = pev_iuser1

// HACK: pev_ field used to store custom nade types and their values
const PEV_NADE_TYPE = pev_flTimeStepSound
const NADE_TYPE_INFECTION = 1111
const NADE_TYPE_NAPALM = 2222
const NADE_TYPE_FROST = 3333
const NADE_TYPE_FLARE = 4444
const PEV_FLARE_COLOR = pev_punchangle
const PEV_FLARE_DURATION = pev_flSwimTime

// Weapon bitsums
const PRIMARY_WEAPONS_BIT_SUM = (1<<CSW_SCOUT)|(1<<CSW_XM1014)|(1<<CSW_MAC10)|(1<<CSW_AUG)|(1<<CSW_UMP45)|(1<<CSW_SG550)|(1<<CSW_GALIL)|(1<<CSW_FAMAS)|(1<<CSW_AWP)|(1<<CSW_MP5NAVY)|(1<<CSW_M249)|(1<<CSW_M3)|(1<<CSW_M4A1)|(1<<CSW_TMP)|(1<<CSW_G3SG1)|(1<<CSW_SG552)|(1<<CSW_AK47)|(1<<CSW_P90)
const SECONDARY_WEAPONS_BIT_SUM = (1<<CSW_P228)|(1<<CSW_ELITE)|(1<<CSW_FIVESEVEN)|(1<<CSW_USP)|(1<<CSW_GLOCK18)|(1<<CSW_DEAGLE)

// Allowed weapons for zombies (added grenades/bomb for sub-plugin support, since they shouldn't be getting them anyway)
const ZOMBIE_ALLOWED_WEAPONS_BITSUM = (1<<CSW_KNIFE)|(1<<CSW_HEGRENADE)|(1<<CSW_FLASHBANG)|(1<<CSW_SMOKEGRENADE)|(1<<CSW_C4)

// Classnames for separate model entities
new const MODEL_ENT_CLASSNAME[] = "player_model"
new const WEAPON_ENT_CLASSNAME[] = "weapon_model"

// Menu keys
const KEYSMENU = MENU_KEY_1|MENU_KEY_2|MENU_KEY_3|MENU_KEY_4|MENU_KEY_5|MENU_KEY_6|MENU_KEY_7|MENU_KEY_8|MENU_KEY_9|MENU_KEY_0

// Ambience Sounds
enum
{
	AMBIENCE_SOUNDS_INFECTION = 0,
	MAX_AMBIENCE_SOUNDS
}

// Admin menu actions
enum
{
	ACTION_ZOMBIEFY_HUMANIZE = 0,
	ACTION_RESPAWN_PLAYER,
	ACTION_MODE_MULTI
}

// Custom forward return values
const ZP_PLUGIN_HANDLED = 97

/*================================================================================
 [Global Variables]
=================================================================================*/

// Player vars
new g_zombie[33] // is zombie
new g_firstzombie[33] // is first zombie
new g_lastzombie[33] // is last zombie
new g_lasthuman[33] // is last human
new g_frozen[33] // is frozen (can't move)
new g_frozen_v_angle[33][3] // frozen view angles
new g_instantinfect[33] // has ability to infect in 1 hit
new Float:g_frozen_gravity[33] // store previous gravity when frozen
new g_nodamage[33] // has spawn protection
new g_respawn_as_zombie[33] // should respawn as zombie
new g_nvision[33] // has night vision
new g_nvisionenabled[33] // has night vision turned on
new g_zombieclass[33] // zombie class
new g_zombieclassnext[33] // zombie class for next infection
new g_flashlight[33] // has custom flashlight turned on
new g_flashbattery[33] = { 100, ... } // custom flashlight battery
new g_canbuy[33] // is allowed to buy a new weapon through the menu
new g_ammopacks[33] // ammo pack count
new g_souls[33] // soul count
new g_return_money[33][2] // ammo pack return
new g_damagedealt_human[33] // damage dealt as human (used to calculate ammo packs reward)
new g_damagedealt_zombie[33] // damage dealt as zombie (used to calculate ammo packs reward)
new Float:g_lastleaptime[33] // time leap was last used
new Float:g_lastflashtime[33] // time flashlight was last toggled
new g_playermodel[33][32] // current model's short name [player][model]
new g_playermodelbody[33]
new g_menu_data[33][8] // data for some menu handlers
new g_ent_playermodel[33] // player model entity
new g_ent_weaponmodel[33] // weapon model entity
new g_burning_duration[33] // burning task duration
new Float:g_buytime[33] // used to calculate custom buytime
new Float:g_gametime_infect[33] // used to calculate time between first time infection and first time zombie selection
new bool:g_hasclass[33][33] // if player has bought the class
new g_knife_weaponkey[33] // knife's pev_impulse weaponkey
new g_lastdhud[33] // used to block dhud draw

// Countdown sounds
new g_cdsounds_enabled // If CD sounds are enabled
new g_cd[14][] = {
	"zn/1.wav", "zn/2.wav", "zn/3.wav", "zn/4.wav", "zn/5.wav", "zn/6.wav", "zn/7.wav", "zn/8.wav", "zn/9.wav",
	"zn/10.wav", "zn/remaining.wav", "zn/seconds.wav", "zn/15.wav", "zn/20.wav"
}

// Game vars
new g_newround // new round starting
new g_endround // round ended
new g_modestarted // mode fully started
new g_seconds // time before infect
new g_scorezombies, g_scorehumans, g_gamecommencing // team scores
new g_spawnCount, g_spawnCount2 // available spawn points counter
new Float:g_spawns[MAX_CSDM_SPAWNS][3], Float:g_spawns2[MAX_CSDM_SPAWNS][3] // spawn points data
new g_lights_i // lightning current lights counter
new g_lights_cycle[32] // current lightning cycle
new g_lights_cycle_len // lightning cycle length
new Float:g_models_targettime // for adding delays between Model Change messages
new Float:g_teams_targettime // for adding delays between Team Change messages
new g_trailSpr, g_exploSpr, g_flameSpr, g_smokeSpr, g_glassSpr // grenade sprites
new g_modname[32] // for formatting the mod name
new g_freezetime // whether CS's freeze time is on
new g_maxplayers // max players counter
new g_czero // whether we are running on a CZ server
new g_hamczbots // whether ham forwards are registered for CZ bots
new g_fwSpawn, g_fwPrecacheSound // spawn and precache sound forward handles
new g_infbombcounter, g_antidotecounter // to limit buying some items
new g_arrays_created // to prevent stuff from being registered before initializing arrays
new g_lastplayerleaving // flag for whenever a player leaves and another takes his place
new g_switchingteam // flag for whenever a player's team change emessage is sent
new g_buyzone_ent // custom buyzone entity
new Float:g_gametime // current get_gametime()
new g_currentmode // current gamemode

// Message IDs vars
new g_msgScoreInfo, g_msgNVGToggle, g_msgScoreAttrib, g_msgAmmoPickup, g_msgScreenFade,
g_msgDeathMsg, g_msgSetFOV, g_msgFlashlight, g_msgFlashBat, g_msgTeamInfo, g_msgDamage,
g_msgHideWeapon, g_msgCrosshair, g_msgScreenShake, g_msgCurWeapon, g_msgFog

// Some forward handlers
new g_fwRoundStart, g_fwRoundEnd, g_fwUserInfected_pre, g_fwUserInfected_post,
g_fwUserHumanized_pre, g_fwUserHumanized_post, g_fwUserInfect_attempt,
g_fwUserHumanize_attempt, g_fwExtraItemSelected, g_fwUserUnfrozen,
g_fwUserLastZombie, g_fwUserLastHuman, g_fwDummyResult

// Extra Items vars
new Array:g_extraitem_name // caption
new Array:g_extraitem_cost // cost
new Array:g_extraitem_team // team
new g_extraitem_i // loaded extra items counter

// Gamemodes vars
new Array:g_gamemode_name // caption
new Array:g_gamemode_lighting // lighting
new g_gamemode_i // loaded gamemodes counter

// Zombie Classes vars
new Array:g_zclass_name // caption
new Array:g_zclass_modelsstart // start position in models array
new Array:g_zclass_modelsend // end position in models array
new Array:g_zclass_playermodel // player models array
new Array:g_zclass_modelindex // model indices array
new Array:g_zclass_clawmodel // claw model
new Array:g_zclass_hp // health
new Array:g_zclass_spd // speed
new Array:g_zclass_grav // gravity
new Array:g_zclass_kb // knockback
new Array:g_zclass_vip // vip
new Array:g_zclass_cost1 // ammo cost
new Array:g_zclass_cost2 // souls cost
new g_zclass_i // loaded zombie classes counter

// For buyammo code
new g_iCurrentAmmoMax[33], g_iCurrentAmmoCost[33], g_iCurrentAmmoValue[33]
new g_fwBuyAmmoPrimary, g_fwBuyAmmoSecondary

// Customization vars
new g_access_flag[MAX_ACCESS_FLAGS], Array:model_human, Array:model_admin_zombie,
Array:model_admin_human, Array:g_modelindex_human, g_same_models_for_all,
Array:g_modelindex_admin_zombie, Array:g_modelindex_admin_human, model_vknife_human[64],
model_grenade_infect[64], model_grenade_fire[64], model_grenade_frost[64], model_grenade_flare[64],
model_pgrenade_frost[64], model_vknife_admin_human[64], model_vknife_admin_zombie[64],
sprite_grenade_trail[64], sprite_grenade_ring[64], sprite_grenade_fire[64], sprite_grenade_smoke[64],
sprite_grenade_glass[64], Array:sound_win_zombies, Array:sound_round_start_ismp3,
Array:sound_win_humans, Array:sound_win_no_one, Array:sound_win_zombies_ismp3, Array:sound_round_start,
Array:sound_win_humans_ismp3, Array:sound_win_no_one_ismp3, Array:zombie_infect,
Array:zombie_idle, Array:zombie_pain, Array:zombie_die, Array:zombie_fall,
Array:zombie_miss_wall, Array:zombie_hit_normal, Array:zombie_hit_stab, g_ambience_rain,
Array:zombie_idle_last, Array:sound_multi, Array:grenade_infect, Array:grenade_infect_player, Array:grenade_fire,
Array:grenade_fire_player, model_pgrenade_flare[64], Array:grenade_frost, Array:grenade_frost_player,
Array:grenade_frost_break, model_wgrenade_frost[64], Array:grenade_flare, Array:sound_antidote,
Array:sound_thunder, g_ambience_sounds[MAX_AMBIENCE_SOUNDS], Array:sound_ambience1,
Array:sound_ambience1_duration, model_wgrenade_flare[64], Array:sound_ambience1_ismp3,
Array:g_primary_items, Array:g_secondary_items,
Array:g_additional_items, model_wgrenade_fire[64], Array:g_primary_weaponids, Array:g_secondary_weaponids,
Array:g_extraweapon_names, Array:g_extraweapon_items, Array:g_extraweapon_costs,
g_extra_costs2[EXTRA_WEAPONS_STARTID], g_ambience_snow, g_ambience_fog, g_fog_density[10],
g_fog_color[3], g_sky_enable, Array:g_sky_names, Array:lights_thunder, Array:zombie_decals,
Array:g_objective_ents, Float:g_modelchange_delay, g_set_modelindex_offset, g_handle_models_on_separate_ent,
Float:kb_weapon_power[31] = { -1.0, ... }, Array:zombie_miss_slash, g_force_consistency,
model_pknife_human[64], model_pknife_admin_human[64], model_pgrenade_fire[64]

// CVAR pointers
new cvar_zombiefov, cvar_zombiefirsthp, cvar_buyzonetime, cvar_zombiesurvreward, cvar_humansurvreward,
cvar_removemoney, cvar_thunder, cvar_zombiebonushp, cvar_deathmatch, cvar_hitzones, cvar_humanhp,
cvar_flashsize, cvar_ammodamage_human, cvar_ammodamage_zombie, cvar_zombiearmor,
cvar_humanspd, cvar_flashdrain, cvar_zombiebleeding, cvar_removedoors, cvar_customflash, cvar_randspawn,
cvar_infammo, cvar_ammoinfect, cvar_ammokill, cvar_huddisplay, cvar_knockbackpower, cvar_freezeduration,
cvar_triggered, cvar_flashcharge, cvar_firegrenades, cvar_frostgrenades, cvar_logcommands,
cvar_humangravity, cvar_humangravity_vip, cvar_spawnprotection, cvar_flareduration, cvar_zclasses,
cvar_extraitems, cvar_showactivity, cvar_humanlasthp, cvar_warmup, cvar_flashdist, cvar_flarecolor,
cvar_fireduration, cvar_firedamage, cvar_flaregrenades, cvar_knockbackducking, cvar_knockbackdamage,
cvar_knockbackzvel, cvar_multiratio, cvar_extraantidote, cvar_extraweapons, cvar_extranvision,
cvar_nvggive, cvar_botquota, cvar_buycustom, cvar_zombiepainfree, cvar_fireslowdown, cvar_extrainfbomb,
cvar_knockback, cvar_fragsinfect, cvar_fragskill, cvar_humanarmor, cvar_zombiesilent, cvar_removedropped,
cvar_blocksuicide, cvar_knockbackdist, cvar_leapzombies, cvar_leapzombiesforce, cvar_retammo,
cvar_leapzombiesheight, cvar_leapzombiescooldown, cvar_respawnonsuicide, cvar_respawnafterlast,
cvar_statssave, cvar_dmg_frozen, cvar_multiminplayers, cvar_adminmodelshuman, cvar_adminmodelszombie,
cvar_zmlowknockback, cvar_blockpushables, cvar_respawnworldspawnkill, cvar_infectionscreenfade,
cvar_infectionscreenshake, cvar_infectionsparkle, cvar_infectiontracers, cvar_infectionparticles,
cvar_infbomblimit, cvar_flashshowall, cvar_allowrespawninfection, cvar_flashcolor[3],
cvar_ammodamage_human_vip, cvar_hudicons, cvar_respawnzomb, cvar_respawnhum, cvar_startammopacks,
cvar_randweapons, cvar_antidotelimit, cvar_adminknifemodelshuman, cvar_adminknifemodelszombie,
cvar_vipinfammo, cvar_gamemode_chance, cvar_gamemode_minpl

// Cached stuff for players
new g_isconnected[33] // whether player is connected
new g_isalive[33] // whether player is alive
new g_isbot[33] // whether player is a bot
new g_currentweapon[33] // player's current weapon id
new g_playername[33][32] // player's name
new Float:g_zombie_spd[33] // zombie class speed
new Float:g_zombie_knockback[33] // zombie class knockback
new g_zombie_classname[33][32] // zombie class name
#define is_user_valid_connected(%1) (1 <= %1 <= g_maxplayers && g_isconnected[%1])
#define is_user_valid_alive(%1) (1 <= %1 <= g_maxplayers && g_isalive[%1])
#define is_user_valid(%1) (1 <= %1 <= g_maxplayers)

// Cached CVARs
new g_cached_customflash, g_cached_zombiesilent, g_cached_leapzombies, Float:g_cached_leapzombiescooldown,
Float:g_cached_buytime

// Associated arrays
new Trie:gSavedAmmo
new Trie:gSavedSouls

/*================================================================================
 [Natives, Precache and Init]
=================================================================================*/

public plugin_natives() {
	// Player specific natives
	register_native("zp_get_user_vip", "native_get_user_vip", 1)
	register_native("zp_get_user_zombie", "native_get_user_zombie", 1)
	register_native("zp_get_user_first_zombie", "native_get_user_first_zombie", 1)
	register_native("zp_get_user_last_zombie", "native_get_user_last_zombie", 1)
	register_native("zp_get_user_last_human", "native_get_user_last_human", 1)
	register_native("zp_get_user_zombie_class", "native_get_user_zombie_class", 1)
	register_native("zp_get_user_next_class", "native_get_user_next_class", 1)
	register_native("zp_set_user_zombie_class", "native_set_user_zombie_class", 1)
	register_native("zn_get_user_zclass_access", "native_get_user_zclass_access", 1)
	register_native("zn_set_user_zclass_access", "native_set_user_zclass_access", 1)
	register_native("zp_get_user_souls", "native_get_user_souls", 1)
	register_native("zp_set_user_souls", "native_set_user_souls", 1)
	register_native("zp_get_user_ammo_packs", "native_get_user_ammo_packs", 1)
	register_native("zp_set_user_ammo_packs", "native_set_user_ammo_packs", 1)
	register_native("zp_get_zombie_maxhealth", "native_get_zombie_maxhealth", 1)
	register_native("zp_get_user_batteries", "native_get_user_batteries", 1)
	register_native("zp_set_user_batteries", "native_set_user_batteries", 1)
	register_native("zp_get_user_nightvision", "native_get_user_nightvision", 1)
	register_native("zp_set_user_nightvision", "native_set_user_nightvision", 1)
	register_native("zp_infect_user", "native_infect_user", 1)
	register_native("zp_disinfect_user", "native_disinfect_user", 1)
	register_native("zp_respawn_user", "native_respawn_user", 1)
	register_native("zp_force_buy_extra_item", "native_force_buy_extra_item", 1)
	register_native("zp_override_user_model", "native_override_user_model", 1)
	register_native("zp_set_user_instainf", "native_set_user_instainf", 1)
	register_native("zp_set_user_knife_weaponkey", "native_set_user_knife_weaponkey", 1)
	
	// Round natives
	register_native("zp_has_round_started", "native_has_round_started", 1)
	register_native("zp_get_zombie_count", "native_get_zombie_count", 1)
	register_native("zp_get_human_count", "native_get_human_count", 1)
	
	// External additions natives
	register_native("zp_register_extra_item", "native_register_extra_item", 1)
	register_native("zn_register_zombie_class", "native_register_zombie_class", 1)
	register_native("zn_register_gamemode", "native_register_gamemode", 1)
	register_native("zp_get_extra_item_id", "native_get_extra_item_id", 1)
	register_native("zp_get_zombie_class_id", "native_get_zombie_class_id", 1)
	register_native("zn_get_user_class", "native_get_user_class", 1)
	
	// Buy ammo natives
	register_native("zp_set_ammo_value", "native_set_ammo_value", 1)
	register_native("zp_set_ammo_cost", "native_set_ammo_cost", 1)
	register_native("zp_set_ammo_max", "native_set_ammo_max", 1)
	
	// Other natives
	register_native("zp_get_server_prefix", "native_get_prefix", 1)
}

public plugin_precache() {
	// Register earlier to show up in plugins list properly after plugin disable/error at loading
	register_plugin("Zombie Nightmare", PLUGIN_VERSION, "MeRcyLeZZ / baarsik")
	
	// Initialize a few dynamically sized arrays (alright, maybe more than just a few...)
	model_human = ArrayCreate(32, 1)
	model_admin_human = ArrayCreate(32, 1)
	model_admin_zombie = ArrayCreate(32, 1)
	g_modelindex_human = ArrayCreate(1, 1)
	g_modelindex_admin_human = ArrayCreate(1, 1)
	g_modelindex_admin_zombie = ArrayCreate(1, 1)
	sound_round_start = ArrayCreate(64, 1)
	sound_round_start_ismp3 = ArrayCreate(1, 1)
	sound_win_zombies = ArrayCreate(64, 1)
	sound_win_zombies_ismp3 = ArrayCreate(1, 1)
	sound_win_humans = ArrayCreate(64, 1)
	sound_win_humans_ismp3 = ArrayCreate(1, 1)
	sound_win_no_one = ArrayCreate(64, 1)
	sound_win_no_one_ismp3 = ArrayCreate(1, 1)
	zombie_infect = ArrayCreate(64, 1)
	zombie_pain = ArrayCreate(64, 1)
	zombie_die = ArrayCreate(64, 1)
	zombie_fall = ArrayCreate(64, 1)
	zombie_miss_slash = ArrayCreate(64, 1)
	zombie_miss_wall = ArrayCreate(64, 1)
	zombie_hit_normal = ArrayCreate(64, 1)
	zombie_hit_stab = ArrayCreate(64, 1)
	zombie_idle = ArrayCreate(64, 1)
	zombie_idle_last = ArrayCreate(64, 1)
	sound_multi = ArrayCreate(64, 1)
	grenade_infect = ArrayCreate(64, 1)
	grenade_infect_player = ArrayCreate(64, 1)
	grenade_fire = ArrayCreate(64, 1)
	grenade_fire_player = ArrayCreate(64, 1)
	grenade_frost = ArrayCreate(64, 1)
	grenade_frost_player = ArrayCreate(64, 1)
	grenade_frost_break = ArrayCreate(64, 1)
	grenade_flare = ArrayCreate(64, 1)
	sound_antidote = ArrayCreate(64, 1)
	sound_thunder = ArrayCreate(64, 1)
	sound_ambience1 = ArrayCreate(64, 1)
	sound_ambience1_duration = ArrayCreate(1, 1)
	sound_ambience1_ismp3 = ArrayCreate(1, 1)
	g_primary_items = ArrayCreate(32, 1)
	g_secondary_items = ArrayCreate(32, 1)
	g_additional_items = ArrayCreate(32, 1)
	g_primary_weaponids = ArrayCreate(1, 1)
	g_secondary_weaponids = ArrayCreate(1, 1)
	g_extraweapon_names = ArrayCreate(32, 1)
	g_extraweapon_items = ArrayCreate(32, 1)
	g_extraweapon_costs = ArrayCreate(1, 1)
	g_sky_names = ArrayCreate(32, 1)
	lights_thunder = ArrayCreate(32, 1)
	zombie_decals = ArrayCreate(1, 1)
	g_objective_ents = ArrayCreate(32, 1)
	g_extraitem_name = ArrayCreate(64, 1)
	g_extraitem_cost = ArrayCreate(1, 1)
	g_extraitem_team = ArrayCreate(1, 1)
	g_gamemode_name = ArrayCreate(32, 1)
	g_gamemode_lighting = ArrayCreate(2, 1)
	g_zclass_name = ArrayCreate(32, 1)
	g_zclass_modelsstart = ArrayCreate(1, 1)
	g_zclass_modelsend = ArrayCreate(1, 1)
	g_zclass_playermodel = ArrayCreate(32, 1)
	g_zclass_modelindex = ArrayCreate(1, 1)
	g_zclass_clawmodel = ArrayCreate(32, 1)
	g_zclass_hp = ArrayCreate(1, 1)
	g_zclass_spd = ArrayCreate(1, 1)
	g_zclass_grav = ArrayCreate(1, 1)
	g_zclass_kb = ArrayCreate(1, 1)
	g_zclass_vip = ArrayCreate(1, 1)
	g_zclass_cost1 = ArrayCreate(1, 1)
	g_zclass_cost2 = ArrayCreate(1, 1)
	
	// Allow registering stuff now
	g_arrays_created = true
	
	// Load customization data
	load_customization_from_files()
	
	new i, buffer[100]
	
	// Load up the hard coded extra items
	native_register_extra_item2("NightVision", g_extra_costs2[EXTRA_NVISION], ZP_TEAM_HUMAN)
	native_register_extra_item2("T-Virus Antidote", g_extra_costs2[EXTRA_ANTIDOTE], ZP_TEAM_ZOMBIE)
	native_register_extra_item2("Infection Bomb", g_extra_costs2[EXTRA_INFBOMB], ZP_TEAM_ZOMBIE)
	
	// Extra weapons
	for (i = 0; i < ArraySize(g_extraweapon_names); i++) {
		ArrayGetString(g_extraweapon_names, i, buffer, charsmax(buffer))
		native_register_extra_item2(buffer, ArrayGetCell(g_extraweapon_costs, i), ZP_TEAM_HUMAN)
	}
	
	// Custom player models
	for (i = 0; i < ArraySize(model_human); i++) {
		ArrayGetString(model_human, i, buffer, charsmax(buffer))
		format(buffer, charsmax(buffer), "models/player/%s/%s.mdl", buffer, buffer)
		ArrayPushCell(g_modelindex_human, engfunc(EngFunc_PrecacheModel, buffer))
		if (g_force_consistency == 1) force_unmodified(force_model_samebounds, {0,0,0}, {0,0,0}, buffer)
		if (g_force_consistency == 2) force_unmodified(force_exactfile, {0,0,0}, {0,0,0}, buffer)
		// Precache modelT.mdl files too
		copy(buffer[strlen(buffer)-4], charsmax(buffer) - (strlen(buffer)-4), "T.mdl")
		if (file_exists(buffer)) engfunc(EngFunc_PrecacheModel, buffer)
	}
	for (i = 0; i < ArraySize(model_admin_zombie); i++) {
		ArrayGetString(model_admin_zombie, i, buffer, charsmax(buffer))
		format(buffer, charsmax(buffer), "models/player/%s/%s.mdl", buffer, buffer)
		ArrayPushCell(g_modelindex_admin_zombie, engfunc(EngFunc_PrecacheModel, buffer))
		if (g_force_consistency == 1) force_unmodified(force_model_samebounds, {0,0,0}, {0,0,0}, buffer)
		if (g_force_consistency == 2) force_unmodified(force_exactfile, {0,0,0}, {0,0,0}, buffer)
		// Precache modelT.mdl files too
		copy(buffer[strlen(buffer)-4], charsmax(buffer) - (strlen(buffer)-4), "T.mdl")
		if (file_exists(buffer)) engfunc(EngFunc_PrecacheModel, buffer)
	}
	for (i = 0; i < ArraySize(model_admin_human); i++) {
		ArrayGetString(model_admin_human, i, buffer, charsmax(buffer))
		format(buffer, charsmax(buffer), "models/player/%s/%s.mdl", buffer, buffer)
		ArrayPushCell(g_modelindex_admin_human, engfunc(EngFunc_PrecacheModel, buffer))
		if (g_force_consistency == 1) force_unmodified(force_model_samebounds, {0,0,0}, {0,0,0}, buffer)
		if (g_force_consistency == 2) force_unmodified(force_exactfile, {0,0,0}, {0,0,0}, buffer)
		// Precache modelT.mdl files too
		copy(buffer[strlen(buffer)-4], charsmax(buffer) - (strlen(buffer)-4), "T.mdl")
		if (file_exists(buffer)) engfunc(EngFunc_PrecacheModel, buffer)
	}
	
	// Custom weapon models
	engfunc(EngFunc_PrecacheModel, model_vknife_human)
	engfunc(EngFunc_PrecacheModel, model_pknife_human)
	engfunc(EngFunc_PrecacheModel, model_grenade_infect)
	engfunc(EngFunc_PrecacheModel, model_grenade_fire)
	engfunc(EngFunc_PrecacheModel, model_pgrenade_fire)
	engfunc(EngFunc_PrecacheModel, model_wgrenade_fire)
	engfunc(EngFunc_PrecacheModel, model_grenade_frost)
	engfunc(EngFunc_PrecacheModel, model_pgrenade_frost)
	engfunc(EngFunc_PrecacheModel, model_wgrenade_frost)
	engfunc(EngFunc_PrecacheModel, model_grenade_flare)
	engfunc(EngFunc_PrecacheModel, model_pgrenade_flare)
	engfunc(EngFunc_PrecacheModel, model_wgrenade_flare)
	engfunc(EngFunc_PrecacheModel, model_vknife_admin_human)
	engfunc(EngFunc_PrecacheModel, model_pknife_admin_human)
	engfunc(EngFunc_PrecacheModel, model_vknife_admin_zombie)
	
	// Custom sprites for grenades
	g_trailSpr = engfunc(EngFunc_PrecacheModel, sprite_grenade_trail)
	g_exploSpr = engfunc(EngFunc_PrecacheModel, sprite_grenade_ring)
	g_flameSpr = engfunc(EngFunc_PrecacheModel, sprite_grenade_fire)
	g_smokeSpr = engfunc(EngFunc_PrecacheModel, sprite_grenade_smoke)
	g_glassSpr = engfunc(EngFunc_PrecacheModel, sprite_grenade_glass)
	
	// Custom sounds
	if(g_cdsounds_enabled) for(new i = 0; i < sizeof g_cd; i++) 
		engfunc(EngFunc_PrecacheSound, g_cd[i])
	for (i = 0; i < ArraySize(sound_round_start); i++) {
		ArrayGetString(sound_round_start, i, buffer, charsmax(buffer))
		if (ArrayGetCell(sound_round_start_ismp3, i)) {
			format(buffer, charsmax(buffer), "sound/%s", buffer)
			engfunc(EngFunc_PrecacheGeneric, buffer)
		}
		else engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(sound_win_zombies); i++) {
		ArrayGetString(sound_win_zombies, i, buffer, charsmax(buffer))
		if (ArrayGetCell(sound_win_zombies_ismp3, i)) {
			format(buffer, charsmax(buffer), "sound/%s", buffer)
			engfunc(EngFunc_PrecacheGeneric, buffer)
		}
		else engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(sound_win_humans); i++) {
		ArrayGetString(sound_win_humans, i, buffer, charsmax(buffer))
		if (ArrayGetCell(sound_win_humans_ismp3, i)) {
			format(buffer, charsmax(buffer), "sound/%s", buffer)
			engfunc(EngFunc_PrecacheGeneric, buffer)
		}
		else engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(sound_win_no_one); i++) {
		ArrayGetString(sound_win_no_one, i, buffer, charsmax(buffer))
		if (ArrayGetCell(sound_win_no_one_ismp3, i)) {
			format(buffer, charsmax(buffer), "sound/%s", buffer)
			engfunc(EngFunc_PrecacheGeneric, buffer)
		}
		else engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(zombie_infect); i++) {
		ArrayGetString(zombie_infect, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(zombie_pain); i++) {
		ArrayGetString(zombie_pain, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(zombie_die); i++) {
		ArrayGetString(zombie_die, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(zombie_fall); i++) {
		ArrayGetString(zombie_fall, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(zombie_miss_slash); i++) {
		ArrayGetString(zombie_miss_slash, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(zombie_miss_wall); i++) {
		ArrayGetString(zombie_miss_wall, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(zombie_hit_normal); i++) {
		ArrayGetString(zombie_hit_normal, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(zombie_hit_stab); i++) {
		ArrayGetString(zombie_hit_stab, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(zombie_idle); i++) {
		ArrayGetString(zombie_idle, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(zombie_idle_last); i++) {
		ArrayGetString(zombie_idle_last, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(sound_multi); i++) {
		ArrayGetString(sound_multi, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(grenade_infect); i++) {
		ArrayGetString(grenade_infect, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(grenade_infect_player); i++) {
		ArrayGetString(grenade_infect_player, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(grenade_fire); i++) {
		ArrayGetString(grenade_fire, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(grenade_fire_player); i++) {
		ArrayGetString(grenade_fire_player, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(grenade_frost); i++) {
		ArrayGetString(grenade_frost, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(grenade_frost_player); i++) {
		ArrayGetString(grenade_frost_player, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(grenade_frost_break); i++) {
		ArrayGetString(grenade_frost_break, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(grenade_flare); i++) {
		ArrayGetString(grenade_flare, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(sound_antidote); i++) {
		ArrayGetString(sound_antidote, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	for (i = 0; i < ArraySize(sound_thunder); i++) {
		ArrayGetString(sound_thunder, i, buffer, charsmax(buffer))
		engfunc(EngFunc_PrecacheSound, buffer)
	}
	
	// Ambience Sounds
	if (g_ambience_sounds[AMBIENCE_SOUNDS_INFECTION]) {
		for (i = 0; i < ArraySize(sound_ambience1); i++) {
			ArrayGetString(sound_ambience1, i, buffer, charsmax(buffer))
			if (ArrayGetCell(sound_ambience1_ismp3, i)) {
				format(buffer, charsmax(buffer), "sound/%s", buffer)
				engfunc(EngFunc_PrecacheGeneric, buffer)
			}
			else engfunc(EngFunc_PrecacheSound, buffer)
		}
	}
	
	// CS sounds (just in case)
	engfunc(EngFunc_PrecacheSound, sound_flashlight)
	engfunc(EngFunc_PrecacheSound, sound_buyammo)
	engfunc(EngFunc_PrecacheSound, sound_armorhit)
	
	// Fake Hostage (to force round ending)
	new ent
	ent = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, "hostage_entity"))
	if (pev_valid(ent)) {
		engfunc(EngFunc_SetOrigin, ent, Float:{8192.0,8192.0,8192.0})
		dllfunc(DLLFunc_Spawn, ent)
	}
	
	// Weather/ambience effects
	if (g_ambience_rain) engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, "env_rain"))
	if (g_ambience_snow) engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, "env_snow"))
	
	// Custom buyzone for all players
	g_buyzone_ent = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, "func_buyzone"))
	if (pev_valid(g_buyzone_ent)) {
		dllfunc(DLLFunc_Spawn, g_buyzone_ent)
		set_pev(g_buyzone_ent, pev_solid, SOLID_NOT)
	}
	
	// Prevent some entities from spawning
	g_fwSpawn = register_forward(FM_Spawn, "fw_Spawn")
	
	// Prevent hostage sounds from being precached
	g_fwPrecacheSound = register_forward(FM_PrecacheSound, "fw_PrecacheSound")
}

public plugin_init() {
	// No zombie classes?
	if (!g_zclass_i) set_fail_state("No zombie classes loaded!")
	
	// Language files
	register_dictionary("zombie_nightmare.txt")
	
	// Events
	register_event("HLTV", "event_round_start", "a", "1=0", "2=0")
	register_logevent("logevent_round_start",2, "1=Round_Start")
	register_logevent("logevent_round_end", 2, "1=Round_End")
	register_event("AmmoX", "event_ammo_x", "be")
	if (g_ambience_sounds[AMBIENCE_SOUNDS_INFECTION])
		register_event("30", "event_intermission", "a")
	
	// HAM Forwards
	RegisterHam(Ham_Spawn, "player", "fw_PlayerSpawn_Post", 1)
	RegisterHam(Ham_Killed, "player", "fw_PlayerKilled")
	RegisterHam(Ham_Killed, "player", "fw_PlayerKilled_Post", 1)
	RegisterHam(Ham_TakeDamage, "player", "fw_TakeDamage")
	RegisterHam(Ham_TakeDamage, "player", "fw_TakeDamage_Post", 1)
	RegisterHam(Ham_TraceAttack, "player", "fw_TraceAttack")
	RegisterHam(Ham_Player_ResetMaxSpeed, "player", "fw_ResetMaxSpeed_Post", 1)
	RegisterHam(Ham_Use, "func_tank", "fw_UseStationary")
	RegisterHam(Ham_Use, "func_tankmortar", "fw_UseStationary")
	RegisterHam(Ham_Use, "func_tankrocket", "fw_UseStationary")
	RegisterHam(Ham_Use, "func_tanklaser", "fw_UseStationary")
	RegisterHam(Ham_Use, "func_tank", "fw_UseStationary_Post", 1)
	RegisterHam(Ham_Use, "func_tankmortar", "fw_UseStationary_Post", 1)
	RegisterHam(Ham_Use, "func_tankrocket", "fw_UseStationary_Post", 1)
	RegisterHam(Ham_Use, "func_tanklaser", "fw_UseStationary_Post", 1)
	RegisterHam(Ham_Use, "func_pushable", "fw_UsePushable")
	RegisterHam(Ham_Touch, "weaponbox", "fw_TouchWeapon")
	RegisterHam(Ham_Touch, "armoury_entity", "fw_TouchWeapon")
	RegisterHam(Ham_Touch, "weapon_shield", "fw_TouchWeapon")
	RegisterHam(Ham_AddPlayerItem, "player", "fw_AddPlayerItem")
	for (new i = 1; i < sizeof WEAPONENTNAMES; i++)
		if (WEAPONENTNAMES[i][0]) RegisterHam(Ham_Item_Deploy, WEAPONENTNAMES[i], "fw_Item_Deploy_Post", 1)
	
	// FM Forwards
	register_forward(FM_ClientDisconnect, "fw_ClientDisconnect")
	register_forward(FM_ClientDisconnect, "fw_ClientDisconnect_Post", 1)
	register_forward(FM_ClientKill, "fw_ClientKill")
	register_forward(FM_EmitSound, "fw_EmitSound")
	if (!g_handle_models_on_separate_ent) register_forward(FM_SetClientKeyValue, "fw_SetClientKeyValue")
	register_forward(FM_ClientUserInfoChanged, "fw_ClientUserInfoChanged")
	register_forward(FM_GetGameDescription, "fw_GetGameDescription")
	register_forward(FM_SetModel, "fw_SetModel")
	RegisterHam(Ham_Think, "grenade", "fw_ThinkGrenade")
	register_forward(FM_PlayerPreThink, "fw_PlayerPreThink")
	register_forward(FM_UpdateClientData, "fw_UpdateClientData")
	RegisterHam(Ham_Player_Duck, "player", "fw_PlayerDuck") // Leap
	unregister_forward(FM_Spawn, g_fwSpawn)
	unregister_forward(FM_PrecacheSound, g_fwPrecacheSound)
	
	// Impulses
	register_impulse(100, "impulse_100")
	register_impulse(201, "impulse_201")
	
	// Client commands
	register_clcmd("say zpmenu", "clcmd_saymenu")
	register_clcmd("say /zpmenu", "clcmd_saymenu")
	register_clcmd("say unstuck", "clcmd_sayunstuck")
	register_clcmd("say /unstuck", "clcmd_sayunstuck")
	register_clcmd("buyammo1", "clcmd_buyammo_prim")
	register_clcmd("buyammo2", "clcmd_buyammo_sec")
	register_clcmd("chooseteam", "clcmd_changeteam")
	register_clcmd("jointeam", "clcmd_changeteam")
	register_clcmd("zp_give_ammo","cmd_give_ammo")
	register_clcmd("zp_give_souls","cmd_give_souls")
	register_clcmd("nightvision", "cmd_nightvision")
	register_clcmd("about", "clcmd_about")
	
	// Menus
	register_menu("Game Menu", KEYSMENU, "menu_game")
	register_menu("Server Menu", KEYSMENU, "menu_server")
	register_menu("Buy Menu 1", KEYSMENU, "menu_buy1")
	register_menu("Buy Menu 2", KEYSMENU, "menu_buy2")
	register_menu("Admin Menu", KEYSMENU, "menu_admin")
	
	// CS Buy Menus (to prevent zombies from buying)
	register_menucmd(register_menuid("#Buy", 1), 511, "menu_cs_buy")
	register_menucmd(register_menuid("BuyPistol", 1), 511, "menu_cs_buy")
	register_menucmd(register_menuid("BuyShotgun", 1), 511, "menu_cs_buy")
	register_menucmd(register_menuid("BuySub", 1), 511, "menu_cs_buy")
	register_menucmd(register_menuid("BuyRifle", 1), 511, "menu_cs_buy")
	register_menucmd(register_menuid("BuyMachine", 1), 511, "menu_cs_buy")
	register_menucmd(register_menuid("BuyItem", 1), 511, "menu_cs_buy")
	register_menucmd(-28, 511, "menu_cs_buy")
	register_menucmd(-29, 511, "menu_cs_buy")
	register_menucmd(-30, 511, "menu_cs_buy")
	register_menucmd(-32, 511, "menu_cs_buy")
	register_menucmd(-31, 511, "menu_cs_buy")
	register_menucmd(-33, 511, "menu_cs_buy")
	register_menucmd(-34, 511, "menu_cs_buy")
	
	// Admin commands
	register_concmd("zp_zombie", "cmd_zombie", _, "<target> - Turn someone into a Zombie", 0)
	register_concmd("zp_human", "cmd_human", _, "<target> - Turn someone back to Human", 0)
	register_concmd("zp_respawn", "cmd_respawn", _, "<target> - Respawn someone", 0)
	register_concmd("zp_multi", "cmd_multi", _, " - Start Multi Infection", 0)
	
	// Message IDs
	g_msgScoreInfo = get_user_msgid("ScoreInfo")
	g_msgTeamInfo = get_user_msgid("TeamInfo")
	g_msgDeathMsg = get_user_msgid("DeathMsg")
	g_msgScoreAttrib = get_user_msgid("ScoreAttrib")
	g_msgSetFOV = get_user_msgid("SetFOV")
	g_msgScreenFade = get_user_msgid("ScreenFade")
	g_msgScreenShake = get_user_msgid("ScreenShake")
	g_msgNVGToggle = get_user_msgid("NVGToggle")
	g_msgFlashlight = get_user_msgid("Flashlight")
	g_msgFlashBat = get_user_msgid("FlashBat")
	g_msgAmmoPickup = get_user_msgid("AmmoPickup")
	g_msgDamage = get_user_msgid("Damage")
	g_msgHideWeapon = get_user_msgid("HideWeapon")
	g_msgCrosshair = get_user_msgid("Crosshair")
	g_msgCurWeapon = get_user_msgid("CurWeapon")
	g_msgFog = get_user_msgid("Fog")
	
	// Message hooks
	register_message(g_msgCurWeapon, "message_cur_weapon")
	register_message(get_user_msgid("Money"), "message_money")
	register_message(get_user_msgid("Health"), "message_health")
	register_message(g_msgFlashBat, "message_flashbat")
	register_message(g_msgScreenFade, "message_screenfade")
	register_message(g_msgNVGToggle, "message_nvgtoggle")
	if (g_handle_models_on_separate_ent) register_message(get_user_msgid("ClCorpse"), "message_clcorpse")
	register_message(get_user_msgid("WeapPickup"), "message_weappickup")
	register_message(g_msgAmmoPickup, "message_ammopickup")
	register_message(get_user_msgid("Scenario"), "message_scenario")
	register_message(get_user_msgid("HostagePos"), "message_hostagepos")
	register_message(get_user_msgid("TextMsg"), "message_textmsg")
	register_message(get_user_msgid("SendAudio"), "message_sendaudio")
	register_message(get_user_msgid("TeamScore"), "message_teamscore")
	register_message(g_msgTeamInfo, "message_teaminfo")
	
	// CVARS - General Purpose
	cvar_warmup = register_cvar("zp_delay", "20")
	cvar_thunder = register_cvar("zp_thunderclap", "90")
	cvar_triggered = register_cvar("zp_triggered_lights", "1")
	cvar_removedoors = register_cvar("zp_remove_doors", "0")
	cvar_blockpushables = register_cvar("zp_blockuse_pushables", "1")
	cvar_blocksuicide = register_cvar("zp_block_suicide", "1")
	cvar_randspawn = register_cvar("zp_random_spawn", "1")
	cvar_respawnworldspawnkill = register_cvar("zp_respawn_on_worldspawn_kill", "1")
	cvar_removedropped = register_cvar("zp_remove_dropped", "0")
	cvar_removemoney = register_cvar("zp_remove_money", "1")
	cvar_buycustom = register_cvar("zp_buy_custom", "1")
	cvar_buyzonetime = register_cvar("zp_buyzone_time", "0.0")
	cvar_randweapons = register_cvar("zp_random_weapons", "0")
	cvar_adminmodelshuman = register_cvar("zp_admin_models_human", "1")
	cvar_adminknifemodelshuman = register_cvar("zp_admin_knife_models_human", "0")
	cvar_adminmodelszombie = register_cvar("zp_admin_models_zombie", "1")
	cvar_adminknifemodelszombie = register_cvar("zp_admin_knife_models_zombie", "0")
	cvar_zclasses = register_cvar("zp_zombie_classes", "1")
	cvar_statssave = register_cvar("zp_stats_save", "1")
	cvar_startammopacks = register_cvar("zp_starting_ammo_packs", "5")
	cvar_huddisplay = register_cvar("zp_hud_display", "1")
	cvar_retammo = register_cvar("zp_return_ammo", "1")
	cvar_gamemode_chance = register_cvar("zp_gamemode_chance", "7")
	cvar_gamemode_minpl = register_cvar("zp_gamemode_minplayers", "9")
	
	// CVARS - Deathmatch
	cvar_deathmatch = register_cvar("zp_deathmatch", "0")
	cvar_spawnprotection = register_cvar("zp_spawn_protection", "5")
	cvar_respawnonsuicide = register_cvar("zp_respawn_on_suicide", "0")
	cvar_respawnafterlast = register_cvar("zp_respawn_after_last_human", "1")
	cvar_allowrespawninfection = register_cvar("zp_infection_allow_respawn", "1")
	cvar_respawnzomb = register_cvar("zp_respawn_zombies", "1")
	cvar_respawnhum = register_cvar("zp_respawn_humans", "1")
	
	// CVARS - VIP
	cvar_vipinfammo = register_cvar("zp_vip_unlimited_ammo", "1")
	
	// CVARS - Extra Items
	cvar_extraitems = register_cvar("zp_extra_items", "1")
	cvar_extraweapons = register_cvar("zp_extra_weapons", "1")
	cvar_extranvision = register_cvar("zp_extra_nvision", "1")
	cvar_extraantidote = register_cvar("zp_extra_antidote", "1")
	cvar_antidotelimit = register_cvar("zp_extra_antidote_limit", "999")
	cvar_extrainfbomb = register_cvar("zp_extra_infbomb", "1")
	cvar_infbomblimit = register_cvar("zp_extra_infbomb_limit", "999")
	
	// CVARS - Flashlight and Nightvision
	cvar_nvggive = register_cvar("zp_nvg_give", "1")
	cvar_customflash = register_cvar("zp_flash_custom", "0")
	cvar_flashsize = register_cvar("zp_flash_size", "10")
	cvar_flashdrain = register_cvar("zp_flash_drain", "1")
	cvar_flashcharge = register_cvar("zp_flash_charge", "5")
	cvar_flashdist = register_cvar("zp_flash_distance", "1000")
	cvar_flashcolor[0] = register_cvar("zp_flash_color_R", "100")
	cvar_flashcolor[1] = register_cvar("zp_flash_color_G", "100")
	cvar_flashcolor[2] = register_cvar("zp_flash_color_B", "100")
	cvar_flashshowall = register_cvar("zp_flash_show_all", "1")
	
	// CVARS - Knockback
	cvar_knockback = register_cvar("zp_knockback", "0")
	cvar_zmlowknockback = register_cvar("zp_knockback_balance_reduce", "0.35")
	cvar_knockbackdamage = register_cvar("zp_knockback_damage", "1")
	cvar_knockbackpower = register_cvar("zp_knockback_power", "1")
	cvar_knockbackzvel = register_cvar("zp_knockback_zvel", "0")
	cvar_knockbackducking = register_cvar("zp_knockback_ducking", "0.25")
	cvar_knockbackdist = register_cvar("zp_knockback_distance", "500")
	
	// CVARS - Leap
	cvar_leapzombies = register_cvar("zp_leap_zombies", "0")
	cvar_leapzombiesforce = register_cvar("zp_leap_zombies_force", "500")
	cvar_leapzombiesheight = register_cvar("zp_leap_zombies_height", "300")
	cvar_leapzombiescooldown = register_cvar("zp_leap_zombies_cooldown", "5.0")
	
	// CVARS - Humans
	cvar_humanhp = register_cvar("zp_human_health", "100")
	cvar_humanlasthp = register_cvar("zp_human_last_extrahp", "0")
	cvar_humanspd = register_cvar("zp_human_speed", "240")
	cvar_humangravity = register_cvar("zp_human_gravity", "0.93")
	cvar_humangravity_vip = register_cvar("zp_human_gravity_vip", "0.88")
	cvar_humanarmor = register_cvar("zp_human_armor_protect", "1")
	cvar_infammo = register_cvar("zp_human_unlimited_ammo", "0")
	cvar_ammodamage_human = register_cvar("zp_human_damage_reward", "1000")
	cvar_ammodamage_human_vip = register_cvar("zp_human_damage_reward_vip", "750")
	cvar_fragskill = register_cvar("zp_human_frags_for_kill", "1")
	cvar_ammokill = register_cvar("zp_human_ammo_for_kill", "5")
	cvar_humansurvreward = register_cvar("zp_human_survive_reward", "2")
	
	// CVARS - Custom Grenades
	cvar_firegrenades = register_cvar("zp_fire_grenades", "1")
	cvar_fireduration = register_cvar("zp_fire_duration", "10")
	cvar_firedamage = register_cvar("zp_fire_damage", "5")
	cvar_fireslowdown = register_cvar("zp_fire_slowdown", "0.5")
	cvar_frostgrenades = register_cvar("zp_frost_grenades", "1")
	cvar_freezeduration = register_cvar("zp_frost_duration", "3")
	cvar_flaregrenades = register_cvar("zp_flare_grenades","1")
	cvar_flareduration = register_cvar("zp_flare_duration", "90")
	cvar_flarecolor = register_cvar("zp_flare_color", "0")
	
	// CVARS - Zombies
	cvar_zombiefirsthp = register_cvar("zp_zombie_first_hp", "2.0")
	cvar_zombiearmor = register_cvar("zp_zombie_armor", "0.75")
	cvar_hitzones = register_cvar("zp_zombie_hitzones", "0")
	cvar_zombiebonushp = register_cvar("zp_zombie_infect_health", "100")
	cvar_zombiefov = register_cvar("zp_zombie_fov", "110")
	cvar_zombiesilent = register_cvar("zp_zombie_silent", "1")
	cvar_zombiepainfree = register_cvar("zp_zombie_painfree", "2")
	cvar_zombiebleeding = register_cvar("zp_zombie_bleeding", "1")
	cvar_ammoinfect = register_cvar("zp_zombie_infect_reward", "1")
	cvar_ammodamage_zombie = register_cvar("zp_zombie_damage_reward", "0")
	cvar_fragsinfect = register_cvar("zp_zombie_frags_for_infect", "1")
	cvar_dmg_frozen = register_cvar("zp_damage_frozen", "1")
	cvar_zombiesurvreward = register_cvar("zp_zombie_survive_reward", "1")
	
	// CVARS - Special Effects
	cvar_infectionscreenfade = register_cvar("zp_infection_screenfade", "1")
	cvar_infectionscreenshake = register_cvar("zp_infection_screenshake", "1")
	cvar_infectionsparkle = register_cvar("zp_infection_sparkle", "1")
	cvar_infectiontracers = register_cvar("zp_infection_tracers", "1")
	cvar_infectionparticles = register_cvar("zp_infection_particles", "1")
	cvar_hudicons = register_cvar("zp_hud_icons", "1")
	
	// CVARS - Multi Infection
	cvar_multiminplayers = register_cvar("zp_multi_min_players", "0")
	cvar_multiratio = register_cvar("zp_multi_ratio", "0.15")
	
	// CVARS - Others
	cvar_logcommands = register_cvar("zp_logcommands", "1")
	cvar_showactivity = get_cvar_pointer("amx_show_activity")
	cvar_botquota = get_cvar_pointer("bot_quota")
	register_cvar("zn_version", PLUGIN_VERSION, FCVAR_SERVER|FCVAR_SPONLY)
	set_cvar_string("zn_version", PLUGIN_VERSION)
	
	// Custom Forwards
	g_fwRoundStart = CreateMultiForward("zp_round_started", ET_IGNORE, FP_CELL, FP_CELL)
	g_fwRoundEnd = CreateMultiForward("zp_round_ended", ET_IGNORE, FP_CELL)
	g_fwUserInfected_pre = CreateMultiForward("zn_user_infected_pre", ET_IGNORE, FP_CELL, FP_CELL)
	g_fwUserInfected_post = CreateMultiForward("zn_user_infected_post", ET_IGNORE, FP_CELL, FP_CELL)
	g_fwUserHumanized_pre = CreateMultiForward("zn_user_humanized_pre", ET_IGNORE, FP_CELL)
	g_fwUserHumanized_post = CreateMultiForward("zn_user_humanized_post", ET_IGNORE, FP_CELL)
	g_fwUserInfect_attempt = CreateMultiForward("zp_user_infect_attempt", ET_CONTINUE, FP_CELL, FP_CELL)
	g_fwUserHumanize_attempt = CreateMultiForward("zp_user_humanize_attempt", ET_CONTINUE, FP_CELL)
	g_fwExtraItemSelected = CreateMultiForward("zp_extra_item_selected", ET_CONTINUE, FP_CELL, FP_CELL)
	g_fwUserUnfrozen = CreateMultiForward("zp_user_unfrozen", ET_IGNORE, FP_CELL)
	g_fwUserLastZombie = CreateMultiForward("zp_user_last_zombie", ET_IGNORE, FP_CELL)
	g_fwUserLastHuman = CreateMultiForward("zp_user_last_human", ET_IGNORE, FP_CELL)
	g_fwBuyAmmoPrimary = CreateMultiForward("zp_user_buy_primammo", ET_CONTINUE, FP_CELL)
	g_fwBuyAmmoSecondary = CreateMultiForward("zp_user_buy_secammo", ET_CONTINUE, FP_CELL)
	
	// Associated arrays initialize
	gSavedAmmo = TrieCreate()
	gSavedSouls = TrieCreate()
	
	// Collect random spawn points
	load_spawns()
	
	// Set a random skybox?
	if (g_sky_enable) {
		new sky[32]
		ArrayGetString(g_sky_names, random_num(0, ArraySize(g_sky_names) - 1), sky, charsmax(sky))
		set_cvar_string("sv_skyname", sky)
	}
	
	// Disable sky lighting so it doesn't mess with our custom lighting
	set_cvar_num("sv_skycolor_r", 0)
	set_cvar_num("sv_skycolor_g", 0)
	set_cvar_num("sv_skycolor_b", 0)
	
	// Format mod name
	formatex(g_modname, charsmax(g_modname), "Zombie Nightmare %s", PLUGIN_VERSION)
	
	// Get Max Players
	g_maxplayers = get_maxplayers()
	
	// Check if it's a CZ server
	new mymod[6]
	get_modname(mymod, charsmax(mymod))
	if (equal(mymod, "czero")) g_czero = 1
}

public plugin_end() {
	TrieDestroy(gSavedAmmo)
	TrieDestroy(gSavedSouls)
}

public plugin_cfg() {
	// Get configs dir
	new cfgdir[32]
	get_configsdir(cfgdir, charsmax(cfgdir))
	
	// Execute config file (zombienightmare.cfg)
	server_cmd("exec %s/zombienightmare.cfg", cfgdir)
	
	// Prevent any more stuff from registering
	g_arrays_created = false
	
	// Lighting task
	set_task(5.0, "lighting_effects", _, _, _, "b")
	
	// Cache CVARs after configs are loaded / call roundstart manually
	set_task(0.5, "cache_cvars")
	set_task(0.5, "event_round_start")
	set_task(0.5, "logevent_round_start")
}

/*================================================================================
 [Main Events]
=================================================================================*/

// Event Round Start
public event_round_start() {
	// Remove doors/lights?
	set_task(0.1, "remove_stuff")
	
	// New round starting
	g_newround = true
	g_endround = false
	g_modestarted = false
	g_currentmode = MODE_NONE
	
	// Reset bought infection bombs counter
	g_infbombcounter = 0
	g_antidotecounter = 0
	
	// Freezetime begins
	g_freezetime = true
	
	// Set a new "Make Zombie Task"
	remove_task(TASK_MAKEZOMBIE)
	g_seconds = get_pcvar_num(cvar_warmup)
	if(g_seconds < 1) g_seconds = 1
	remove_task(TASK_COUNTDOWN)
	set_task(0.5, "countdown", TASK_COUNTDOWN)
	
	// Play round start music
	new sound[64]
	ArrayGetString(sound_round_start, random_num(0, ArraySize(sound_round_start) - 1), sound, charsmax(sound))
	PlaySound(sound)
}

public countdown() {
	if(g_seconds == 0 || g_modestarted)
		return
	
	if(g_cdsounds_enabled) {
		if(g_seconds == 20) {
			client_cmd(0,"speak ^"%s^"", g_cd[13])
			set_task(0.6, "play11")
			set_task(1.5, "play10")
		}
		else if(g_seconds == 15) {
			client_cmd(0,"speak ^"%s^"", g_cd[12])
			set_task(0.75, "play11")
			set_task(1.6, "play10")
		}
		else if(0 < g_seconds <= 10) client_cmd(0,"speak ^"%s^"", g_cd[g_seconds - 1])
	}
	client_print(0, print_center, "%L", LANG_PLAYER, "TIME_TO_INFECT", g_seconds)
	g_seconds -= 1
	switch(g_seconds) {
		case 0: SetLight(0, "c")
		case 1: SetLight(0, "d")
		case 2: SetLight(0, "e")
		case 3: SetLight(0, "f")
		case 4: SetLight(0, "g")
		case 5: SetLight(0, "h")
		case 6: SetLight(0, "i")
		case 7: SetLight(0, "j")
		default: SetLight(0, "k")
	}
	remove_task(TASK_COUNTDOWN)
	if(g_seconds > 0) set_task(1.0, "countdown", TASK_COUNTDOWN)
	else set_task(1.0, "countdown_final", TASK_COUNTDOWN)
}

public countdown_final() {
	client_print(0, print_center, "%L", LANG_PLAYER, "FIRST_INFECTED")
	make_zombie_task()
}

public play11() client_cmd(0,"speak ^"%s^"", g_cd[11])
public play10() client_cmd(0,"speak ^"%s^"", g_cd[10])

// Log Event Round Start
public logevent_round_start() {
	// Freezetime ends
	g_freezetime = false
}

// Log Event Round End
public logevent_round_end() {
	// Prevent this from getting called twice when restarting (bugfix)
	static Float:lastendtime
	if (g_gametime - lastendtime < 0.5) return;
	lastendtime = g_gametime
	new zreward = get_pcvar_num(cvar_zombiesurvreward)
	new hreward = get_pcvar_num(cvar_humansurvreward)
	
	// Temporarily save player stats?
	if (get_pcvar_num(cvar_statssave)) {
		static id, team
		for (id = 1; id <= g_maxplayers; id++) {
			// Not connected
			if (!g_isconnected[id])
				continue;
			
			team = fm_cs_get_user_team(id)
			
			// Not playing
			if (team == FM_CS_TEAM_SPECTATOR || team == FM_CS_TEAM_UNASSIGNED)
				continue;
			
			if(g_zombie[id] && g_isalive[id]) set_ammo(id, g_ammopacks[id] + zreward);
			else if(g_isalive[id]) set_ammo(id, g_ammopacks[id] + hreward);
			save_stats(id)
		}
	}
	
	// Round ended
	g_endround = true
	
	// Stop old tasks (if any)
	remove_task(TASK_MAKEZOMBIE)
	remove_task(TASK_COUNTDOWN)
	
	// Stop ambience sounds
	if (g_ambience_sounds[AMBIENCE_SOUNDS_INFECTION]) {
		remove_task(TASK_AMBIENCESOUNDS)
		client_cmd(0, "mp3 stop; stopsound")
	}
	
	// Show HUD notice, play win sound, update team scores...
	static sound[64]
	if (!fnGetZombies()) {
		// Human team wins
		client_print(0, print_center, "%L", LANG_PLAYER, "WIN_HUMAN")
		
		// Play win sound and increase score, unless game commencing
		ArrayGetString(sound_win_humans, random_num(0, ArraySize(sound_win_humans) - 1), sound, charsmax(sound))
		PlaySound(sound)
		if (!g_gamecommencing) g_scorehumans++
		
		// Round end forward
		ExecuteForward(g_fwRoundEnd, g_fwDummyResult, ZP_TEAM_HUMAN);
	} else if (!fnGetHumans()) {
		// Zombie team wins
		client_print(0, print_center, "%L", LANG_PLAYER, "WIN_ZOMBIE")
		
		// Play win sound and increase score, unless game commencing
		ArrayGetString(sound_win_zombies, random_num(0, ArraySize(sound_win_zombies) - 1), sound, charsmax(sound))
		PlaySound(sound)
		if (!g_gamecommencing) g_scorezombies++
		
		// Round end forward
		ExecuteForward(g_fwRoundEnd, g_fwDummyResult, ZP_TEAM_ZOMBIE);
	} else {
		// No one wins
		client_print(0, print_center, "%L", LANG_PLAYER, "WIN_HUMAN")
		
		// Play win sound
		ArrayGetString(sound_win_no_one, random_num(0, ArraySize(sound_win_no_one) - 1), sound, charsmax(sound))
		PlaySound(sound)
		if (!g_gamecommencing) g_scorehumans++
		
		// Round end forward
		ExecuteForward(g_fwRoundEnd, g_fwDummyResult, ZP_TEAM_NO_ONE);
	}
	
	// Game commencing triggers round end
	g_gamecommencing = false
	
	// Balance the teams
	balance_teams()
}

// Event Map Ended
public event_intermission() {
	// Remove ambience sounds task
	remove_task(TASK_AMBIENCESOUNDS)
}

// BP Ammo update
public event_ammo_x(id) {
	// Humans only
	if (g_zombie[id])
		return;
	
	// Get ammo type
	static type
	type = read_data(1)
	
	// Unknown ammo type
	if (type >= sizeof AMMOWEAPON)
		return;
	
	// Get weapon's id
	static weapon
	weapon = AMMOWEAPON[type]
	
	// Primary and secondary only
	if (MAXBPAMMO[weapon] <= 2)
		return;
	
	// Get ammo amount
	static amount
	amount = read_data(2)
	
	// Unlimited BP Ammo?
	if (get_pcvar_num(cvar_infammo) || (get_user_flags(id) & g_access_flag[ACCESS_VIP] && get_pcvar_num(cvar_vipinfammo))) {
		if (amount < MAXBPAMMO[weapon]) {
			static args[1]
			args[0] = weapon
			set_task(0.1, "refill_bpammo", id, args, sizeof args)
		}
	}
}

/*================================================================================
 [Main Forwards]
=================================================================================*/

// Entity Spawn Forward
public fw_Spawn(entity) {
	// Invalid entity
	if (!pev_valid(entity)) return FMRES_IGNORED;
	
	// Get classname
	new classname[32], objective[32], size = ArraySize(g_objective_ents)
	pev(entity, pev_classname, classname, charsmax(classname))
	
	// Check whether it needs to be removed
	for (new i = 0; i < size; i++) {
		ArrayGetString(g_objective_ents, i, objective, charsmax(objective))
		if (equal(classname, objective)) {
			engfunc(EngFunc_RemoveEntity, entity)
			return FMRES_SUPERCEDE;
		}
	}
	return FMRES_IGNORED;
}

// Sound Precache Forward
public fw_PrecacheSound(const sound[]) {
	// Block all those unneeeded hostage sounds
	if (equal(sound, "hostage", 7))
		return FMRES_SUPERCEDE;
	
	return FMRES_IGNORED;
}

// Ham Player Spawn Post Forward
public fw_PlayerSpawn_Post(id) {
	// Not alive or didn't join a team yet
	if (!is_user_alive(id) || !fm_cs_get_user_team(id))
		return;
	
	// Make a fog
	if(g_ambience_fog) {
		message_begin(MSG_ONE, g_msgFog, _, id)
		write_byte(g_fog_color[0])
		write_byte(g_fog_color[1])
		write_byte(g_fog_color[2])
		write_long(_:str_to_float(g_fog_density))
		message_end()
	}
	
	// Player spawned
	g_isalive[id] = true
	g_lastdhud[id] = get_systime()
	g_return_money[id][0] = 0
	g_return_money[id][1] = 0
	g_playermodelbody[id] = random_num(0, 6)
	if(!g_modestarted) {
		g_return_money[id][0] = g_ammopacks[id]
		g_return_money[id][1] = g_souls[id]
	}
	
	// Remove previous tasks
	remove_task(id+TASK_SPAWN)
	remove_task(id+TASK_MODEL)
	remove_task(id+TASK_BLOOD)
	remove_task(id+TASK_AURA)
	remove_task(id+TASK_BURN)
	remove_task(id+TASK_CHARGE)
	remove_task(id+TASK_FLASH)
	
	// Spawn at a random location?
	if (get_pcvar_num(cvar_randspawn)) do_random_spawn(id)
	
	// Hide money?
	if (get_pcvar_num(cvar_removemoney))
		set_task(0.4, "task_hide_money", id+TASK_SPAWN)
	
	// Respawn player if he dies because of a worldspawn kill?
	if (get_pcvar_num(cvar_respawnworldspawnkill))
		set_task(1.5, "respawn_player_check_task", id+TASK_SPAWN)
	
	// Spawn as zombie?
	if (g_respawn_as_zombie[id] && !g_newround) {
		reset_vars(id, 0)
		zombieme(id, 0, 0, 0) // make him zombie right away
		return;
	}
	
	// Reset player vars
	reset_vars(id, 0)
	g_buytime[id] = g_gametime
	
	// Show custom buy menu?
	if (get_pcvar_num(cvar_buycustom))
		set_task(0.2, "show_menu_buy1", id+TASK_SPAWN)
	
	// Set health and gravity
	fm_set_user_health(id, get_pcvar_num(cvar_humanhp))
	if(get_user_flags(id) & g_access_flag[ACCESS_VIP]) set_pev(id, pev_gravity, get_pcvar_float(cvar_humangravity_vip))
	else set_pev(id, pev_gravity, get_pcvar_float(cvar_humangravity))
	
	// Set human maxspeed
	ExecuteHamB(Ham_Player_ResetMaxSpeed, id)
	
	// Switch to CT if spawning mid-round
	if (!g_newround && fm_cs_get_user_team(id) != FM_CS_TEAM_CT) {
		remove_task(id+TASK_TEAM)
		fm_cs_set_user_team(id, FM_CS_TEAM_CT)
		fm_user_team_update(id)
	}
	
	// Custom models stuff
	static currentmodel[32], tempmodel[32], already_has_model, i, iRand, size
	already_has_model = false
	
	if (g_handle_models_on_separate_ent) {
		// Set the right model
		if (get_pcvar_num(cvar_adminmodelshuman) && (get_user_flags(id) & g_access_flag[ACCESS_ADMIN_MODELS])) {
			iRand = random_num(0, ArraySize(model_admin_human) - 1)
			ArrayGetString(model_admin_human, iRand, g_playermodel[id], charsmax(g_playermodel[]))
			if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_modelindex_admin_human, iRand))
		} else {
			iRand = random_num(0, ArraySize(model_human) - 1)
			ArrayGetString(model_human, iRand, g_playermodel[id], charsmax(g_playermodel[]))
			if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_modelindex_human, iRand))
		}
		
		// Set model on player model entity
		fm_set_playermodel_ent(id)
		
		// Remove glow on player model entity
		fm_set_rendering(g_ent_playermodel[id])
	} else {
		// Get current model for comparing it with the current one
		fm_cs_get_user_model(id, currentmodel, charsmax(currentmodel))
		
		// Set the right model, after checking that we don't already have it
		if (get_pcvar_num(cvar_adminmodelshuman) && (get_user_flags(id) & g_access_flag[ACCESS_ADMIN_MODELS])) {
			size = ArraySize(model_admin_human)
			for (i = 0; i < size; i++) {
				ArrayGetString(model_admin_human, i, tempmodel, charsmax(tempmodel))
				if (equal(currentmodel, tempmodel)) already_has_model = true
			}
			if (!already_has_model) {
				iRand = random_num(0, size - 1)
				ArrayGetString(model_admin_human, iRand, g_playermodel[id], charsmax(g_playermodel[]))
				if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_modelindex_admin_human, iRand))
			}
		} else {
			size = ArraySize(model_human)
			for (i = 0; i < size; i++) {
				ArrayGetString(model_human, i, tempmodel, charsmax(tempmodel))
				if (equal(currentmodel, tempmodel)) already_has_model = true
			}
			if (!already_has_model) {
				iRand = random_num(0, size - 1)
				ArrayGetString(model_human, iRand, g_playermodel[id], charsmax(g_playermodel[]))
				if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_modelindex_human, iRand))
			}
		}
		
		// Need to change the model?
		if (!already_has_model) {
			// An additional delay is offset at round start
			// since SVC_BAD is more likely to be triggered there
			if (g_newround) set_task(5.0 * g_modelchange_delay, "fm_user_model_update", id+TASK_MODEL)
			else fm_user_model_update(id+TASK_MODEL)
		}
		
		// Remove glow
		fm_set_rendering(id)
	}
	
	// Bots stuff
	if (g_isbot[id]) {
		// Turn off NVG for bots
		cs_set_user_nvg(id, 0)
		
		// Automatically buy extra items/weapons after first zombie is chosen
		if (get_pcvar_num(cvar_extraitems)) {
			if (g_newround) set_task(10.0 + get_pcvar_float(cvar_warmup), "bot_buy_extras", id+TASK_SPAWN)
			else set_task(10.0, "bot_buy_extras", id+TASK_SPAWN)
		}
	}
	
	// Enable spawn protection for humans spawning mid-round
	if (!g_newround && get_pcvar_float(cvar_spawnprotection) > 0.0) {
		// Do not take damage
		g_nodamage[id] = true
		
		// Make temporarily invisible
		set_pev(id, pev_effects, pev(id, pev_effects) | EF_NODRAW)
		
		// Set task to remove it
		set_task(get_pcvar_float(cvar_spawnprotection), "remove_spawn_protection", id+TASK_SPAWN)
	}
	
	// Turn off his flashlight (prevents double flashlight bug/exploit)
	turn_off_flashlight(id)
	
	// Set the flashlight charge task to update battery status
	if (g_cached_customflash)
		set_task(1.0, "flashlight_charge", id+TASK_CHARGE, _, _, "b")
	
	// Replace weapon models (bugfix)
	static weapon_ent
	weapon_ent = fm_cs_get_current_weapon_ent(id)
	if (pev_valid(weapon_ent)) replace_weapon_models(id, cs_get_weapon_id(weapon_ent))
	
	// Fix weaponkey
	static ent; ent = get_weapon_index(id, "weapon_knife")
	if(ent > 0 && !g_zombie[id]) set_pev(ent, pev_impulse, g_knife_weaponkey[id])
	
	// Nvg fix
	SetLight(id,"c")
	
	// Submodel fix
	set_pev(id, pev_body, g_playermodelbody[id])
	
	// Last Zombie Check
	fnCheckLastZombie()
}

// Ham Player Killed Forward
public fw_PlayerKilled(victim, attacker, shouldgib) {
	// Player killed
	g_isalive[victim] = false
	g_nodamage[victim] = false
	
	// Enable dead players nightvision
	set_task(0.1, "spec_nvision", victim)
	
	// Disable nightvision when killed (bugfix)
	if (get_pcvar_num(cvar_nvggive) == 0 && g_nvision[victim]) {
		g_nvision[victim] = false
		g_nvisionenabled[victim] = false
	}
	
	// Turn off nightvision when killed (bugfix)
	if (get_pcvar_num(cvar_nvggive) == 2 && g_nvision[victim] && g_nvisionenabled[victim])
		g_nvisionenabled[victim] = false
	
	// Turn off custom flashlight when killed
	if (g_cached_customflash) {
		// Turn it off
		g_flashlight[victim] = false
		g_flashbattery[victim] = 100
		
		// Remove previous tasks
		remove_task(victim+TASK_CHARGE)
		remove_task(victim+TASK_FLASH)
	}
	
	// Stop bleeding/burning/aura when killed
	if (g_zombie[victim]) {
		remove_task(victim+TASK_BLOOD)
		remove_task(victim+TASK_AURA)
		remove_task(victim+TASK_BURN)
	}
	
	// Determine whether the player killed himself
	static selfkill
	selfkill = (victim == attacker || !is_user_valid_connected(attacker)) ? true : false
	
	// Killed by a non-player entity or self killed
	if (selfkill) return;
	
	// Zombie killed human, reward ammo packs
	if (g_zombie[attacker])
		set_ammo(attacker, g_ammopacks[attacker] + get_pcvar_num(cvar_ammoinfect))
	
	// Human killed zombie, add up the extra frags for kill
	if (!g_zombie[attacker] && get_pcvar_num(cvar_fragskill) > 1)
		UpdateFrags(attacker, victim, get_pcvar_num(cvar_fragskill) - 1, 0, 0)
	
	if (!g_zombie[attacker] && get_pcvar_num(cvar_ammokill) > 1)
		set_ammo(attacker, g_ammopacks[attacker] + get_pcvar_num(cvar_ammokill))
	
	if(!g_zombie[attacker])
		set_souls(attacker, g_souls[attacker] + 1)
	
	// Zombie killed human, add up the extra frags for kill
	if (g_zombie[attacker] && get_pcvar_num(cvar_fragsinfect) > 1)
		UpdateFrags(attacker, victim, get_pcvar_num(cvar_fragsinfect) - 1, 0, 0)
}

// Ham Player Killed Post Forward
public fw_PlayerKilled_Post(victim, attacker, shouldgib) {
	// Last Zombie Check
	fnCheckLastZombie()
	
	// Remove a fog
	if(g_ambience_fog) {
		message_begin(MSG_ONE, g_msgFog, _, victim)
		write_byte(0)
		write_byte(0)
		write_byte(0)
		write_long(_:0.001)
		message_end()
	}
	
	// Remove nightvision screenfade
	message_begin(MSG_ONE, g_msgScreenFade, _, victim)
	write_short(0)
	write_short(0)
	write_short(0x0000)
	write_byte(100)
	write_byte(100)
	write_byte(100)
	write_byte(255)
	message_end()
	
	// Determine whether the player killed himself
	static selfkill
	selfkill = (victim == attacker || !is_user_valid_connected(attacker)) ? true : false
	
	// Respawn if deathmatch is enabled
	if (get_pcvar_num(cvar_deathmatch) > 0 && get_pcvar_num(cvar_deathmatch) != 5) {
		// Respawn on suicide?
		if (selfkill && !get_pcvar_num(cvar_respawnonsuicide))
			return;
		
		// Respawn if human/zombie?
		if ((g_zombie[victim] && !get_pcvar_num(cvar_respawnzomb)) || (!g_zombie[victim] && !get_pcvar_num(cvar_respawnhum)))
			return;
		
		// Set the respawn task
		if(get_user_flags(victim) & g_access_flag[ACCESS_VIP]) set_task(1.0, "respawn_player_task", victim+TASK_SPAWN)
		else set_task(5.0, "respawn_player_task", victim+TASK_SPAWN)
	}
}

// Ham Take Damage Forward
public fw_TakeDamage(victim, inflictor, attacker, Float:damage, damage_type) {
	if(damage_type & DMG_FALL && !g_modestarted)
		return HAM_SUPERCEDE;
	
	// Non-player damage or self damage
	if (victim == attacker || !is_user_valid_connected(attacker))
		return HAM_IGNORED;
	
	// New round starting or round ended
	if (g_newround || g_endround)
		return HAM_SUPERCEDE;
	
	// Victim shouldn't take damage
	if (g_nodamage[victim])
		return HAM_SUPERCEDE;
	
	// Prevent friendly fire
	if (g_zombie[attacker] == g_zombie[victim])
		return HAM_SUPERCEDE;
	
	// Victim is frozen
	if (g_frozen[victim] && !get_pcvar_num(cvar_dmg_frozen))
		return HAM_SUPERCEDE;
	
	// Attacker is human...
	if (!g_zombie[attacker]) {
		// Armor multiplier for the final damage on normal zombies
		damage *= get_pcvar_float(cvar_zombiearmor)
		SetHamParamFloat(4, damage)
		
		// Reward ammo packs to humans for damaging zombies?
		if ((get_pcvar_num(cvar_ammodamage_human_vip) > 0) && (get_user_flags(attacker) & g_access_flag[ACCESS_VIP])) {
			g_damagedealt_human[attacker] += floatround(damage)
			while (g_damagedealt_human[attacker] > get_pcvar_num(cvar_ammodamage_human_vip)) {
				set_ammo(attacker, g_ammopacks[attacker] + 1)
				g_damagedealt_human[attacker] -= get_pcvar_num(cvar_ammodamage_human_vip)
			}
		} else if (get_pcvar_num(cvar_ammodamage_human) > 0) {
			g_damagedealt_human[attacker] += floatround(damage)
			while (g_damagedealt_human[attacker] > get_pcvar_num(cvar_ammodamage_human)) {
				set_ammo(attacker, g_ammopacks[attacker] + 1)
				g_damagedealt_human[attacker] -= get_pcvar_num(cvar_ammodamage_human)
			}
		}
		return HAM_IGNORED;
	}
	
	// Attacker is zombie...
	// Prevent infection/damage by HE grenade (bugfix)
	if (damage_type & DMG_GRENADE)
		return HAM_SUPERCEDE;
	
	// Reward ammo packs to zombies for damaging humans?
	if (get_pcvar_num(cvar_ammodamage_zombie) > 0) {
		g_damagedealt_zombie[attacker] += floatround(damage)
		while (g_damagedealt_zombie[attacker] > get_pcvar_num(cvar_ammodamage_zombie)) {
			set_ammo(attacker, g_ammopacks[attacker] + 1)
			g_damagedealt_zombie[attacker] -= get_pcvar_num(cvar_ammodamage_zombie)
		}
	}
	
	// Does human armor need to be reduced before infecting?
	if (get_pcvar_num(cvar_humanarmor)) {
		// Get victim armor
		static Float:armor
		pev(victim, pev_armorvalue, armor)
		
		// If he has some, block the infection and reduce armor instead
		if (armor > 0.0) {
			emit_sound(victim, CHAN_BODY, sound_armorhit, 1.0, ATTN_NORM, 0, PITCH_NORM)
			if (armor - damage > 0.0)
				set_pev(victim, pev_armorvalue, armor - damage)
			else
				cs_set_user_armor(victim, 0, CS_ARMOR_NONE)
			return HAM_SUPERCEDE;
		}
	}
	
	// Check if infection allowed
	static Float:health
	pev(victim, pev_health, health)
	if(damage >= health || g_instantinfect[attacker]) {
		zombieme(victim, attacker, 0, 1, 1) // turn into zombie
		return HAM_SUPERCEDE;
	}
	
	// Damage human
	return HAM_IGNORED
}

// Ham Take Damage Post Forward
public fw_TakeDamage_Post(victim) {
	// --- Check if victim should be Pain Shock Free ---
	
	// Check if proper CVARs are enabled
	if (g_zombie[victim]) {
		switch (get_pcvar_num(cvar_zombiepainfree)) {
			case 0: return;
			case 2: if (!g_lastzombie[victim]) return;
			case 3: if (!g_firstzombie[victim]) return;
		}
	} else {
		return;
	}
	
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(victim) != PDATA_SAFE)
		return;
	
	// Set pain shock free offset
	set_pdata_float(victim, OFFSET_PAINSHOCK, 1.0, OFFSET_LINUX)
}

// Ham Trace Attack Forward
public fw_TraceAttack(victim, attacker, Float:damage, Float:direction[3], tracehandle, damage_type) {
	// Non-player damage or self damage
	if (victim == attacker || !is_user_valid_connected(attacker))
		return HAM_IGNORED;
	
	// New round starting or round ended
	if (g_newround || g_endround)
		return HAM_SUPERCEDE;
	
	// Victim shouldn't take damage or victim is frozen
	if (g_nodamage[victim])
		return HAM_SUPERCEDE;
	
	// Prevent friendly fire
	if (g_zombie[attacker] == g_zombie[victim])
		return HAM_SUPERCEDE;
	
	if(g_frozen[victim] && !get_pcvar_num(cvar_dmg_frozen))
		return HAM_IGNORED;
	
	// Victim isn't a zombie or not bullet damage, nothing else to do here
	if (!g_zombie[victim] || !(damage_type & DMG_BULLET))
		return HAM_IGNORED;
	
	// If zombie hitzones are enabled, check whether we hit an allowed one
	if (get_pcvar_num(cvar_hitzones) && !(get_pcvar_num(cvar_hitzones) & (1<<get_tr2(tracehandle, TR_iHitgroup))))
		return HAM_SUPERCEDE;
	
	// Knockback disabled, nothing else to do here
	if (!get_pcvar_num(cvar_knockback))
		return HAM_IGNORED;
	
	// Get whether the victim is in a crouch state
	static ducking
	ducking = pev(victim, pev_flags) & (FL_DUCKING | FL_ONGROUND) == (FL_DUCKING | FL_ONGROUND)
	
	// Zombie knockback when ducking disabled
	if (ducking && get_pcvar_float(cvar_knockbackducking) == 0.0)
		return HAM_IGNORED;
	
	// Get distance between players
	static origin1[3], origin2[3]
	get_user_origin(victim, origin1)
	get_user_origin(attacker, origin2)
	
	// Max distance exceeded
	if (get_distance(origin1, origin2) > get_pcvar_num(cvar_knockbackdist))
		return HAM_IGNORED;
	
	// Get victim's velocity
	static Float:velocity[3]
	pev(victim, pev_velocity, velocity)
	
	// Use damage on knockback calculation
	if (get_pcvar_num(cvar_knockbackdamage))
		xs_vec_mul_scalar(direction, damage, direction)
	
	// Use weapon power on knockback calculation
	if (get_pcvar_num(cvar_knockbackpower) && kb_weapon_power[g_currentweapon[attacker]] > 0.0)
		xs_vec_mul_scalar(direction, kb_weapon_power[g_currentweapon[attacker]], direction)
	
	// Apply ducking knockback multiplier
	if (ducking)
		xs_vec_mul_scalar(direction, get_pcvar_float(cvar_knockbackducking), direction)
	
	// Apply zombie class knockback multiplier
	xs_vec_mul_scalar(direction, g_zombie_knockback[victim], direction)
	
	// Reduce knockback if we don't have enough zombies
	if(fnGetZombies() <= 2 && g_zombie[victim])
		xs_vec_mul_scalar(direction, get_pcvar_float(cvar_zmlowknockback), direction)
	
	// Add up the new vector
	xs_vec_add(velocity, direction, direction)
	
	// Should knockback also affect vertical velocity?
	if (!get_pcvar_num(cvar_knockbackzvel))
		direction[2] = velocity[2]
	
	// Set the knockback'd victim's velocity
	set_pev(victim, pev_velocity, direction)
	return HAM_IGNORED;
}

// Ham Reset MaxSpeed Post Forward
public fw_ResetMaxSpeed_Post(id) {
	// Freezetime active or player not alive
	if (g_freezetime || !g_isalive[id])
		return;
	
	set_player_maxspeed(id)
}

// Ham Use Stationary Gun Forward
public fw_UseStationary(entity, caller, activator, use_type) {
	// Prevent zombies from using stationary guns
	if (use_type == USE_SET && is_user_valid_connected(caller) && g_zombie[caller])
		return HAM_SUPERCEDE;
	
	return HAM_IGNORED;
}

// Ham Use Stationary Gun Post Forward
public fw_UseStationary_Post(entity, caller, activator, use_type) {
	// Someone stopped using a stationary gun
	if (use_type == USE_OFF && is_user_valid_connected(caller))
		replace_weapon_models(caller, g_currentweapon[caller]) // replace weapon models (bugfix)
}

// Ham Use Pushable Forward
public fw_UsePushable() {
	// Prevent speed bug with pushables?
	if (get_pcvar_num(cvar_blockpushables))
		return HAM_SUPERCEDE;
	
	return HAM_IGNORED;
}

// Ham Weapon Touch Forward
public fw_TouchWeapon(weapon, id) {
	// Not a player
	if (!is_user_valid_connected(id))
		return HAM_IGNORED;
	
	// Dont pickup weapons if zombie (+PODBot MM fix)
	if (g_zombie[id])
		return HAM_SUPERCEDE;
	
	return HAM_IGNORED;
}

// Ham Weapon Pickup Forward
public fw_AddPlayerItem(id, weapon_ent) {
	// HACK: Retrieve our custom extra ammo from the weapon
	static extra_ammo
	extra_ammo = pev(weapon_ent, PEV_ADDITIONAL_AMMO)
	
	// If present
	if (extra_ammo) {
		// Get weapon's id
		static weaponid
		weaponid = cs_get_weapon_id(weapon_ent)
		
		// Add to player's bpammo
		ExecuteHamB(Ham_GiveAmmo, id, extra_ammo, AMMOTYPE[weaponid], MAXBPAMMO[weaponid])
		set_pev(weapon_ent, PEV_ADDITIONAL_AMMO, 0)
	}
}

// Ham Weapon Deploy Forward
public fw_Item_Deploy_Post(weapon_ent)
{
	// Get weapon's owner
	static owner
	owner = fm_cs_get_weapon_ent_owner(weapon_ent)
	
	// Valid owner?
	if (!pev_valid(owner))
		return;
	
	// Get weapon's id
	static weaponid
	weaponid = cs_get_weapon_id(weapon_ent)
	
	// Store current weapon's id for reference
	g_currentweapon[owner] = weaponid
	
	// Replace weapon models with custom ones
	replace_weapon_models(owner, weaponid)
	
	// Zombie not holding an allowed weapon for some reason
	if (g_zombie[owner] && !((1<<weaponid) & ZOMBIE_ALLOWED_WEAPONS_BITSUM))
	{
		// Switch to knife
		g_currentweapon[owner] = CSW_KNIFE
		engclient_cmd(owner, "weapon_knife")
	}
}

// WeaponMod bugfix
//forward wpn_gi_reset_weapon(id);
public wpn_gi_reset_weapon(id)
{
	// Replace knife model
	replace_weapon_models(id, CSW_KNIFE)
}

// Client joins the game
public client_putinserver(id)
{
	// Player joined
	g_isconnected[id] = true
	
	// Cache player's name
	get_user_name(id, g_playername[id], charsmax(g_playername[]))
	
	// Initialize player vars
	reset_vars(id, 1)
	for(new i = 0; i<=32; i++) g_hasclass[id][i] = false;
	g_knife_weaponkey[id] = 0
	
	// Load player stats?
	if (get_pcvar_num(cvar_statssave)) load_stats(id)
	
	// Set some tasks for humans only
	if (!is_user_bot(id))
	{
		// Set the custom HUD display task if enabled
		if (get_pcvar_num(cvar_huddisplay))
			set_task(1.0, "ShowHUD", id+TASK_SHOWHUD, _, _, "b")
		
		// Disable minmodels for clients to see zombies properly
		set_task(5.0, "disable_minmodels", id)
	}
	else
	{
		// Set bot flag
		g_isbot[id] = true
		
		// CZ bots seem to use a different "classtype" for player entities
		// (or something like that) which needs to be hooked separately
		if (!g_hamczbots && cvar_botquota)
		{
			// Set a task to let the private data initialize
			set_task(0.1, "register_ham_czbots", id)
		}
	}
}

// Client leaving
public fw_ClientDisconnect(id)
{
	// Check that we still have both humans and zombies to keep the round going
	if (g_isalive[id]) check_round(id)
	
	// Temporarily save player stats?
	if (get_pcvar_num(cvar_statssave)) save_stats(id)
	
	// Remove previous tasks
	remove_task(id+TASK_TEAM)
	remove_task(id+TASK_MODEL)
	remove_task(id+TASK_FLASH)
	remove_task(id+TASK_CHARGE)
	remove_task(id+TASK_SPAWN)
	remove_task(id+TASK_BLOOD)
	remove_task(id+TASK_AURA)
	remove_task(id+TASK_BURN)
	remove_task(id+TASK_SHOWHUD)
	
	if (g_handle_models_on_separate_ent)
	{
		// Remove custom model entities
		fm_remove_model_ents(id)
	}
	
	// Player left, clear cached flags
	g_isconnected[id] = false
	g_isbot[id] = false
	g_isalive[id] = false
}

// Client left
public fw_ClientDisconnect_Post()
{
	// Last Zombie Check
	fnCheckLastZombie()
}

// Client Kill Forward
public fw_ClientKill()
{
	// Prevent players from killing themselves?
	if (get_pcvar_num(cvar_blocksuicide))
		return FMRES_SUPERCEDE;
	
	return FMRES_IGNORED;
}

// Emit Sound Forward
public fw_EmitSound(id, channel, const sample[], Float:volume, Float:attn, flags, pitch)
{
	// Block all those unneeeded hostage sounds
	if (sample[0] == 'h' && sample[1] == 'o' && sample[2] == 's' && sample[3] == 't' && sample[4] == 'a' && sample[5] == 'g' && sample[6] == 'e')
		return FMRES_SUPERCEDE;
	
	// Replace these next sounds for zombies only
	if (!is_user_valid_connected(id) || !g_zombie[id])
		return FMRES_IGNORED;
	
	static sound[64]
	
	// Zombie being hit
	if (sample[7] == 'b' && sample[8] == 'h' && sample[9] == 'i' && sample[10] == 't')
	{
		ArrayGetString(zombie_pain, random_num(0, ArraySize(zombie_pain) - 1), sound, charsmax(sound))
		emit_sound(id, channel, sound, volume, attn, flags, pitch)
		return FMRES_SUPERCEDE;
	}
	
	// Zombie attacks with knife
	if (sample[8] == 'k' && sample[9] == 'n' && sample[10] == 'i')
	{
		if (sample[14] == 's' && sample[15] == 'l' && sample[16] == 'a') // slash
		{
			ArrayGetString(zombie_miss_slash, random_num(0, ArraySize(zombie_miss_slash) - 1), sound, charsmax(sound))
			emit_sound(id, channel, sound, volume, attn, flags, pitch)
			return FMRES_SUPERCEDE;
		}
		if (sample[14] == 'h' && sample[15] == 'i' && sample[16] == 't') // hit
		{
			if (sample[17] == 'w') // wall
			{
				ArrayGetString(zombie_miss_wall, random_num(0, ArraySize(zombie_miss_wall) - 1), sound, charsmax(sound))
				emit_sound(id, channel, sound, volume, attn, flags, pitch)
				return FMRES_SUPERCEDE;
			}
			else
			{
				ArrayGetString(zombie_hit_normal, random_num(0, ArraySize(zombie_hit_normal) - 1), sound, charsmax(sound))
				emit_sound(id, channel, sound, volume, attn, flags, pitch)
				return FMRES_SUPERCEDE;
			}
		}
		if (sample[14] == 's' && sample[15] == 't' && sample[16] == 'a') // stab
		{
			ArrayGetString(zombie_hit_stab, random_num(0, ArraySize(zombie_hit_stab) - 1), sound, charsmax(sound))
			emit_sound(id, channel, sound, volume, attn, flags, pitch)
			return FMRES_SUPERCEDE;
		}
	}
	
	// Zombie dies
	if (sample[7] == 'd' && ((sample[8] == 'i' && sample[9] == 'e') || (sample[8] == 'e' && sample[9] == 'a')))
	{
		ArrayGetString(zombie_die, random_num(0, ArraySize(zombie_die) - 1), sound, charsmax(sound))
		emit_sound(id, channel, sound, volume, attn, flags, pitch)
		return FMRES_SUPERCEDE;
	}
	
	// Zombie falls off
	if (sample[10] == 'f' && sample[11] == 'a' && sample[12] == 'l' && sample[13] == 'l')
	{
		ArrayGetString(zombie_fall, random_num(0, ArraySize(zombie_fall) - 1), sound, charsmax(sound))
		emit_sound(id, channel, sound, volume, attn, flags, pitch)
		return FMRES_SUPERCEDE;
	}
	
	return FMRES_IGNORED;
}

// Forward Set ClientKey Value -prevent CS from changing player models-
public fw_SetClientKeyValue(id, const infobuffer[], const key[])
{
	// Block CS model changes
	if (key[0] == 'm' && key[1] == 'o' && key[2] == 'd' && key[3] == 'e' && key[4] == 'l')
		return FMRES_SUPERCEDE;
	
	return FMRES_IGNORED;
}

// Forward Client User Info Changed -prevent players from changing models-
public fw_ClientUserInfoChanged(id)
{
	// Cache player's name
	get_user_name(id, g_playername[id], charsmax(g_playername[]))
	
	if (!g_handle_models_on_separate_ent)
	{
		// Get current model
		static currentmodel[32]
		fm_cs_get_user_model(id, currentmodel, charsmax(currentmodel))
		
		// If they're different, set model again
		if (!equal(currentmodel, g_playermodel[id]) && !task_exists(id+TASK_MODEL))
			fm_cs_set_user_model(id+TASK_MODEL)
	}
}

// Forward Get Game Description
public fw_GetGameDescription()
{
	// Return the mod name so it can be easily identified
	forward_return(FMV_STRING, g_modname)
	
	return FMRES_SUPERCEDE;
}

// Forward Set Model
public fw_SetModel(entity, const model[]) {
	// We don't care
	if (strlen(model) < 8)
		return FMRES_IGNORED
	
	// Remove weapons?
	if (get_pcvar_float(cvar_removedropped) > 0.0)
	{
		// Get entity's classname
		static classname[10]
		pev(entity, pev_classname, classname, charsmax(classname))
		
		// Check if it's a weapon box
		if (equal(classname, "weaponbox"))
		{
			// They get automatically removed when thinking
			set_pev(entity, pev_nextthink, g_gametime + get_pcvar_float(cvar_removedropped))
			return FMRES_IGNORED
		}
	}
	
	// Narrow down our matches a bit
	if (model[7] != 'w' || model[8] != '_')
		return FMRES_IGNORED
	
	// Get damage time of grenade
	static Float:dmgtime
	pev(entity, pev_dmgtime, dmgtime)
	
	// Grenade not yet thrown
	if (dmgtime == 0.0)
		return FMRES_IGNORED
	
	// Get whether grenade's owner is a zombie
	if (g_zombie[pev(entity, pev_owner)])
	{
		if (model[9] == 'h' && model[10] == 'e' && get_pcvar_num(cvar_extrainfbomb)) // Infection Bomb
		{
			// Give it a glow
			fm_set_rendering(entity, kRenderFxGlowShell, 0, 200, 0, kRenderNormal, 16);
			
			// And a colored trail
			message_begin(MSG_BROADCAST, SVC_TEMPENTITY)
			write_byte(TE_BEAMFOLLOW) // TE id
			write_short(entity) // entity
			write_short(g_trailSpr) // sprite
			write_byte(10) // life
			write_byte(5) // width
			write_byte(80) // r
			write_byte(200) // g
			write_byte(80) // b
			write_byte(150) // brightness
			message_end()
			
			// Set grenade type on the thrown grenade entity
			set_pev(entity, PEV_NADE_TYPE, NADE_TYPE_INFECTION)
		}
		return FMRES_IGNORED
	}
	else if (model[9] == 'h' && model[10] == 'e' && get_pcvar_num(cvar_firegrenades)) // Napalm Grenade
	{
		// Set w_ model
		engfunc(EngFunc_SetModel, entity, model_wgrenade_fire)
		
		// Give it a glow
		fm_set_rendering(entity, kRenderFxGlowShell, 200, 0, 0, kRenderNormal, 16);
		
		// And a colored trail
		message_begin(MSG_BROADCAST, SVC_TEMPENTITY)
		write_byte(TE_BEAMFOLLOW) // TE id
		write_short(entity) // entity
		write_short(g_trailSpr) // sprite
		write_byte(10) // life
		write_byte(5) // width
		write_byte(200) // r
		write_byte(0) // g
		write_byte(0) // b
		write_byte(200) // brightness
		message_end()
		
		// Set grenade type on the thrown grenade entity
		set_pev(entity, PEV_NADE_TYPE, NADE_TYPE_NAPALM)
		
		return FMRES_SUPERCEDE
	}
	else if (model[9] == 'f' && model[10] == 'l' && get_pcvar_num(cvar_frostgrenades)) // Frost Grenade
	{
		// Set w_ model
		engfunc(EngFunc_SetModel, entity, model_wgrenade_frost)
		
		// Give it a glow
		fm_set_rendering(entity, kRenderFxGlowShell, 0, 100, 200, kRenderNormal, 16);
		
		// And a colored trail
		message_begin(MSG_BROADCAST, SVC_TEMPENTITY)
		write_byte(TE_BEAMFOLLOW) // TE id
		write_short(entity) // entity
		write_short(g_trailSpr) // sprite
		write_byte(10) // life
		write_byte(5) // width
		write_byte(0) // r
		write_byte(100) // g
		write_byte(200) // b
		write_byte(200) // brightness
		message_end()
		
		// Set grenade type on the thrown grenade entity
		set_pev(entity, PEV_NADE_TYPE, NADE_TYPE_FROST)
		
		return FMRES_SUPERCEDE
	}
	else if (model[9] == 's' && model[10] == 'm' && get_pcvar_num(cvar_flaregrenades)) // Flare
	{
		// Set w_ model
		engfunc(EngFunc_SetModel, entity, model_wgrenade_flare)
		
		// Build flare's color
		static rgb[3]
		switch (get_pcvar_num(cvar_flarecolor))
		{
			case 0: // white
			{
				rgb[0] = 255 // r
				rgb[1] = 255 // g
				rgb[2] = 255 // b
			}
			case 1: // red
			{
				rgb[0] = random_num(50,255) // r
				rgb[1] = 0 // g
				rgb[2] = 0 // b
			}
			case 2: // green
			{
				rgb[0] = 0 // r
				rgb[1] = random_num(50,255) // g
				rgb[2] = 0 // b
			}
			case 3: // blue
			{
				rgb[0] = 0 // r
				rgb[1] = 0 // g
				rgb[2] = random_num(50,255) // b
			}
			case 4: // random (all colors)
			{
				rgb[0] = random_num(50,200) // r
				rgb[1] = random_num(50,200) // g
				rgb[2] = random_num(50,200) // b
			}
			case 5: // random (r,g,b)
			{
				switch (random_num(1, 3))
				{
					case 1: // red
					{
						rgb[0] = random_num(50,255) // r
						rgb[1] = 0 // g
						rgb[2] = 0 // b
					}
					case 2: // green
					{
						rgb[0] = 0 // r
						rgb[1] = random_num(50,255) // g
						rgb[2] = 0 // b
					}
					case 3: // blue
					{
						rgb[0] = 0 // r
						rgb[1] = 0 // g
						rgb[2] = random_num(50,255) // b
					}
				}
			}
		}
		
		// Give it a glow
		//fm_set_rendering(entity, kRenderFxGlowShell, rgb[0], rgb[1], rgb[2], kRenderNormal, 16);
		
		// And a colored trail
		message_begin(MSG_BROADCAST, SVC_TEMPENTITY)
		write_byte(TE_BEAMFOLLOW) // TE id
		write_short(entity) // entity
		write_short(g_trailSpr) // sprite
		write_byte(10) // life
		write_byte(5) // width
		write_byte(rgb[0]) // r
		write_byte(rgb[1]) // g
		write_byte(rgb[2]) // b
		write_byte(200) // brightness
		message_end()
		
		// Set grenade type on the thrown grenade entity
		set_pev(entity, PEV_NADE_TYPE, NADE_TYPE_FLARE)
		
		// Set flare color on the thrown grenade entity
		//set_pev(entity, PEV_FLARE_COLOR, rgb)
		
		// Set BioHazard flare effect
		set_pev(entity, pev_effects, EF_BRIGHTLIGHT)
		set_pev(entity, pev_iuser4, 8143)
		set_pev(entity, pev_nextthink, g_gametime + get_pcvar_float(cvar_flareduration))
		fm_set_rendering(entity, kRenderFxGlowShell, 150, 150, 250, kRenderNormal, 16)
		
		return FMRES_SUPERCEDE
	}
	return FMRES_IGNORED
}

// Ham Grenade Think Forward
public fw_ThinkGrenade(entity)
{
	// Invalid entity
	if (!pev_valid(entity)) return HAM_IGNORED;

	if(pev(entity, pev_iuser4) == 8143) {
		engfunc(EngFunc_RemoveEntity, entity)
		return HAM_SUPERCEDE;
	}
	
	// Get damage time of grenade
	static Float:dmgtime
	pev(entity, pev_dmgtime, dmgtime)
	
	// Check if it's time to go off
	if (dmgtime > g_gametime)
		return HAM_IGNORED;
	
	// Check if it's one of our custom nades
	switch (pev(entity, PEV_NADE_TYPE))
	{
		case NADE_TYPE_INFECTION: // Infection Bomb
		{
			infection_explode(entity)
			return HAM_SUPERCEDE;
		}
		case NADE_TYPE_NAPALM: // Napalm Grenade
		{
			fire_explode(entity)
			return HAM_SUPERCEDE;
		}
		case NADE_TYPE_FROST: // Frost Grenade
		{
			frost_explode(entity)
			return HAM_SUPERCEDE;
		}
		case NADE_TYPE_FLARE: // Flare
		{
			// Set w_ model
			engfunc(EngFunc_SetModel, entity, model_wgrenade_flare)
		}
	}
	
	return HAM_IGNORED;
}

// Spray
public impulse_201(id) {
	if(!g_isalive[id])
		return PLUGIN_CONTINUE;
	
	if(g_lastdhud[id] > get_systime())
		return PLUGIN_HANDLED;
	
	set_dhudmessage(200, 200, 200, -1.0, 0.3, 0, 6.0, 3.0, 1.5, 1.5)
	show_dhudmessage(id, "[%d %L] - [%d %L]", g_ammopacks[id], id, "AMMO_PACKS2", g_souls[id], id, g_souls[id] % 10 == 0 ? "SOULS0" : g_souls[id] == 1 ? "SOULS1" : g_souls[id] > 4 ? "SOULS0" : "SOULS2")
	g_lastdhud[id] = get_systime() + 7
	return PLUGIN_HANDLED;
}

// Flashlight
public impulse_100(id) {
	// Zombie
	if (g_zombie[id])
		return PLUGIN_HANDLED;
	
	// Not alive
	if (!g_isalive[id] || !g_cached_customflash)
		return PLUGIN_CONTINUE;
	
	// Should human's custom flashlight be turned on?
	if (g_flashbattery[id] > 2 && g_gametime - g_lastflashtime[id] > 0.5) {
		// Prevent calling flashlight too quickly (bugfix)
		g_lastflashtime[id] = g_gametime
		
		// Toggle custom flashlight
		g_flashlight[id] = !g_flashlight[id]
		
		// Play flashlight toggle sound
		emit_sound(id, CHAN_ITEM, sound_flashlight, 1.0, ATTN_NORM, 0, PITCH_NORM)
		
		// Update flashlight status on the HUD
		message_begin(MSG_ONE, g_msgFlashlight, _, id)
		write_byte(g_flashlight[id]) // toggle
		write_byte(g_flashbattery[id]) // battery
		message_end()
		
		// Remove previous tasks
		remove_task(id+TASK_CHARGE)
		remove_task(id+TASK_FLASH)
		
		// Set the flashlight charge task
		set_task(1.0, "flashlight_charge", id+TASK_CHARGE, _, _, "b")
		
		// Call our custom flashlight task if enabled
		if (g_flashlight[id]) set_task(0.1, "set_user_flashlight", id+TASK_FLASH, _, _, "b")
	}
	return PLUGIN_HANDLED;
}

// Forward Player PreThink
public fw_PlayerPreThink(id)
{
	// Not alive
	if (!g_isalive[id])
		return;
	
	// Enable custom buyzone for player during buytime, unless zombie or time expired
	if (g_cached_buytime > 0.0 && !g_zombie[id] && (g_gametime < g_buytime[id] + g_cached_buytime))
	{
		if (pev_valid(g_buyzone_ent))
			dllfunc(DLLFunc_Touch, g_buyzone_ent, id)
	}
	
	// Player frozen?
	if (g_frozen[id])
	{
		set_pev(id, pev_velocity, Float:{0.0,0.0,0.0}) // stop motion
		set_pev(id, pev_v_angle, g_frozen_v_angle[id])
		set_pev(id, pev_angles, g_frozen_v_angle[id])
		set_pev(id, pev_fixangle, 1)
	}
}

public fw_UpdateClientData(id, sendweapons, cd_handle) {
	// Update gametime
	g_gametime = get_gametime();
	
	// Disallow to crouch while frozen
	if(g_frozen[id])
		entity_set_int(id, EV_INT_oldbuttons, entity_get_int(id, EV_INT_oldbuttons) | IN_DUCK);
	
	// Make silent footsteps
	if (g_cached_zombiesilent && g_zombie[id])
		set_pev(id, pev_flTimeStepSound, STEPTIME_SILENT)
		//set_cd(cd_handle, CD_flTimeStepSound, STEPTIME_SILENT)
}

public fw_PlayerDuck(id) {
	// Not alive or frozen or it's freezetime
	if (!g_isalive[id] || g_frozen[id] || g_freezetime)
		return;
	
	// Check if proper CVARs are enabled and retrieve leap settings
	static Float:cooldown
	if (g_zombie[id])
	{
		switch (g_cached_leapzombies)
		{
			case 0: return;
			case 2: if (!g_firstzombie[id]) return;
			case 3: if (!g_lastzombie[id]) return;
		}
		cooldown = g_cached_leapzombiescooldown
	}
	else
	{
		return;
	}
	
	// Cooldown not over yet
	if (g_gametime - g_lastleaptime[id] < cooldown)
		return;
	
	// Not doing a longjump (don't perform check for bots, they leap automatically)
	if (!g_isbot[id] && !(pev(id, pev_button) & IN_JUMP))
		return;
	
	// Not on ground or not enough speed
	if (!(pev(id, pev_flags) & FL_ONGROUND) || fm_get_speed(id) < 80)
	return;
	
	static Float:velocity[3]
	
	// Make velocity vector
	velocity_by_aim(id, get_pcvar_num(cvar_leapzombiesforce), velocity)
	
	// Set custom height
	velocity[2] = get_pcvar_float(cvar_leapzombiesheight)
	
	// Apply the new velocity
	set_pev(id, pev_velocity, velocity)
	
	// Update last leap time
	g_lastleaptime[id] = g_gametime
}

/*================================================================================
 [Client Commands]
=================================================================================*/

// Say "/zpmenu"
public clcmd_saymenu(id)
{
	show_menu_game(id) // show game menu
	return PLUGIN_HANDLED
}

// Say "/unstuck"
public clcmd_sayunstuck(id)
{
	menu_game(id, 3) // try to get unstuck
	return PLUGIN_HANDLED
}

// Nightvision toggle
public cmd_nightvision(id) {
	if(!g_isconnected[id] || g_frozen[id]) return PLUGIN_HANDLED;
	if(!g_nvision[id] && !cs_get_user_nvg(id)) return PLUGIN_HANDLED;
	g_nvisionenabled[id] = !(g_nvisionenabled[id])
	if(g_nvisionenabled[id]) Nvg(id)
	else {
		// Make a fog
		if(g_ambience_fog) {
			message_begin(MSG_ONE, g_msgFog, _, id)
			write_byte(g_fog_color[0])
			write_byte(g_fog_color[1])
			write_byte(g_fog_color[2])
			write_long(_:str_to_float(g_fog_density))
			message_end()
		}
		// Remove nvg
		SetLight(id,"c")
		message_begin(MSG_ONE, g_msgScreenFade, _, id)
		write_short(0)
		write_short(0)
		write_short(0x0000)
		write_byte(100)
		write_byte(100)
		write_byte(100)
		write_byte(255)
		message_end()
	}
	client_cmd(id,g_nvisionenabled[id]?"spk items/nvg_off.wav":"spk items/nvg_off.wav")
	return PLUGIN_HANDLED;
}
public Nvg(id) {
	if(!g_isconnected[id] || g_frozen[id])
		return
	
	SetLight(id,"k")
	if(!g_isalive[id])
		return
	
	// Remove a fog
	if(g_ambience_fog) {
		message_begin(MSG_ONE, g_msgFog, _, id)
		write_byte(0)
		write_byte(0)
		write_byte(0)
		write_long(_:0.001)
		message_end()
	}
	
	message_begin(MSG_ONE, g_msgScreenFade, _, id)
	write_short((1<<12)*2)
	write_short((1<<10)*10)
	write_short(0x0004)
	if(g_zombie[id]) {
		write_byte(ZP_NVG_ZOMBIE_R)
		write_byte(ZP_NVG_ZOMBIE_G)
		write_byte(ZP_NVG_ZOMBIE_B)
		write_byte(100)
	} else {
		write_byte(ZP_NVG_HUMAN_R)
		write_byte(ZP_NVG_HUMAN_G)
		write_byte(ZP_NVG_HUMAN_B)
		write_byte(100)
	}
	message_end()
}

stock SetLight(id, light[2]) {
	if(!g_isconnected[id] && id != 0) return
	if(g_currentmode >= MODE_CUSTOM) {
		ArrayGetString(g_gamemode_lighting, g_currentmode-MODE_CUSTOM, light, charsmax(light))
	}
	if(id != 0) {
		message_begin(MSG_ONE, SVC_LIGHTSTYLE, _, id)
		write_byte(0)
		if(g_nvision[id] && g_nvisionenabled[id]) write_string("k")
		else write_string(light)
		message_end()
	} else {
		for (new i = 1; i <= g_maxplayers; i++) if(g_isconnected[i]) {
			message_begin(MSG_ONE, SVC_LIGHTSTYLE, _, i)
			write_byte(0)
			if(g_nvision[i] && g_nvisionenabled[i]) write_string("k")
			else write_string(light)
			message_end()
		}
	}
}

// Buy BP Ammo
public clcmd_buyammo_prim(id) {
	if (!g_isalive[id] || get_pcvar_num(cvar_infammo))
		return PLUGIN_HANDLED
	
	if (g_zombie[id])
		return PLUGIN_HANDLED
	
	static szWeapons[ 32 ], iNum, i, iCurrentAmmo, iWeapon, bRefilled
	iNum = 0
	bRefilled = false
	get_user_weapons(id, szWeapons, iNum)
	for (i = 0; i < iNum; i++) {
		iWeapon = szWeapons[i]
		if ((1<<iWeapon) & 1509749160) {
			g_iCurrentAmmoValue[id] = BUYAMMO[iWeapon]
			g_iCurrentAmmoCost[id] = AMMOCOST[iWeapon]
			g_iCurrentAmmoMax[id] = MAXBPAMMO[iWeapon]
			ExecuteForward(g_fwBuyAmmoPrimary, g_fwDummyResult, id)
			if(g_ammopacks[id] < g_iCurrentAmmoCost[id]) {
				if(get_pdata_int(id, OFFSET_AMMO[iWeapon], 5) < g_iCurrentAmmoMax[id]) {
					UTIL_TextMsg(id, "#Not_Enough_Money")
					UTIL_BlinkAcct(id, 5)
				}
				return PLUGIN_HANDLED;
			}
			iCurrentAmmo = get_pdata_int(id, OFFSET_AMMO[iWeapon], 5)
			ExecuteHamB(Ham_GiveAmmo, id, g_iCurrentAmmoValue[id], AMMOTYPE[iWeapon], g_iCurrentAmmoMax[id])
			if(get_pdata_int(id, OFFSET_AMMO[iWeapon], 5) - iCurrentAmmo > 0)
				bRefilled = true;
			
			break;
		}
	}
	if (!bRefilled) {
		for (i = 0; i < iNum; i++) {
			iWeapon = szWeapons[i];
			if ((1<<iWeapon) & 1509749160)
				UTIL_TextMsg(id, "#Cannot_Carry_Anymore")
		}
		return PLUGIN_HANDLED
	}
	g_ammopacks[id] = g_ammopacks[id] - g_iCurrentAmmoCost[id]
	emit_sound(id, CHAN_ITEM, sound_buyammo, VOL_NORM, ATTN_NORM, 0, PITCH_NORM)
	return PLUGIN_HANDLED;
}

public clcmd_buyammo_sec(id) {
	if (!g_isalive[id] || get_pcvar_num(cvar_infammo))
		return PLUGIN_HANDLED
	
	if (g_zombie[id])
		return PLUGIN_HANDLED
	
	static szWeapons[ 32 ], iNum, i, iCurrentAmmo, iWeapon, bRefilled
	iNum = 0
	bRefilled = false
	get_user_weapons(id, szWeapons, iNum)
	for (i = 0; i < iNum; i++) {
		iWeapon = szWeapons[i]
		if((1<<iWeapon) & 67308546) {
			g_iCurrentAmmoValue[id] = BUYAMMO[iWeapon]
			g_iCurrentAmmoCost[id] = AMMOCOST[iWeapon]
			g_iCurrentAmmoMax[id] = MAXBPAMMO[iWeapon]
			ExecuteForward(g_fwBuyAmmoSecondary, g_fwDummyResult, id)
			if(g_ammopacks[id] < g_iCurrentAmmoCost[id]) {
				if(get_pdata_int(id, OFFSET_AMMO[iWeapon], 5) < g_iCurrentAmmoMax[id]) {
					UTIL_TextMsg(id, "#Not_Enough_Money")
					UTIL_BlinkAcct(id, 5)
				}
				return PLUGIN_HANDLED;
			}
			iCurrentAmmo = get_pdata_int(id, OFFSET_AMMO[iWeapon], 5)
			ExecuteHamB(Ham_GiveAmmo, id, g_iCurrentAmmoValue[id], AMMOTYPE[iWeapon], g_iCurrentAmmoMax[id])
			if(get_pdata_int(id, OFFSET_AMMO[iWeapon], 5) - iCurrentAmmo > 0)
				bRefilled = true;
			
			break;
		}
	}
	if (!bRefilled) {
		for (i = 0; i < iNum; i++) {
			iWeapon = szWeapons[i];
			if((1<<iWeapon) & 67308546)
				UTIL_TextMsg(id, "#Cannot_Carry_Anymore")
		}
		return PLUGIN_HANDLED
	}
	g_ammopacks[id] = g_ammopacks[id] - g_iCurrentAmmoCost[id]
	emit_sound(id, CHAN_ITEM, sound_buyammo, VOL_NORM, ATTN_NORM, 0, PITCH_NORM)
	return PLUGIN_HANDLED;
}

// Block Team Change
public clcmd_changeteam(id)
{
	static team
	team = fm_cs_get_user_team(id)
	
	// Unless it's a spectator joining the game
	if (team == FM_CS_TEAM_SPECTATOR || team == FM_CS_TEAM_UNASSIGNED)
		return PLUGIN_CONTINUE;
	
	// Pressing 'M' (chooseteam) ingame should show the main menu instead
	show_menu_game(id)
	return PLUGIN_HANDLED;
}

/*================================================================================
 [Menus]
=================================================================================*/

// Game Menu
show_menu_game(id)
{
	// Player disconnected?
	if (!g_isconnected[id])
		return PLUGIN_CONTINUE
	
	static menu[512], len, userflags
	len = 0
	userflags = get_user_flags(id)
	
	// Title
	len += formatex(menu[len], charsmax(menu) - len, "\y%s^n^n", g_modname)
	
	// 1. Buy weapons
	if (get_pcvar_num(cvar_buycustom))
		len += formatex(menu[len], charsmax(menu) - len, "\w1. %L^n", id, "MENU_BUY")
	else
		len += formatex(menu[len], charsmax(menu) - len, "\d1. %L^n", id, "MENU_BUY")
	
	// 2. Extra items
	if (get_pcvar_num(cvar_extraitems) && g_isalive[id])
		len += formatex(menu[len], charsmax(menu) - len, "\w2. %L^n", id, "MENU_EXTRABUY")
	else
		len += formatex(menu[len], charsmax(menu) - len, "\d2. %L^n", id, "MENU_EXTRABUY")
	
	// 3. Zombie class
	if (get_pcvar_num(cvar_zclasses))
		len += formatex(menu[len], charsmax(menu) - len, "\w3. %L^n", id,"MENU_ZCLASS")
	else
		len += formatex(menu[len], charsmax(menu) - len, "\d3. %L^n", id,"MENU_ZCLASS")
	
	// 4. Unstuck
	if (g_isalive[id])
		len += formatex(menu[len], charsmax(menu) - len, "\w4. %L^n", id, "MENU_UNSTUCK")
	else
		len += formatex(menu[len], charsmax(menu) - len, "\d4. %L^n", id, "MENU_UNSTUCK")
	
	// 5. Join spec
	if (!g_isalive[id] || !get_pcvar_num(cvar_blocksuicide))
		len += formatex(menu[len], charsmax(menu) - len, "\w5. %L^n^n", id, "MENU_SPECTATOR")
	else
		len += formatex(menu[len], charsmax(menu) - len, "\d5. %L^n^n", id, "MENU_SPECTATOR")
	
	// 8. Server info
	len += formatex(menu[len], charsmax(menu) - len, "\w8. %L^n", id, "MENU_SERVERINFO")
	
	// 9. Admin menu
	if (userflags & g_access_flag[ACCESS_ADMIN_MENU])
		len += formatex(menu[len], charsmax(menu) - len, "\w9. %L", id, "MENU_ADMIN")
	else
		len += formatex(menu[len], charsmax(menu) - len, "\d9. %L", id, "MENU_ADMIN")
	
	// 0. Exit
	len += formatex(menu[len], charsmax(menu) - len, "^n^n\w0. %L", id, "MENU_EXIT")
	
	// Fix for AMXX custom menus
	if (pev_valid(id) == PDATA_SAFE)
		set_pdata_int(id, OFFSET_CSMENUCODE, 0, OFFSET_LINUX)
	
	show_menu(id, KEYSMENU, menu, -1, "Game Menu")
	return PLUGIN_HANDLED
}

// Buy Menu 1
public show_menu_buy1(taskid)
{
	// Get player's id
	static id
	(taskid > g_maxplayers) ? (id = ID_SPAWN) : (id = taskid);
	
	// Player dead?
	if (!g_isalive[id])
		return;
	
	// Zombies get no guns
	if (g_zombie[id])
		return;
	
	// Bots pick their weapons randomly / Random weapons setting enabled
	if (get_pcvar_num(cvar_randweapons) || g_isbot[id])
	{
		buy_primary_weapon(id, random_num(0, ArraySize(g_primary_items) - 1))
		menu_buy2(id, random_num(0, ArraySize(g_secondary_items) - 1))
		return;
	}
	
	// Automatic selection enabled for player and menu called on spawn event
	if (WPN_AUTO_ON && taskid > g_maxplayers)
	{
		buy_primary_weapon(id, WPN_AUTO_PRI)
		menu_buy2(id, WPN_AUTO_SEC)
		return;
	}
	
	static menu[300], len, weap, maxloops
	len = 0
	maxloops = min(WPN_STARTID+7, WPN_MAXIDS)
	
	// Title
	len += formatex(menu[len], charsmax(menu) - len, "\y%L \r[%d-%d]^n^n", id, "MENU_BUY1_TITLE", WPN_STARTID+1, min(WPN_STARTID+7, WPN_MAXIDS))
	
	// 1-7. Weapon List
	for (weap = WPN_STARTID; weap < maxloops; weap++)
		len += formatex(menu[len], charsmax(menu) - len, "\w%d. %s^n", weap-WPN_STARTID+1, WEAPONNAMES[ArrayGetCell(g_primary_weaponids, weap)])
	
	// 8. Auto Select
	len += formatex(menu[len], charsmax(menu) - len, "^n\w8. %L \y[%L]", id, "MENU_AUTOSELECT", id, (WPN_AUTO_ON) ? "MOTD_ENABLED" : "MOTD_DISABLED")
	
	// 9. Next/Back - 0. Exit
	len += formatex(menu[len], charsmax(menu) - len, "^n^n\w9. %L/%L^n^n\w0. %L", id, "MENU_NEXT", id, "MENU_BACK", id, "MENU_EXIT")
	
	// Fix for AMXX custom menus
	if (pev_valid(id) == PDATA_SAFE)
		set_pdata_int(id, OFFSET_CSMENUCODE, 0, OFFSET_LINUX)
	
	show_menu(id, KEYSMENU, menu, -1, "Buy Menu 1")
}

// Buy Menu 2
show_menu_buy2(id)
{
	// Player dead?
	if (!g_isalive[id])
		return;
	
	static menu[250], len, weap, maxloops
	len = 0
	maxloops = ArraySize(g_secondary_items)
	
	// Title
	len += formatex(menu[len], charsmax(menu) - len, "\y%L^n", id, "MENU_BUY2_TITLE")
	
	// 1-6. Weapon List
	for (weap = 0; weap < maxloops; weap++)
		len += formatex(menu[len], charsmax(menu) - len, "^n\w%d. %s", weap+1, WEAPONNAMES[ArrayGetCell(g_secondary_weaponids, weap)])
	
	// 8. Auto Select
	len += formatex(menu[len], charsmax(menu) - len, "^n^n\w8. %L \y[%L]", id, "MENU_AUTOSELECT", id, (WPN_AUTO_ON) ? "MOTD_ENABLED" : "MOTD_DISABLED")
	
	// 0. Exit
	len += formatex(menu[len], charsmax(menu) - len, "^n^n\w0. %L", id, "MENU_EXIT")
	
	// Fix for AMXX custom menus
	if (pev_valid(id) == PDATA_SAFE)
		set_pdata_int(id, OFFSET_CSMENUCODE, 0, OFFSET_LINUX)
	
	show_menu(id, KEYSMENU, menu, -1, "Buy Menu 2")
}

// Zombie Class Menu
public show_menu_zclass(id)
{
	// Player disconnected
	if (!g_isconnected[id])
		return;
	
	// Bots pick their zombie class randomly
	if (g_isbot[id])
	{
		g_zombieclassnext[id] = random_num(0, g_zclass_i - 1)
		return;
	}
	
	static menuid, menu[512], class, buffer[32], cost1, cost2
	
	// Title
	formatex(menu, charsmax(menu), "%L^n\d%d %L \y| \d%d %L\r", id, "MENU_ZCLASS_TITLE", g_ammopacks[id], id, "AMMO_PACKS2", g_souls[id],
		id, g_souls[id] % 10 == 0 ? "SOULS0" : g_souls[id] == 1 ? "SOULS1" : g_souls[id] > 4 ? "SOULS0" : "SOULS2")
	menuid = menu_create(menu, "menu_zclass")
	
	// Class List
	for (class = 0; class < g_zclass_i; class++)
	{
		// Retrieve name and info
		ArrayGetString(g_zclass_name, class, buffer, charsmax(buffer))
		
		// Add to menu
		cost1 = ArrayGetCell(g_zclass_cost1, class)
		cost2 = ArrayGetCell(g_zclass_cost2, class)
			
		if (class == g_zombieclassnext[id])
			formatex(menu, charsmax(menu), "%s \y[%L]", buffer, id, "CLASS_CHOSEN")
		else if (class == g_zombieclass[id] && class != g_zombieclassnext[id] && g_zombie[id])
			formatex(menu, charsmax(menu), "%s \y[%L]", buffer, id, "CLASS_CURRENT")
		else if(ArrayGetCell(g_zclass_vip, class) && ~get_user_flags(id) & g_access_flag[ACCESS_VIP])
			formatex(menu, charsmax(menu), "\d%s [VIP]", buffer)
		else if(g_hasclass[id][class] || (cost1 == 0 && cost2 == 0))
			formatex(menu, charsmax(menu), "%s", buffer)
		else if(cost1 > 0 && cost2 > 0)
			formatex(menu, charsmax(menu), "%s \y[%L: \w%d\y] [%L: \w%d\y]", buffer, id, "AMMO_PACKS2", cost1, id, "SOULS1", cost2)
		else if(cost1 > 0 && cost2 == 0)
			formatex(menu, charsmax(menu), "%s \y[%L: \w%d\y]", buffer, id, "AMMO_PACKS2", cost1)
		else if(cost1 == 0&& cost2 > 0)
			formatex(menu, charsmax(menu), "%s \y[%L: \w%d\y]", buffer, id, "SOULS1", cost2)
		
		buffer[0] = class
		buffer[1] = 0
		menu_additem(menuid, menu, buffer)
	}
	
	// Back - Next - Exit
	formatex(menu, charsmax(menu), "%L", id, "MENU_BACK")
	menu_setprop(menuid, MPROP_BACKNAME, menu)
	formatex(menu, charsmax(menu), "%L", id, "MENU_NEXT")
	menu_setprop(menuid, MPROP_NEXTNAME, menu)
	formatex(menu, charsmax(menu), "%L", id, "MENU_EXIT")
	menu_setprop(menuid, MPROP_EXITNAME, menu)
	menu_setprop(menuid, MPROP_NUMBER_COLOR, "\w")
	
	// If remembered page is greater than number of pages, clamp down the value
	MENU_PAGE_ZCLASS = min(MENU_PAGE_ZCLASS, menu_pages(menuid)-1)
	
	// Fix for AMXX custom menus
	if (pev_valid(id) == PDATA_SAFE)
		set_pdata_int(id, OFFSET_CSMENUCODE, 0, OFFSET_LINUX)
	
	menu_display(id, menuid, MENU_PAGE_ZCLASS)
}

// Admin Menu
show_menu_admin(id)
{
	// Player disconnected?
	if (!g_isconnected[id])
		return;
	
	static menu[250], len, userflags
	len = 0
	userflags = get_user_flags(id)
	
	// Title
	len += formatex(menu[len], charsmax(menu) - len, "\y%L^n^n", id, "MENU_ADMIN_TITLE")
	
	// 1. Zombiefy/Humanize command
	if (userflags & (g_access_flag[ACCESS_MODE_INFECTION] | g_access_flag[ACCESS_MAKE_ZOMBIE] | g_access_flag[ACCESS_MAKE_HUMAN]))
		len += formatex(menu[len], charsmax(menu) - len, "\w1. %L^n", id, "MENU_ADMIN1")
	else
		len += formatex(menu[len], charsmax(menu) - len, "\d1. %L^n", id, "MENU_ADMIN1")
	
	// 2. Respawn command
	if (userflags & g_access_flag[ACCESS_RESPAWN_PLAYERS])
		len += formatex(menu[len], charsmax(menu) - len, "\w2. %L^n", id, "MENU_ADMIN4")
	else
		len += formatex(menu[len], charsmax(menu) - len, "\d2. %L^n", id, "MENU_ADMIN4")
	
	// 3. Multi infection command
	if ((userflags & g_access_flag[ACCESS_MODE_MULTI]) && allowed_multi())
		len += formatex(menu[len], charsmax(menu) - len, "\w3. %L^n", id, "MENU_ADMIN6")
	else
		len += formatex(menu[len], charsmax(menu) - len, "\d3. %L^n", id, "MENU_ADMIN6")
	
	// 0. Exit
	len += formatex(menu[len], charsmax(menu) - len, "^n\w0. %L", id, "MENU_EXIT")
	
	// Fix for AMXX custom menus
	if (pev_valid(id) == PDATA_SAFE)
		set_pdata_int(id, OFFSET_CSMENUCODE, 0, OFFSET_LINUX)
	
	show_menu(id, KEYSMENU, menu, -1, "Admin Menu")
}

// Player List Menu
show_menu_player_list(id)
{
	// Player disconnected?
	if (!g_isconnected[id])
		return;
	
	static menuid, menu[128], player, userflags, buffer[2]
	userflags = get_user_flags(id)
	
	// Title
	switch (PL_ACTION)
	{
		case ACTION_ZOMBIEFY_HUMANIZE: formatex(menu, charsmax(menu), "%L\r", id, "MENU_ADMIN1")
		case ACTION_RESPAWN_PLAYER: formatex(menu, charsmax(menu), "%L\r", id, "MENU_ADMIN4")
	}
	menuid = menu_create(menu, "menu_player_list")
	
	// Player List
	for (player = 0; player <= g_maxplayers; player++)
	{
		// Skip if not connected
		if (!g_isconnected[player])
			continue;
		
		// Format text depending on the action to take
		switch (PL_ACTION)
		{
			case ACTION_ZOMBIEFY_HUMANIZE: // Zombiefy/Humanize command
			{
				if (g_zombie[player])
				{
					if (allowed_human(player) && (userflags & g_access_flag[ACCESS_MAKE_HUMAN]))
						formatex(menu, charsmax(menu), "%s \r[%L]", g_playername[player], id, "CLASS_ZOMBIE")
					else
						formatex(menu, charsmax(menu), "\d%s [%L]", g_playername[player], id, "CLASS_ZOMBIE")
				}
				else
				{
					if (allowed_zombie(player) && (g_newround ? (userflags & g_access_flag[ACCESS_MODE_INFECTION]) : (userflags & g_access_flag[ACCESS_MAKE_ZOMBIE])))
						formatex(menu, charsmax(menu), "%s \y[%L]", g_playername[player], id, "CLASS_HUMAN")
					else
						formatex(menu, charsmax(menu), "\d%s [%L]", g_playername[player], id, "CLASS_HUMAN")
				}
			}
			case ACTION_RESPAWN_PLAYER: // Respawn command
			{
				if (allowed_respawn(player) && (userflags & g_access_flag[ACCESS_RESPAWN_PLAYERS]))
					formatex(menu, charsmax(menu), "%s", g_playername[player])
				else
					formatex(menu, charsmax(menu), "\d%s", g_playername[player])
			}
		}
		
		// Add player
		buffer[0] = player
		buffer[1] = 0
		menu_additem(menuid, menu, buffer)
	}
	
	// Back - Next - Exit
	formatex(menu, charsmax(menu), "%L", id, "MENU_BACK")
	menu_setprop(menuid, MPROP_BACKNAME, menu)
	formatex(menu, charsmax(menu), "%L", id, "MENU_NEXT")
	menu_setprop(menuid, MPROP_NEXTNAME, menu)
	formatex(menu, charsmax(menu), "%L", id, "MENU_EXIT")
	menu_setprop(menuid, MPROP_EXITNAME, menu)
	menu_setprop(menuid, MPROP_NUMBER_COLOR, "\w")
	
	// If remembered page is greater than number of pages, clamp down the value
	MENU_PAGE_PLAYERS = min(MENU_PAGE_PLAYERS, menu_pages(menuid)-1)
	
	// Fix for AMXX custom menus
	if (pev_valid(id) == PDATA_SAFE)
		set_pdata_int(id, OFFSET_CSMENUCODE, 0, OFFSET_LINUX)
	
	menu_display(id, menuid, MENU_PAGE_PLAYERS)
}

/*================================================================================
 [Menu Handlers]
=================================================================================*/

// Game Menu
public menu_game(id, key)
{
	// Player disconnected?
	if (!g_isconnected[id])
		return PLUGIN_HANDLED;
	
	switch (key)
	{
		case 0: // Buy Weapons
		{
			// Custom buy menus enabled?
			if (get_pcvar_num(cvar_buycustom))
			{
				// Disable the remember selection setting
				WPN_AUTO_ON = 0
				client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "BUY_ENABLED")
				
				// Show menu if player hasn't yet bought anything
				if (g_canbuy[id]) show_menu_buy1(id)
			}
			else
				client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
		}
		case 1: client_cmd(id, "buy")
		case 2: // Zombie Classes
		{
			// Zombie classes enabled?
			if (get_pcvar_num(cvar_zclasses))
				show_menu_zclass(id)
			else
				client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT_ZCLASSES")
		}
		case 3: // Unstuck
		{
			// Check if player is stuck
			if (g_isalive[id])
			{
				if (is_player_stuck(id))
				{
					// Move to an initial spawn
					if (get_pcvar_num(cvar_randspawn))
						do_random_spawn(id) // random spawn (including CSDM)
					else
						do_random_spawn(id, 1) // regular spawn
				}
				else
					client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT_STUCK")
			}
			else
				client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
		}
		case 4: // Join Spectator
		{
			// Player alive?
			if (g_isalive[id])
			{
				// Prevent abuse by non-admins if block suicide setting is enabled
				if (get_pcvar_num(cvar_blocksuicide))
				{
					client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
					return PLUGIN_HANDLED;
				}
				
				// Check that we still have both humans and zombies to keep the round going
				check_round(id)
				
				// Kill him before he switches team
				dllfunc(DLLFunc_ClientKill, id)
			}
			
			// Temporarily save player stats?
			if (get_pcvar_num(cvar_statssave)) save_stats(id)
			
			// Remove previous tasks
			remove_task(id+TASK_TEAM)
			remove_task(id+TASK_MODEL)
			remove_task(id+TASK_FLASH)
			remove_task(id+TASK_CHARGE)
			remove_task(id+TASK_SPAWN)
			remove_task(id+TASK_BLOOD)
			remove_task(id+TASK_AURA)
			remove_task(id+TASK_BURN)
			
			// Then move him to the spectator team
			fm_cs_set_user_team(id, FM_CS_TEAM_SPECTATOR)
			fm_user_team_update(id)
		}
		case 7: // Server info
		{
			menu_serverinfo(id)
		}
		case 8: // Admin Menu
		{
			// Check if player has the required access
			if (get_user_flags(id) & g_access_flag[ACCESS_ADMIN_MENU])
				client_cmd(id, "amxmodmenu")
			else
				client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT_ACCESS")
		}
	}
	
	return PLUGIN_HANDLED;
}

public menu_serverinfo(id) {
	// Player disconnected?
	if (!g_isconnected[id])
		return PLUGIN_CONTINUE
	
	new motd[128]
	formatex(motd, charsmax(motd), "<META http-equiv=refresh content=^"0;URL=%s^">", BUY_MOTD)
	show_motd(id, motd, "")
	return PLUGIN_HANDLED
}

public clcmd_about(id) {
	client_print(id, print_console, "-----------------------------")
	client_print(id, print_console, "Zombie Nightmare %s", PLUGIN_VERSION)
	client_print(id, print_console, "Author: baarsik")
	client_print(id, print_console, "-----------------------------")
	client_print(id, print_console, "- Additional info")
	client_print(id, print_console, "PREFIX: %s", ZP_PREFIX)
	client_print(id, print_console, "MOTD URL: %s", BUY_MOTD)
	client_print(id, print_console, "-----------------------------")
	return PLUGIN_HANDLED
}

public menu_server(id, key) {
	// Player disconnected?
	if (!g_isconnected[id])
		return PLUGIN_HANDLED;
	
	switch (key) {
		case 0: show_menu_game(id)
	}
	return PLUGIN_HANDLED;
}

// Buy Menu 1
public menu_buy1(id, key)
{
	// Player dead?
	if (!g_isalive[id])
		return PLUGIN_HANDLED;
	
	// Zombies get no guns
	if (g_zombie[id])
		return PLUGIN_HANDLED;
	
	// Special keys / weapon list exceeded
	if (key >= MENU_KEY_AUTOSELECT || WPN_SELECTION >= WPN_MAXIDS)
	{
		switch (key)
		{
			case MENU_KEY_AUTOSELECT: // toggle auto select
			{
				WPN_AUTO_ON = 1 - WPN_AUTO_ON
			}
			case MENU_KEY_NEXT: // next/back
			{
				if (WPN_STARTID+7 < WPN_MAXIDS)
					WPN_STARTID += 7
				else
					WPN_STARTID = 0
			}
			case MENU_KEY_EXIT: // exit
			{
				return PLUGIN_HANDLED;
			}
		}
		
		// Show buy menu again
		show_menu_buy1(id)
		return PLUGIN_HANDLED;
	}
	
	// Store selected weapon id
	WPN_AUTO_PRI = WPN_SELECTION
	
	// Buy primary weapon
	buy_primary_weapon(id, WPN_AUTO_PRI)
	
	// Show pistols menu
	show_menu_buy2(id)
	
	return PLUGIN_HANDLED;
}

// Buy Primary Weapon
buy_primary_weapon(id, selection)
{
	// Drop previous weapons
	drop_weapons(id, 1)
	drop_weapons(id, 2)
	
	// Remove grenades
	cs_set_user_bpammo(id, CSW_HEGRENADE, 0)
	cs_set_user_bpammo(id, CSW_FLASHBANG, 0)
	cs_set_user_bpammo(id, CSW_SMOKEGRENADE, 0)
	
	// Get weapon's id and name
	static weaponid, wname[32]
	weaponid = ArrayGetCell(g_primary_weaponids, selection)
	ArrayGetString(g_primary_items, selection, wname, charsmax(wname))
	
	// Give the new weapon and full ammo
	fm_give_item(id, wname)
	ExecuteHamB(Ham_GiveAmmo, id, MAXBPAMMO[weaponid], AMMOTYPE[weaponid], MAXBPAMMO[weaponid])
	
	// Weapons bought
	g_canbuy[id] = false
	
	// Give additional items
	static i
	for (i = 0; i < ArraySize(g_additional_items); i++)
	{
		ArrayGetString(g_additional_items, i, wname, charsmax(wname))
		fm_give_item(id, wname)
	}
}

// Buy Menu 2
public menu_buy2(id, key)
{
	// Player dead?
	if (!g_isalive[id])
		return PLUGIN_HANDLED;
	
	// Zombies get no guns
	if (g_zombie[id])
		return PLUGIN_HANDLED;
	
	// Special keys / weapon list exceeded
	if (key >= ArraySize(g_secondary_items))
	{
		// Toggle autoselect
		if (key == MENU_KEY_AUTOSELECT)
			WPN_AUTO_ON = 1 - WPN_AUTO_ON
		
		// Reshow menu unless user exited
		if (key != MENU_KEY_EXIT)
			show_menu_buy2(id)
		
		return PLUGIN_HANDLED;
	}
	
	// Store selected weapon
	WPN_AUTO_SEC = key
	
	// Drop secondary gun again, in case we picked another (bugfix)
	drop_weapons(id, 2)
	
	// Get weapon's id
	static weaponid, wname[32]
	weaponid = ArrayGetCell(g_secondary_weaponids, key)
	ArrayGetString(g_secondary_items, key, wname, charsmax(wname))
	
	// Give the new weapon and full ammo
	fm_give_item(id, wname)
	ExecuteHamB(Ham_GiveAmmo, id, MAXBPAMMO[weaponid], AMMOTYPE[weaponid], MAXBPAMMO[weaponid])
	
	return PLUGIN_HANDLED;
}

// Extra Items Menu
public menu_extras(id, menuid, item)
{
	// Player disconnected?
	if (!is_user_connected(id))
	{
		menu_destroy(menuid)
		return PLUGIN_HANDLED;
	}
	
	// Remember player's menu page
	static menudummy
	player_menu_info(id, menudummy, menudummy, MENU_PAGE_EXTRAS)
	
	// Menu was closed
	if (item == MENU_EXIT)
	{
		menu_destroy(menuid)
		return PLUGIN_HANDLED;
	}
	
	// Dead players are not allowed to buy items
	if (!g_isalive[id])
	{
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
		menu_destroy(menuid)
		return PLUGIN_HANDLED;
	}
	
	// Retrieve extra item id
	static buffer[2], dummy, itemid
	menu_item_getinfo(menuid, item, dummy, buffer, charsmax(buffer), _, _, dummy)
	itemid = buffer[0]
	
	// Attempt to buy the item
	buy_extra_item(id, itemid)
	menu_destroy(menuid)
	return PLUGIN_HANDLED;
}

// Buy Extra Item
buy_extra_item(id, itemid, ignorecost = 0)
{
	// Retrieve item's team
	static team
	team = ArrayGetCell(g_extraitem_team, itemid)
	
	// Check for team/class specific items
	if ((g_zombie[id] && !(team & ZP_TEAM_ZOMBIE)) || (!g_zombie[id] && !(team & ZP_TEAM_HUMAN)))
	{
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
		return;
	}
	
	// Check for unavailable items
	if ((itemid == EXTRA_NVISION && !get_pcvar_num(cvar_extranvision))
	|| (itemid == EXTRA_ANTIDOTE && (!get_pcvar_num(cvar_extraantidote) || g_antidotecounter >= get_pcvar_num(cvar_antidotelimit)))
	|| (itemid == EXTRA_INFBOMB && (!get_pcvar_num(cvar_extrainfbomb) || g_infbombcounter >= get_pcvar_num(cvar_infbomblimit)))
	|| (itemid >= EXTRA_WEAPONS_STARTID && itemid <= EXTRAS_CUSTOM_STARTID-1 && !get_pcvar_num(cvar_extraweapons)))
	{
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
		return;
	}
	
	// Check for hard coded items with special conditions
	if ((itemid == EXTRA_ANTIDOTE && (g_endround || fnGetZombies() <= 1 || (get_pcvar_num(cvar_deathmatch) && !get_pcvar_num(cvar_respawnafterlast) && fnGetHumans() == 1)))
	|| (itemid == EXTRA_INFBOMB && g_endround))
	{
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT_CANTUSE")
		return;
	}
	
	// Ignore item's cost?
	if (!ignorecost)
	{
		// Check that we have enough ammo packs
		if (g_ammopacks[id] < ArrayGetCell(g_extraitem_cost, itemid))
		{
			client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "NOT_ENOUGH_AMMO")
			return;
		}
		
		// Deduce item cost
		g_ammopacks[id] -= ArrayGetCell(g_extraitem_cost, itemid)
	}
	
	// Check which kind of item we're buying
	switch (itemid)
	{
		case EXTRA_NVISION: // Night Vision
		{
			g_nvision[id] = true
			
			if (!g_isbot[id])
			{
				g_nvisionenabled[id] = true
				Nvg(id)
			}
			else
				cs_set_user_nvg(id, 1)
		}
		case EXTRA_ANTIDOTE: // Antidote
		{
			// Increase antidote purchase count for this round
			g_antidotecounter++
			
			humanme(id, 0)
		}
		case EXTRA_INFBOMB: // Infection Bomb
		{
			// Increase infection bomb purchase count for this round
			g_infbombcounter++
			
			// Already own one
			if (user_has_weapon(id, CSW_HEGRENADE))
			{
				// Increase BP ammo on it instead
				cs_set_user_bpammo(id, CSW_HEGRENADE, cs_get_user_bpammo(id, CSW_HEGRENADE) + 1)
				
				// Flash ammo in hud
				message_begin(MSG_ONE_UNRELIABLE, g_msgAmmoPickup, _, id)
				write_byte(AMMOID[CSW_HEGRENADE]) // ammo id
				write_byte(1) // ammo amount
				message_end()
				
				// Play clip purchase sound
				emit_sound(id, CHAN_ITEM, sound_buyammo, 1.0, ATTN_NORM, 0, PITCH_NORM)
				
				return; // stop here
			}
			
			// Give weapon to the player
			fm_give_item(id, "weapon_hegrenade")
		}
		default:
		{
			if (itemid >= EXTRA_WEAPONS_STARTID && itemid <= EXTRAS_CUSTOM_STARTID-1) // Weapons
			{
				// Get weapon's id and name
				static weaponid, wname[32]
				ArrayGetString(g_extraweapon_items, itemid - EXTRA_WEAPONS_STARTID, wname, charsmax(wname))
				weaponid = cs_weapon_name_to_id(wname)
				
				// If we are giving a primary/secondary weapon
				if (MAXBPAMMO[weaponid] > 2)
				{
					// Make user drop the previous one
					if ((1<<weaponid) & PRIMARY_WEAPONS_BIT_SUM)
						drop_weapons(id, 1)
					else
						drop_weapons(id, 2)
					
					// Give full BP ammo for the new one
					ExecuteHamB(Ham_GiveAmmo, id, MAXBPAMMO[weaponid], AMMOTYPE[weaponid], MAXBPAMMO[weaponid])
				}
				// If we are giving a grenade which the user already owns
				else if (user_has_weapon(id, weaponid))
				{
					// Increase BP ammo on it instead
					cs_set_user_bpammo(id, weaponid, cs_get_user_bpammo(id, weaponid) + 1)
					
					// Flash ammo in hud
					message_begin(MSG_ONE_UNRELIABLE, g_msgAmmoPickup, _, id)
					write_byte(AMMOID[weaponid]) // ammo id
					write_byte(1) // ammo amount
					message_end()
					
					// Play clip purchase sound
					emit_sound(id, CHAN_ITEM, sound_buyammo, 1.0, ATTN_NORM, 0, PITCH_NORM)
					
					return; // stop here
				}
				
				// Give weapon to the player
				fm_give_item(id, wname)
			}
			else // Custom additions
			{
				// Item selected forward
				ExecuteForward(g_fwExtraItemSelected, g_fwDummyResult, id, itemid);
				
				// Item purchase blocked, restore buyer's ammo packs
				if (g_fwDummyResult >= ZP_PLUGIN_HANDLED && !ignorecost)
					g_ammopacks[id] += ArrayGetCell(g_extraitem_cost, itemid)
			}
		}
	}
}

// Zombie Class Menu
public menu_zclass(id, menuid, item)
{
	// Player disconnected?
	if (!is_user_connected(id))
	{
		menu_destroy(menuid)
		return PLUGIN_HANDLED;
	}
	
	// Remember player's menu page
	static menudummy
	player_menu_info(id, menudummy, menudummy, MENU_PAGE_ZCLASS)
	
	// Menu was closed
	if (item == MENU_EXIT)
	{
		menu_destroy(menuid)
		return PLUGIN_HANDLED;
	}
	
	// Retrieve zombie class id
	static buffer[2], dummy, classid
	menu_item_getinfo(menuid, item, dummy, buffer, charsmax(buffer), _, _, dummy)
	classid = buffer[0]
	
	// Store selection for the next infection
	new zombieclassprev = g_zombieclassnext[id]
	g_zombieclassnext[id] = classid
		
	static name[32]
	ArrayGetString(g_zclass_name, g_zombieclassnext[id], name, charsmax(name))
	replace_all(name, charsmax(name), "\y", "")
	replace_all(name, charsmax(name), "\d", "")
	replace_all(name, charsmax(name), "\w", "")
	replace_all(name, charsmax(name), "\r", "")
	
	new cost1 = ArrayGetCell(g_zclass_cost1, g_zombieclassnext[id])
	new cost2 = ArrayGetCell(g_zclass_cost2, g_zombieclassnext[id])
	
	// Show selected zombie class info and stats
	if(ArrayGetCell(g_zclass_vip, g_zombieclassnext[id]) > 0 && ~get_user_flags(id) & g_access_flag[ACCESS_VIP]) {
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "ZOMBIE_VIP")
		g_zombieclassnext[id] = zombieclassprev
	} else if(!g_hasclass[id][g_zombieclassnext[id]] && (cost1 > g_ammopacks[id] || cost2 > g_souls[id])) {
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "ZOMBIE_NOMONEY")
		g_zombieclassnext[id] = zombieclassprev
	} else if(!g_hasclass[id][g_zombieclassnext[id]]) {
		if(cost1 > 0 || cost2 > 0) {
			client_print_color(id, print_team_default, "^x04[%s]^x01 %L:^x04 %s", ZP_PREFIX, id, "ZOMBIE_BUYOK", name)
			g_ammopacks[id] -= cost1;
			g_souls[id] -= cost2;
		}
		g_hasclass[id][g_zombieclassnext[id]] = true;
		if(zombieclassprev == ZCLASS_NONE && g_gametime_infect[id] >= g_gametime - 7) {
			if(cost1 == 0 && cost2 == 0)
				client_print_color(id, print_team_default, "^x04[%s]^x01 %L:^x04 %s", ZP_PREFIX, id, "ZOMBIE_SELECTED", name)
			g_zombieclass[id] = classid
			g_zombie_spd[id] = float(ArrayGetCell(g_zclass_spd, classid))
			g_zombie_knockback[id] = Float:ArrayGetCell(g_zclass_kb, classid)
			ArrayGetString(g_zclass_name, classid, g_zombie_classname[id], charsmax(g_zombie_classname[]))
			if(fnGetZombies() == 1) fm_set_user_health(id, floatround(float(ArrayGetCell(g_zclass_hp, classid)) * get_pcvar_float(cvar_zombiefirsthp)))
			else fm_set_user_health(id, ArrayGetCell(g_zclass_hp, classid))
			if (!g_frozen[id]) set_pev(id, pev_gravity, Float:ArrayGetCell(g_zclass_grav, classid))
			else g_frozen_gravity[id] = Float:ArrayGetCell(g_zclass_grav, classid)
			ExecuteHamB(Ham_Player_ResetMaxSpeed, id)
		} else if(!g_zombie[id] || zombieclassprev != classid) {
			if(cost1 == 0 && cost2 == 0)
				client_print_color(id, print_team_default, "^x04[%s]^x01 %L:^x04 %s", ZP_PREFIX, id, "ZOMBIE_SELECT", name)
			client_print_color(id, print_team_default, "^x04[%s]^x01 %L: %d %L: %d %L: %d %L: %d%%", ZP_PREFIX, id, "ZOMBIE_ATTRIB1", ArrayGetCell(g_zclass_hp, classid), id, "ZOMBIE_ATTRIB2", ArrayGetCell(g_zclass_spd, classid),
			id, "ZOMBIE_ATTRIB3", floatround(Float:ArrayGetCell(g_zclass_grav, classid) * 800.0), id, "ZOMBIE_ATTRIB4", floatround(Float:ArrayGetCell(g_zclass_kb, classid) * 100.0))
			return PLUGIN_HANDLED
		}
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L: %d %L: %d %L: %d %L: %d%%", ZP_PREFIX, id, "ZOMBIE_ATTRIB1", ArrayGetCell(g_zclass_hp, classid), id, "ZOMBIE_ATTRIB2", ArrayGetCell(g_zclass_spd, classid),
		id, "ZOMBIE_ATTRIB3", floatround(Float:ArrayGetCell(g_zclass_grav, classid) * 800.0), id, "ZOMBIE_ATTRIB4", floatround(Float:ArrayGetCell(g_zclass_kb, classid) * 100.0))
	} else if(!g_zombie[id]) {
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L:^x04 %s", ZP_PREFIX, id, "ZOMBIE_SELECT", name)
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L: %d %L: %d %L: %d %L: %d%%", ZP_PREFIX, id, "ZOMBIE_ATTRIB1", ArrayGetCell(g_zclass_hp, classid), id, "ZOMBIE_ATTRIB2", ArrayGetCell(g_zclass_spd, classid),
		id, "ZOMBIE_ATTRIB3", floatround(Float:ArrayGetCell(g_zclass_grav, classid) * 800.0), id, "ZOMBIE_ATTRIB4", floatround(Float:ArrayGetCell(g_zclass_kb, classid) * 100.0))
	} else if(zombieclassprev == ZCLASS_NONE && g_gametime_infect[id] >= g_gametime - 7) {
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L:^x04 %s", ZP_PREFIX, id, "ZOMBIE_SELECTED", name)
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L: %d %L: %d %L: %d %L: %d%%", ZP_PREFIX, id, "ZOMBIE_ATTRIB1", ArrayGetCell(g_zclass_hp, g_zombieclassnext[id]), id, "ZOMBIE_ATTRIB2", ArrayGetCell(g_zclass_spd, g_zombieclassnext[id]),
		id, "ZOMBIE_ATTRIB3", floatround(Float:ArrayGetCell(g_zclass_grav, g_zombieclassnext[id]) * 800.0), id, "ZOMBIE_ATTRIB4", floatround(Float:ArrayGetCell(g_zclass_kb, g_zombieclassnext[id]) * 100.0))
		g_zombieclass[id] = classid
		g_zombie_spd[id] = float(ArrayGetCell(g_zclass_spd, classid))
		g_zombie_knockback[id] = Float:ArrayGetCell(g_zclass_kb, classid)
		ArrayGetString(g_zclass_name, classid, g_zombie_classname[id], charsmax(g_zombie_classname[]))
		if(fnGetZombies() == 1) fm_set_user_health(id, floatround(float(ArrayGetCell(g_zclass_hp, classid)) * get_pcvar_float(cvar_zombiefirsthp)))
		else fm_set_user_health(id, ArrayGetCell(g_zclass_hp, classid))
		if (!g_frozen[id]) set_pev(id, pev_gravity, Float:ArrayGetCell(g_zclass_grav, classid))
		else g_frozen_gravity[id] = Float:ArrayGetCell(g_zclass_grav, classid)
		ExecuteHamB(Ham_Player_ResetMaxSpeed, id)
	} else if(zombieclassprev != classid) {
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L:^x04 %s", ZP_PREFIX, id, "ZOMBIE_SELECT", name)
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L: %d %L: %d %L: %d %L: %d%%", ZP_PREFIX, id, "ZOMBIE_ATTRIB1", ArrayGetCell(g_zclass_hp, classid), id, "ZOMBIE_ATTRIB2", ArrayGetCell(g_zclass_spd, classid),
		id, "ZOMBIE_ATTRIB3", floatround(Float:ArrayGetCell(g_zclass_grav, classid) * 800.0), id, "ZOMBIE_ATTRIB4", floatround(Float:ArrayGetCell(g_zclass_kb, classid) * 100.0))
	}
	else client_print_color(id, print_team_default, "^x04[%s]^x01 %L:^x04 %s", ZP_PREFIX, id, "ZOMBIE_ALREADY", name)
		
	menu_destroy(menuid)
	return PLUGIN_HANDLED;
}

// Admin Menu
public menu_admin(id, key)
{
	// Player disconnected?
	if (!g_isconnected[id])
		return PLUGIN_HANDLED;
	
	static userflags
	userflags = get_user_flags(id)
	
	switch (key)
	{
		case ACTION_ZOMBIEFY_HUMANIZE: // Zombiefy/Humanize command
		{
			if (userflags & (g_access_flag[ACCESS_MODE_INFECTION] | g_access_flag[ACCESS_MAKE_ZOMBIE] | g_access_flag[ACCESS_MAKE_HUMAN]))
			{
				// Show player list for admin to pick a target
				PL_ACTION = ACTION_ZOMBIEFY_HUMANIZE
				show_menu_player_list(id)
			}
			else
			{
				client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT_ACCESS")
				show_menu_admin(id)
			}
		}
		case ACTION_RESPAWN_PLAYER: // Respawn command
		{
			if (userflags & g_access_flag[ACCESS_RESPAWN_PLAYERS])
			{
				// Show player list for admin to pick a target
				PL_ACTION = ACTION_RESPAWN_PLAYER
				show_menu_player_list(id)
			}
			else
			{
				client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT_ACCESS")
				show_menu_admin(id)
			}
		}
		case ACTION_MODE_MULTI: // Multiple Infection command
		{
			if (userflags & g_access_flag[ACCESS_MODE_MULTI])
			{
				if (allowed_multi())
					command_multi(id)
				else
					client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
			}
			else
				client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT_ACCESS")
			
			show_menu_admin(id)
		}
	}
	
	return PLUGIN_HANDLED;
}

// Player List Menu
public menu_player_list(id, menuid, item)
{
	// Player disconnected?
	if (!is_user_connected(id))
	{
		menu_destroy(menuid)
		return PLUGIN_HANDLED;
	}
	
	// Remember player's menu page
	static menudummy
	player_menu_info(id, menudummy, menudummy, MENU_PAGE_PLAYERS)
	
	// Menu was closed
	if (item == MENU_EXIT)
	{
		menu_destroy(menuid)
		show_menu_admin(id)
		return PLUGIN_HANDLED;
	}
	
	// Retrieve player id
	static buffer[2], dummy, playerid
	menu_item_getinfo(menuid, item, dummy, buffer, charsmax(buffer), _, _, dummy)
	playerid = buffer[0]
	
	// Perform action on player
	
	// Get admin flags
	static userflags
	userflags = get_user_flags(id)
	
	// Make sure it's still connected
	if (g_isconnected[playerid])
	{
		// Perform the right action if allowed
		switch (PL_ACTION)
		{
			case ACTION_ZOMBIEFY_HUMANIZE: // Zombiefy/Humanize command
			{
				if (g_zombie[playerid])
				{
					if (userflags & g_access_flag[ACCESS_MAKE_HUMAN])
					{
						if (allowed_human(playerid))
							command_human(id, playerid)
						else
							client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
					}
					else
						client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT_ACCESS")
				}
				else
				{
					if (g_newround ? (userflags & g_access_flag[ACCESS_MODE_INFECTION]) : (userflags & g_access_flag[ACCESS_MAKE_ZOMBIE]))
					{
						if (allowed_zombie(playerid))
							command_zombie(id, playerid)
						else
							client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
					}
					else
						client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT_ACCESS")
				}
			}
			case ACTION_RESPAWN_PLAYER: // Respawn command
			{
				if (userflags & g_access_flag[ACCESS_RESPAWN_PLAYERS])
				{
					if (allowed_respawn(playerid))
						command_respawn(id, playerid)
					else
						client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
				}
				else
					client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT_ACCESS")
			}
		}
	}
	else
		client_print_color(id, print_team_default, "^x04[%s]^x01 %L", ZP_PREFIX, id, "CMD_NOT")
	
	menu_destroy(menuid)
	show_menu_player_list(id)
	return PLUGIN_HANDLED;
}

// CS Buy Menus
public menu_cs_buy(id, key)
{
	// Prevent buying if zombie (bugfix)
	if (g_zombie[id])
		return PLUGIN_HANDLED;
	
	return PLUGIN_CONTINUE;
}

/*================================================================================
 [Admin Commands]
=================================================================================*/

// zp_zombie [target]
public cmd_zombie(id, level, cid)
{
	// Check for access flag depending on the resulting action
	if (g_newround)
	{
		// Start Mode Infection
		if (!cmd_access(id, g_access_flag[ACCESS_MODE_INFECTION], cid, 2))
			return PLUGIN_HANDLED;
	}
	else
	{
		// Make Zombie
		if (!cmd_access(id, g_access_flag[ACCESS_MAKE_ZOMBIE], cid, 2))
			return PLUGIN_HANDLED;
	}
	
	// Retrieve arguments
	static arg[32], player
	read_argv(1, arg, charsmax(arg))
	player = cmd_target(id, arg, (CMDTARGET_ONLY_ALIVE | CMDTARGET_ALLOW_SELF))
	
	// Invalid target
	if (!player) return PLUGIN_HANDLED;
	
	// Target not allowed to be zombie
	if (!allowed_zombie(player))
	{
		client_print(id, print_console, "[%s] %L", ZP_PREFIX, id, "CMD_NOT")
		return PLUGIN_HANDLED
	}
	
	command_zombie(id, player)
	
	return PLUGIN_HANDLED;
}

// zp_give_ammo [target] [amount]
public cmd_give_ammo(id) {
	if(~get_user_flags(id) & ADMIN_RCON) {
		client_print(id, print_console, "[%s] %L", ZP_PREFIX, id, "CMD_NOT_ACCESS")
		return PLUGIN_HANDLED
	}
	new target[32], count[11], num
	read_argv(1,target,31)
	read_argv(2,count,6)
	num = str_to_num(count)
	if(num < 0)
		return PLUGIN_HANDLED
	
	if(equal(target, "@ALL")) {
		for(new i=1;i<=g_maxplayers;i++) {
			if(!g_isconnected[i]) continue
			new ammobefore = g_ammopacks[i]
			set_ammo(i, g_ammopacks[i] + num)
			new ammonow = g_ammopacks[i] - ammobefore
			if(ammonow > 0) client_print_color(i, print_team_default, "^x04[%s]^x01 %L %d %L", ZP_PREFIX, i, "GAVE_AMMO", ammonow, i, "AMMO_PACKS2")
		}
		return PLUGIN_HANDLED
	}
	new player = cmd_target(id, target, CMDTARGET_ALLOW_SELF)
	if(!player) {
		client_print(id, print_console, "[%s] %L", ZP_PREFIX, id, "CMD_NOT")
		return PLUGIN_HANDLED
	}
	new ammobefore = g_ammopacks[player]
	set_ammo(player, g_ammopacks[player] + num)
	new ammonow = g_ammopacks[player] - ammobefore
	if(ammonow > 0) client_print_color(player, print_team_default, "^x04[%s]^x01 %L %d %L", ZP_PREFIX, player, "GAVE_AMMO", ammonow, player, "AMMO_PACKS2")
	return PLUGIN_HANDLED
}

// zp_give_souls [target] [amount]
public cmd_give_souls(id) {
	if(~get_user_flags(id) & ADMIN_RCON) {
		client_print(id, print_console, "[%s] %L", ZP_PREFIX, id, "CMD_NOT_ACCESS")
		return PLUGIN_HANDLED
	}
	new target[32], count[11], num
	read_argv(1,target,31)
	read_argv(2,count,6)
	num = str_to_num(count)
	if(num < 0)
		return PLUGIN_HANDLED
	
	if(equal(target, "@ALL")) {
		for(new i=1;i<=g_maxplayers;i++) {
			if(!g_isconnected[i]) continue
			new ammobefore = g_souls[i]
			set_souls(i, g_souls[i] + num)
			new ammonow = g_souls[i] - ammobefore
			if(ammonow > 0) client_print_color(i, print_team_default, "^x04[%s]^x01 %L %d %L", ZP_PREFIX, i, "GAVE_AMMO", ammonow, i, "SOULS1")
		}
		return PLUGIN_HANDLED
	}
	new player = cmd_target(id, target, CMDTARGET_ALLOW_SELF)
	if(!player) {
		client_print(id, print_console, "[%s] %L", ZP_PREFIX, id, "CMD_NOT")
		return PLUGIN_HANDLED
	}
	new ammobefore = g_souls[player]
	set_souls(player, g_souls[player] + num)
	new ammonow = g_souls[player] - ammobefore
	if(ammonow > 0) client_print_color(player, print_team_default, "^x04[%s]^x01 %L %d %L", ZP_PREFIX, player, "GAVE_AMMO", ammonow, player, "SOULS1")
	return PLUGIN_HANDLED
}

// zp_human [target]
public cmd_human(id, level, cid)
{
	// Check for access flag - Make Human
	if (!cmd_access(id, g_access_flag[ACCESS_MAKE_HUMAN], cid, 2))
		return PLUGIN_HANDLED;
	
	// Retrieve arguments
	static arg[32], player
	read_argv(1, arg, charsmax(arg))
	player = cmd_target(id, arg, (CMDTARGET_ONLY_ALIVE | CMDTARGET_ALLOW_SELF))
	
	// Invalid target
	if (!player) return PLUGIN_HANDLED;
	
	// Target not allowed to be human
	if (!allowed_human(player))
	{
		client_print(id, print_console, "[%s] %L", ZP_PREFIX, id, "CMD_NOT")
		return PLUGIN_HANDLED;
	}
	
	command_human(id, player)
	
	return PLUGIN_HANDLED;
}


// zp_respawn [target]
public cmd_respawn(id, level, cid)
{
	// Check for access flag - Respawn
	if (!cmd_access(id, g_access_flag[ACCESS_RESPAWN_PLAYERS], cid, 2))
		return PLUGIN_HANDLED;
	
	// Retrieve arguments
	static arg[32], player
	read_argv(1, arg, charsmax(arg))
	player = cmd_target(id, arg, CMDTARGET_ALLOW_SELF)
	
	// Invalid target
	if (!player) return PLUGIN_HANDLED;
	
	// Target not allowed to be respawned
	if (!allowed_respawn(player))
	{
		client_print(id, print_console, "[%s] %L", ZP_PREFIX, id, "CMD_NOT")
		return PLUGIN_HANDLED;
	}
	
	command_respawn(id, player)
	
	return PLUGIN_HANDLED;
}

// zp_multi
public cmd_multi(id, level, cid)
{
	// Check for access flag - Mode Multi
	if (!cmd_access(id, g_access_flag[ACCESS_MODE_MULTI], cid, 1))
		return PLUGIN_HANDLED;
	
	// Multi infection mode not allowed
	if (!allowed_multi())
	{
		client_print(id, print_console, "[%s] %L", ZP_PREFIX, id, "CMD_NOT")
		return PLUGIN_HANDLED;
	}
	
	command_multi(id)
	
	return PLUGIN_HANDLED;
}

/*================================================================================
 [Message Hooks]
=================================================================================*/

// Current Weapon info
public message_cur_weapon(msg_id, msg_dest, msg_entity)
{
	// Not alive or zombie
	if (!g_isalive[msg_entity] || g_zombie[msg_entity])
		return;
	
	// Not an active weapon
	if (get_msg_arg_int(1) != 1)
		return;
	
	// Unlimited clip disabled for class
	if ((get_pcvar_num(cvar_infammo) <= 1 && (~get_user_flags(msg_entity) & g_access_flag[ACCESS_VIP] || get_pcvar_num(cvar_vipinfammo) <= 1)))
		return;
	
	// Get weapon's id
	static weapon
	weapon = get_msg_arg_int(2)
	
	// Unlimited Clip Ammo for this weapon?
	if (MAXBPAMMO[weapon] > 2)
	{
		// Max out clip ammo
		static weapon_ent
		weapon_ent = fm_cs_get_current_weapon_ent(msg_entity)
		if (pev_valid(weapon_ent)) cs_set_weapon_ammo(weapon_ent, MAXCLIP[weapon])
		
		// HUD should show full clip all the time
		set_msg_arg_int(3, get_msg_argtype(3), MAXCLIP[weapon])
	}
}

// Take off player's money
public message_money(msg_id, msg_dest, msg_entity)
{
	// Remove money setting enabled?
	if (!get_pcvar_num(cvar_removemoney))
		return PLUGIN_CONTINUE;
	
	fm_cs_set_user_money(msg_entity, 0)
	return PLUGIN_HANDLED;
}

// Fix for the HL engine bug when HP is multiples of 256
public message_health(msg_id, msg_dest, msg_entity)
{	
	// Get player's health
	static health; health = get_user_health(msg_entity);
	if(g_zombie[msg_entity]) {
		if(g_modestarted) health = 100*health/ArrayGetCell(g_zclass_hp, g_zombieclass[msg_entity]);
		else if(health == ArrayGetCell(g_zclass_hp, g_zombieclass[msg_entity])) health = 100;
		else if(health == ArrayGetCell(g_zclass_hp, g_zombieclass[msg_entity])*2) health = 200;
	}
	if(health > 200) health = 200;
	if(health % 256 == 0) health++;
	set_msg_arg_int(1, get_msg_argtype(1), health);
}

// Block flashlight battery messages if custom flashlight is enabled instead
public message_flashbat()
{
	if (g_cached_customflash)
		return PLUGIN_HANDLED;
	
	return PLUGIN_CONTINUE;
}

// Flashbangs should not affect anyone
public message_screenfade(msg_id, msg_dest, msg_entity)
{
	if(!is_user_alive(msg_entity))
		return PLUGIN_CONTINUE
	
	if (get_msg_arg_int(4) == 100 || get_msg_arg_int(5) == 0 || get_msg_arg_int(6) == 0 || get_msg_arg_int(7) == 120) {
		SetLight(msg_entity, "1")
		return PLUGIN_CONTINUE
	}
	else if (get_msg_arg_int(4) == 0 || get_msg_arg_int(5) == 100 || get_msg_arg_int(6) == 0 || get_msg_arg_int(7) == 120) {
		SetLight(msg_entity, "1")
		return PLUGIN_CONTINUE
	}
	else if (get_msg_arg_int(4) != 255 || get_msg_arg_int(5) != 255 || get_msg_arg_int(6) != 255 || get_msg_arg_int(7) < 200)
		return PLUGIN_CONTINUE;
	
	return PLUGIN_HANDLED;
}

// Prevent spectators' nightvision from being turned off when switching targets, etc.
public message_nvgtoggle()
{
	return PLUGIN_HANDLED;
}

// Set correct model on player corpses
public message_clcorpse()
{
	set_msg_arg_string(1, g_playermodel[get_msg_arg_int(12)])
}

// Prevent zombies from seeing any weapon pickup icon
public message_weappickup(msg_id, msg_dest, msg_entity)
{
	if (g_zombie[msg_entity])
		return PLUGIN_HANDLED;
	
	return PLUGIN_CONTINUE;
}

// Prevent zombies from seeing any ammo pickup icon
public message_ammopickup(msg_id, msg_dest, msg_entity)
{
	if (g_zombie[msg_entity])
		return PLUGIN_HANDLED;
	
	return PLUGIN_CONTINUE;
}

// Block hostage HUD display
public message_scenario()
{
	if (get_msg_args() > 1)
	{
		static sprite[8]
		get_msg_arg_string(2, sprite, charsmax(sprite))
		
		if (equal(sprite, "hostage"))
			return PLUGIN_HANDLED;
	}
	
	return PLUGIN_CONTINUE;
}

// Block hostages from appearing on radar
public message_hostagepos()
{
	return PLUGIN_HANDLED;
}

// Block some text messages
public message_textmsg()
{
	static textmsg[22]
	get_msg_arg_string(2, textmsg, charsmax(textmsg))
	
	// Game restarting, reset scores and call round end to balance the teams
	if (equal(textmsg, "#Game_will_restart_in"))
	{
		logevent_round_end()
		g_scorehumans = 0
		g_scorezombies = 0
	}
	// Game commencing, reset scores only (round end is automatically triggered)
	else if (equal(textmsg, "#Game_Commencing"))
	{
		g_gamecommencing = true
		g_scorehumans = 0
		g_scorezombies = 0
	}
	// Block round end related messages
	else if (equal(textmsg, "#Hostages_Not_Rescued") || equal(textmsg, "#Round_Draw") || equal(textmsg, "#Terrorists_Win") || equal(textmsg, "#CTs_Win"))
	{
		return PLUGIN_HANDLED;
	}
	
	return PLUGIN_CONTINUE;
}

// Block CS round win audio messages, since we're playing our own instead
public message_sendaudio()
{
	static audio[17]
	get_msg_arg_string(2, audio, charsmax(audio))
	
	if(equal(audio[7], "terwin") || equal(audio[7], "ctwin") || equal(audio[7], "rounddraw"))
		return PLUGIN_HANDLED;
	
	return PLUGIN_CONTINUE;
}

// Send actual team scores (T = zombies // CT = humans)
public message_teamscore()
{
	static team[2]
	get_msg_arg_string(1, team, charsmax(team))
	
	switch (team[0])
	{
		// CT
		case 'C': set_msg_arg_int(2, get_msg_argtype(2), g_scorehumans)
		// Terrorist
		case 'T': set_msg_arg_int(2, get_msg_argtype(2), g_scorezombies)
	}
}

// Team Switch (or player joining a team for first time)
public message_teaminfo(msg_id, msg_dest)
{
	// Only hook global messages
	if (msg_dest != MSG_ALL && msg_dest != MSG_BROADCAST) return;
	
	// Don't pick up our own TeamInfo messages for this player (bugfix)
	if (g_switchingteam) return;
	
	// Get player's id
	static id
	id = get_msg_arg_int(1)
	
	// Invalid player id? (bugfix)
	if (!(1 <= id <= g_maxplayers)) return;
	
	// Enable spectators' nightvision if not spawning right away
	set_task(0.2, "spec_nvision", id)
	
	// Round didn't start yet, nothing to worry about
	if (g_newround) return;
	
	// Get his new team
	static team[2]
	get_msg_arg_string(2, team, charsmax(team))
	
	// Perform some checks to see if they should join a different team instead
	switch (team[0])
	{
		case 'C': // CT
		{
			if (!fnGetZombies()) // no zombies alive --> switch to T and spawn as zombie
			{
				g_respawn_as_zombie[id] = true;
				remove_task(id+TASK_TEAM)
				fm_cs_set_user_team(id, FM_CS_TEAM_T)
				set_msg_arg_string(2, "TERRORIST")
			}
		}
		case 'T': // Terrorist
		{
			if (fnGetZombies()) // zombies alive --> switch to CT
			{
				remove_task(id+TASK_TEAM)
				fm_cs_set_user_team(id, FM_CS_TEAM_CT)
				set_msg_arg_string(2, "CT")
			}
		}
	}
}

/*================================================================================
 [Main Functions]
=================================================================================*/

// Make Zombie Task
public make_zombie_task()
{
	if(g_gamemode_i > 0 && fnGetAlive() >= get_pcvar_num(cvar_gamemode_minpl) && random_num(1, 100) <= get_pcvar_num(cvar_gamemode_chance)) {
		// Call make a zombie with a specific mode
		make_a_zombie(MODE_CUSTOM+random_num(0, g_gamemode_i-1), 0)
		return
	}
	// Call make a zombie with no specific mode
	make_a_zombie(MODE_NONE, 0)
}

// Make a Zombie Function
make_a_zombie(mode, id)
{
	// Get alive players count
	static iPlayersnum
	iPlayersnum = fnGetAlive()
	
	// Not enough players, come back later!
	if (iPlayersnum < 1)
	{
		set_task(2.0, "make_zombie_task", TASK_MAKEZOMBIE)
		return;
	}
	
	// Round started!
	g_newround = false
	
	// Set up some common vars
	static forward_id, iZombies, iMaxZombies
	
	if(mode >= MODE_CUSTOM)
	{
		// We are running custom gamemode
		g_currentmode = mode
		
		// Show it's name
		new gamemode_name[32]
		ArrayGetString(g_gamemode_name, mode-MODE_CUSTOM, gamemode_name, charsmax(gamemode_name))
		client_print(id, print_center, ">> %s <<", gamemode_name)
		
		// Set gamemode lighting
		new gamemode_light[2]
		ArrayGetString(g_gamemode_lighting, mode-MODE_CUSTOM, gamemode_light, charsmax(gamemode_light))
		SetLight(0, gamemode_light)
		
		// Round start forward
		ExecuteForward(g_fwRoundStart, g_fwDummyResult, mode, 0)
		
		// Mode fully started
		g_modestarted = true
		g_seconds = 0
	}
	else if ((mode == MODE_NONE && floatround(iPlayersnum*get_pcvar_float(cvar_multiratio), floatround_ceil) >= 2 && floatround(iPlayersnum*get_pcvar_float(cvar_multiratio), floatround_ceil) < iPlayersnum && iPlayersnum >= get_pcvar_num(cvar_multiminplayers)) || mode == MODE_MULTI)
	{
		// We are running multi mode
		g_currentmode = MODE_MULTI
		
		// iMaxZombies is rounded up, in case there aren't enough players
		iMaxZombies = floatround(iPlayersnum*get_pcvar_float(cvar_multiratio), floatround_ceil)
		iZombies = 0
		
		// Randomly turn iMaxZombies players into zombies
		while (iZombies < iMaxZombies)
		{
			// Keep looping through all players
			if (++id > g_maxplayers) id = 1
			
			// Dead or already a zombie
			if (!g_isalive[id] || g_zombie[id])
				continue;
			
			// Random chance
			if (random_num(0, 1))
			{
				// Turn into a zombie
				zombieme(id, 0, 1, 0, 0, 1)
				iZombies++
			}
		}
		
		// Turn the remaining players into humans
		for (id = 1; id <= g_maxplayers; id++)
		{
			// Only those of them who aren't zombies
			if (!g_isalive[id] || g_zombie[id])
				continue;
			
			// Switch to CT
			if (fm_cs_get_user_team(id) != FM_CS_TEAM_CT) // need to change team?
			{
				remove_task(id+TASK_TEAM)
				fm_cs_set_user_team(id, FM_CS_TEAM_CT)
				fm_user_team_update(id)
			}
		}
		
		// Mode fully started!
		g_modestarted = true
		g_seconds = 0
		
		// Return ammo
		returnammo()
		
		// Round start forward
		ExecuteForward(g_fwRoundStart, g_fwDummyResult, MODE_MULTI, 0);
	}
	else
	{
		// We are running infection mode
		g_currentmode = MODE_INFECTION
		
		// Choose player randomly?
		if (mode == MODE_NONE)
			id = fnGetRandomAlive(random_num(1, iPlayersnum))
		
		// Remember id for calling our forward later
		forward_id = id
		
		// Turn player into the first zombie
		zombieme(id, 0, 0, 0, 0, 1)
		
		// Remaining players should be humans (CTs)
		for (id = 1; id <= g_maxplayers; id++)
		{
			// Not alive
			if (!g_isalive[id])
				continue;
			
			// First zombie
			if (g_zombie[id])
				continue;
			
			// Switch to CT
			if (fm_cs_get_user_team(id) != FM_CS_TEAM_CT) // need to change team?
			{
				remove_task(id+TASK_TEAM)
				fm_cs_set_user_team(id, FM_CS_TEAM_CT)
				fm_user_team_update(id)
			}
		}
		
		// Mode fully started!
		g_modestarted = true
		g_seconds = 0
		
		// Return ammo
		returnammo()
		
		// Round start forward
		ExecuteForward(g_fwRoundStart, g_fwDummyResult, MODE_INFECTION, forward_id);
	}
	
	// Start ambience sounds after a mode begins
	if (g_ambience_sounds[AMBIENCE_SOUNDS_INFECTION])
	{
		remove_task(TASK_AMBIENCESOUNDS)
		set_task(2.0, "ambience_sound_effects", TASK_AMBIENCESOUNDS)
	}
}

public returnammo() {
	for(new i = 1; i <= g_maxplayers; i++) {
		if(!g_isconnected[i]) continue
		
		if(g_zombie[i] && get_pcvar_num(cvar_retammo)) { 
			if(g_return_money[i][0] > g_ammopacks[i]) g_ammopacks[i] = g_return_money[i][0]
			if(g_return_money[i][1] > g_souls[i]) g_souls[i] = g_return_money[i][1]
		}
	}
}

// Zombie Me Function (player id, infector, silent mode, deathmsg and rewards)
zombieme(id, infector, silentmode, rewards, allowend = 0, first = 0)
{
	// User infect attempt forward
	ExecuteForward(g_fwUserInfect_attempt, g_fwDummyResult, id, infector)
	
	// One or more plugins blocked the infection. Only allow this after making sure it's
	// not going to leave us with no zombies. Take into account a last player leaving case.
	// BUGFIX: only allow after a mode has started, to prevent blocking first zombie e.g.
	if (g_fwDummyResult >= ZP_PLUGIN_HANDLED && g_modestarted && fnGetZombies() > g_lastplayerleaving)
		return;
	
	// Pre user infect forward
	ExecuteForward(g_fwUserInfected_pre, g_fwDummyResult, id, infector)
	
	// Show zombie class menu if they haven't chosen any (e.g. just connected)
	if (g_zombieclassnext[id] == ZCLASS_NONE && get_pcvar_num(cvar_zclasses)) {
		set_task(0.2, "show_menu_zclass", id)
		g_gametime_infect[id] = g_gametime
	}
	
	// Set selected zombie class
	g_zombieclass[id] = g_zombieclassnext[id]
	// If no class selected yet, use the first (default) one
	if (g_zombieclass[id] == ZCLASS_NONE) g_zombieclass[id] = 0
	
	// Way to go...
	g_zombie[id] = true
	g_instantinfect[id] = false
	g_firstzombie[id] = false
	
	// Remove survivor's aura (bugfix)
	set_pev(id, pev_effects, pev(id, pev_effects) &~ EF_BRIGHTLIGHT)
	
	// Remove spawn protection (bugfix)
	g_nodamage[id] = false
	set_pev(id, pev_effects, pev(id, pev_effects) &~ EF_NODRAW)
	
	// Reset burning duration counter (bugfix)
	g_burning_duration[id] = 0
	
	// Show deathmsg and reward infector?
	if (rewards && infector)
	{
		// Send death notice and fix the "dead" attrib on scoreboard
		SendDeathMsg(infector, id)
		FixDeadAttrib(id)
		
		// Reward frags, deaths, health, and ammo packs
		UpdateFrags(infector, id, get_pcvar_num(cvar_fragsinfect), 1, 1)
		set_ammo(infector, g_ammopacks[infector] + get_pcvar_num(cvar_ammoinfect))
		fm_set_user_health(infector, pev(infector, pev_health) + get_pcvar_num(cvar_zombiebonushp))
	}
	
	// Cache speed, knockback, and name for player's class
	g_zombie_spd[id] = float(ArrayGetCell(g_zclass_spd, g_zombieclass[id]))
	g_zombie_knockback[id] = Float:ArrayGetCell(g_zclass_kb, g_zombieclass[id])
	ArrayGetString(g_zclass_name, g_zombieclass[id], g_zombie_classname[id], charsmax(g_zombie_classname[]))
	
	// Set zombie attributes based on the mode
	static sound[64]
	if (!silentmode)
	{
		// First zombie
		if (fnGetZombies() == 1 || first)
			g_firstzombie[id] = true
		
		// Infected by someone
		if(g_firstzombie[id]) fm_set_user_health(id, floatround(float(ArrayGetCell(g_zclass_hp, g_zombieclass[id])) * get_pcvar_float(cvar_zombiefirsthp)))
		else fm_set_user_health(id, ArrayGetCell(g_zclass_hp, g_zombieclass[id]))
		
		// Set gravity, if frozen set the restore gravity value instead
		if (!g_frozen[id]) set_pev(id, pev_gravity, Float:ArrayGetCell(g_zclass_grav, g_zombieclass[id]))
		else g_frozen_gravity[id] = Float:ArrayGetCell(g_zclass_grav, g_zombieclass[id])
		
		// Set zombie maxspeed
		ExecuteHamB(Ham_Player_ResetMaxSpeed, id)
		
		// Infection sound
		ArrayGetString(zombie_infect, random_num(0, ArraySize(zombie_infect) - 1), sound, charsmax(sound))
		emit_sound(id, CHAN_VOICE, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
	}
	else
	{
		// Silent mode, no HUD messages, no infection sounds
		
		// Set health
		fm_set_user_health(id, ArrayGetCell(g_zclass_hp, g_zombieclass[id]))
		
		// Set gravity, if frozen set the restore gravity value instead
		if (!g_frozen[id]) set_pev(id, pev_gravity, Float:ArrayGetCell(g_zclass_grav, g_zombieclass[id]))
		else g_frozen_gravity[id] = Float:ArrayGetCell(g_zclass_grav, g_zombieclass[id])
		
		// Set zombie maxspeed
		ExecuteHamB(Ham_Player_ResetMaxSpeed, id)
	}
	
	// Remove previous tasks
	remove_task(id+TASK_MODEL)
	remove_task(id+TASK_BLOOD)
	remove_task(id+TASK_AURA)
	remove_task(id+TASK_BURN)
	
	// Switch to T
	if (fm_cs_get_user_team(id) != FM_CS_TEAM_T) // need to change team?
	{
		remove_task(id+TASK_TEAM)
		fm_cs_set_user_team(id, FM_CS_TEAM_T)
		fm_user_team_update(id)
	}
	
	// Custom models stuff
	static currentmodel[32], tempmodel[32], already_has_model, i, iRand, size
	already_has_model = false
	
	if (g_handle_models_on_separate_ent)
	{
		// Set the right model
		if (get_pcvar_num(cvar_adminmodelszombie) && (get_user_flags(id) & g_access_flag[ACCESS_ADMIN_MODELS]))
		{
			iRand = random_num(0, ArraySize(model_admin_zombie) - 1)
			ArrayGetString(model_admin_zombie, iRand, g_playermodel[id], charsmax(g_playermodel[]))
			if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_modelindex_admin_zombie, iRand))
		}
		else
		{
			iRand = random_num(ArrayGetCell(g_zclass_modelsstart, g_zombieclass[id]), ArrayGetCell(g_zclass_modelsend, g_zombieclass[id]) - 1)
			ArrayGetString(g_zclass_playermodel, iRand, g_playermodel[id], charsmax(g_playermodel[]))
			if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_zclass_modelindex, iRand))
		}
		
		// Set model on player model entity
		fm_set_playermodel_ent(id)
		
		// Remove glow on player model entity, unless frozen
		if (!g_frozen[id])
		{
			fm_set_rendering(g_ent_playermodel[id])
		}
	}
	else
	{
		// Get current model for comparing it with the current one
		fm_cs_get_user_model(id, currentmodel, charsmax(currentmodel))
		
		// Set the right model, after checking that we don't already have it
		if (get_pcvar_num(cvar_adminmodelszombie) && (get_user_flags(id) & g_access_flag[ACCESS_ADMIN_MODELS]))
		{
			size = ArraySize(model_admin_zombie)
			for (i = 0; i < size; i++)
			{
				ArrayGetString(model_admin_zombie, i, tempmodel, charsmax(tempmodel))
				if (equal(currentmodel, tempmodel)) already_has_model = true
			}
			
			if (!already_has_model)
			{
				iRand = random_num(0, size - 1)
				ArrayGetString(model_admin_zombie, iRand, g_playermodel[id], charsmax(g_playermodel[]))
				if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_modelindex_admin_zombie, iRand))
			}
		}
		else
		{
			for (i = ArrayGetCell(g_zclass_modelsstart, g_zombieclass[id]); i < ArrayGetCell(g_zclass_modelsend, g_zombieclass[id]); i++)
			{
				ArrayGetString(g_zclass_playermodel, i, tempmodel, charsmax(tempmodel))
				if (equal(currentmodel, tempmodel)) already_has_model = true
			}
			
			if (!already_has_model)
			{
				iRand = random_num(ArrayGetCell(g_zclass_modelsstart, g_zombieclass[id]), ArrayGetCell(g_zclass_modelsend, g_zombieclass[id]) - 1)
				ArrayGetString(g_zclass_playermodel, iRand, g_playermodel[id], charsmax(g_playermodel[]))
				if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_zclass_modelindex, iRand))
			}
		}
		
		// Need to change the model?
		if (!already_has_model)
		{
			// An additional delay is offset at round start
			// since SVC_BAD is more likely to be triggered there
			if (g_newround)
				set_task(5.0 * g_modelchange_delay, "fm_user_model_update", id+TASK_MODEL)
			else
				fm_user_model_update(id+TASK_MODEL)
		}
		
		// Remove glow, unless frozen
		if (!g_frozen[id])
		{
			fm_set_rendering(id)
		}
	}
	
	// Remove any zoom (bugfix)
	cs_set_user_zoom(id, CS_RESET_ZOOM, 1)
	
	// Remove armor
	cs_set_user_armor(id, 0, CS_ARMOR_NONE)
	
	// Drop weapons when infected
	drop_weapons(id, 1)
	drop_weapons(id, 2)
	
	// Strip zombies from guns and give them a knife
	fm_strip_user_weapons(id)
	fm_give_item(id, "weapon_knife")
	
	// Fancy effects
	infection_effects(id)
	
	// Remove CS nightvision if player owns one (bugfix)
	if (cs_get_user_nvg(id))
	{
		cs_set_user_nvg(id, 0)
		// Fix NVG
		message_begin(MSG_ONE, g_msgScreenFade, _, id)
		write_short(0)
		write_short(0)
		write_short(0x0000)
		write_byte(100)
		write_byte(100)
		write_byte(100)
		write_byte(255)
		message_end()
	}
	
	// Give Zombies Night Vision?
	if (get_pcvar_num(cvar_nvggive))
	{
		g_nvision[id] = true
		
		if (!g_isbot[id])
		{
			// Turn on Night Vision automatically?
			if (get_pcvar_num(cvar_nvggive) == 1)
			{
				g_nvisionenabled[id] = true
				set_task(0.1, "Nvg", id)
			}
			// Turn off nightvision when infected (bugfix)
			else if (g_nvisionenabled[id]) g_nvisionenabled[id] = false
		}
		else
			cs_set_user_nvg(id, 1); // turn on NVG for bots
	}
	// Disable nightvision when infected (bugfix)
	else if (g_nvision[id])
	{
		g_nvision[id] = false
		g_nvisionenabled[id] = false
	}
	
	// Set custom FOV?
	if (get_pcvar_num(cvar_zombiefov) != 90 && get_pcvar_num(cvar_zombiefov) != 0)
	{
		message_begin(MSG_ONE, g_msgSetFOV, _, id)
		write_byte(get_pcvar_num(cvar_zombiefov)) // fov angle
		message_end()
	}
	
	// Call the bloody task
	if (get_pcvar_num(cvar_zombiebleeding))
		set_task(0.7, "make_blood", id+TASK_BLOOD, _, _, "b")
	
	// Idle sounds task
	set_task(random_float(50.0, 70.0), "zombie_play_idle", id+TASK_BLOOD, _, _, "b")
	
	// Turn off zombie's flashlight
	turn_off_flashlight(id)
	
	// Post user infect forward
	ExecuteForward(g_fwUserInfected_post, g_fwDummyResult, id, infector)
	
	// Last Zombie Check
	fnCheckLastZombie()
	
	// Finish round if no humans left
	if(fnGetHumans() == 0 && allowend)
	{
		rg_round_end(5.0, WINSTATUS_TERRORISTS, ROUND_TERRORISTS_WIN, "default", "default", true);
	}
	else if(infector > 0)
	{
		set_task(1.0, "respawn_dm5_task", TASK_SPAWN)
	}
}

// Function Human Me (player id, silent mode)
humanme(id, silentmode)
{
	// User humanize attempt forward
	ExecuteForward(g_fwUserHumanize_attempt, g_fwDummyResult, id)
	
	// One or more plugins blocked the "humanization". Only allow this after making sure it's
	// not going to leave us with no humans. Take into account a last player leaving case.
	// BUGFIX: only allow after a mode has started, to prevent blocking first survivor e.g.
	if (g_fwDummyResult >= ZP_PLUGIN_HANDLED && g_modestarted && fnGetHumans() > g_lastplayerleaving)
		return;
	
	// Pre user humanize forward
	ExecuteForward(g_fwUserHumanized_pre, g_fwDummyResult, id)
	
	// Remove previous tasks
	remove_task(id+TASK_MODEL)
	remove_task(id+TASK_BLOOD)
	remove_task(id+TASK_AURA)
	remove_task(id+TASK_BURN)
	
	// Reset some vars
	g_zombie[id] = false
	g_firstzombie[id] = false
	g_canbuy[id] = true
	g_buytime[id] = g_gametime
	
	// NVG bugfix
	SetLight(id,"c")
	
	// Remove survivor's aura (bugfix)
	set_pev(id, pev_effects, pev(id, pev_effects) &~ EF_BRIGHTLIGHT)
	
	// Remove spawn protection (bugfix)
	g_nodamage[id] = false
	set_pev(id, pev_effects, pev(id, pev_effects) &~ EF_NODRAW)
	
	// Reset burning duration counter (bugfix)
	g_burning_duration[id] = 0
	
	// Remove CS nightvision if player owns one (bugfix)
	if (cs_get_user_nvg(id))
	{
		cs_set_user_nvg(id, 0)
		// Fix NVG
		message_begin(MSG_ONE, g_msgScreenFade, _, id)
		write_short(0)
		write_short(0)
		write_short(0x0000)
		write_byte(100)
		write_byte(100)
		write_byte(100)
		write_byte(255)
		message_end()
	}
	
	// Drop previous weapons
	drop_weapons(id, 1)
	drop_weapons(id, 2)
	
	// Strip off from weapons
	fm_strip_user_weapons(id)
	fm_give_item(id, "weapon_knife")
	
	// Fix weaponkey
	static ent; ent = get_weapon_index(id, "weapon_knife")
	if(ent > 0) set_pev(ent, pev_impulse, g_knife_weaponkey[id])
	
	// Set human attributes based on the mode
	// Human taking an antidote
	
	// Set health
	fm_set_user_health(id, get_pcvar_num(cvar_humanhp))
	
	// Set gravity, if frozen set the restore gravity value instead
	if(get_user_flags(id) & g_access_flag[ACCESS_VIP]) {
		if (!g_frozen[id]) set_pev(id, pev_gravity, get_pcvar_float(cvar_humangravity_vip))
		else g_frozen_gravity[id] = get_pcvar_float(cvar_humangravity_vip)
	} else {
		if (!g_frozen[id]) set_pev(id, pev_gravity, get_pcvar_float(cvar_humangravity))
		else g_frozen_gravity[id] = get_pcvar_float(cvar_humangravity)
	}
	
	// Set human maxspeed
	ExecuteHamB(Ham_Player_ResetMaxSpeed, id)
	
	// Show custom buy menu?
	if (get_pcvar_num(cvar_buycustom))
		set_task(0.2, "show_menu_buy1", id+TASK_SPAWN)
	
	// Silent mode = no HUD messages, no antidote sound
	if (!silentmode)
	{
		// Antidote sound
		static sound[64]
		ArrayGetString(sound_antidote, random_num(0, ArraySize(sound_antidote) - 1), sound, charsmax(sound))
		emit_sound(id, CHAN_ITEM, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
	}
	
	// Switch to CT
	if (fm_cs_get_user_team(id) != FM_CS_TEAM_CT) // need to change team?
	{
		remove_task(id+TASK_TEAM)
		fm_cs_set_user_team(id, FM_CS_TEAM_CT)
		fm_user_team_update(id)
	}
	
	// Custom models stuff
	static currentmodel[32], tempmodel[32], already_has_model, i, iRand, size
	already_has_model = false
	
	if (g_handle_models_on_separate_ent)
	{
		// Set the right model
		if (get_pcvar_num(cvar_adminmodelshuman) && (get_user_flags(id) & g_access_flag[ACCESS_ADMIN_MODELS]))
		{
			iRand = random_num(0, ArraySize(model_admin_human) - 1)
			ArrayGetString(model_admin_human, iRand, g_playermodel[id], charsmax(g_playermodel[]))
			if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_modelindex_admin_human, iRand))
		}
		else
		{
			iRand = random_num(0, ArraySize(model_human) - 1)
			ArrayGetString(model_human, iRand, g_playermodel[id], charsmax(g_playermodel[]))
			if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_modelindex_human, iRand))
		}
		
		// Set model on player model entity
		fm_set_playermodel_ent(id)
		
		// Remove glow on player model entity, unless frozen
		if (!g_frozen[id])
		{
			fm_set_rendering(g_ent_playermodel[id])
		}
	}
	else
	{
		// Get current model for comparing it with the current one
		fm_cs_get_user_model(id, currentmodel, charsmax(currentmodel))
		
		// Set the right model, after checking that we don't already have it
		if (get_pcvar_num(cvar_adminmodelshuman) && (get_user_flags(id) & g_access_flag[ACCESS_ADMIN_MODELS]))
		{
			size = ArraySize(model_admin_human)
			for (i = 0; i < size; i++)
			{
				ArrayGetString(model_admin_human, i, tempmodel, charsmax(tempmodel))
				if (equal(currentmodel, tempmodel)) already_has_model = true
			}
			
			if (!already_has_model)
			{
				iRand = random_num(0, size - 1)
				ArrayGetString(model_admin_human, iRand, g_playermodel[id], charsmax(g_playermodel[]))
				if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_modelindex_admin_human, iRand))
			}
		}
		else
		{
			size = ArraySize(model_human)
			for (i = 0; i < size; i++)
			{
				ArrayGetString(model_human, i, tempmodel, charsmax(tempmodel))
				if (equal(currentmodel, tempmodel)) already_has_model = true
			}
			
			if (!already_has_model)
			{
				iRand = random_num(0, size - 1)
				ArrayGetString(model_human, iRand, g_playermodel[id], charsmax(g_playermodel[]))
				if (g_set_modelindex_offset) fm_cs_set_user_model_index(id, ArrayGetCell(g_modelindex_human, iRand))
			}
		}
		
		// Need to change the model?
		if (!already_has_model)
		{
			// An additional delay is offset at round start
			// since SVC_BAD is more likely to be triggered there
			if (g_newround)
				set_task(5.0 * g_modelchange_delay, "fm_user_model_update", id+TASK_MODEL)
			else
				fm_user_model_update(id+TASK_MODEL)
		}
		
		// Remove glow, unless frozen
		if (!g_frozen[id])
		{
			fm_set_rendering(id)
		}
	}
	
	// Restore FOV?
	if (get_pcvar_num(cvar_zombiefov) != 90 && get_pcvar_num(cvar_zombiefov) != 0)
	{
		message_begin(MSG_ONE, g_msgSetFOV, _, id)
		write_byte(90) // angle
		message_end()
	}
	
	// Disable nightvision when turning into human (bugfix)
	if (g_nvision[id])
	{
		g_nvision[id] = false
		g_nvisionenabled[id] = false
		// Fix NVG
		message_begin(MSG_ONE, g_msgScreenFade, _, id)
		write_short(0)
		write_short(0)
		write_short(0x0000)
		write_byte(100)
		write_byte(100)
		write_byte(100)
		write_byte(255)
		message_end()
	}
	
	// Post user humanize forward
	ExecuteForward(g_fwUserHumanized_post, g_fwDummyResult, id)
	
	// Last Zombie Check
	fnCheckLastZombie()
}

/*================================================================================
 [Other Functions and Tasks]
=================================================================================*/

public cache_cvars()
{
	g_cached_zombiesilent = get_pcvar_num(cvar_zombiesilent)
	g_cached_customflash = get_pcvar_num(cvar_customflash)
	g_cached_leapzombies = get_pcvar_num(cvar_leapzombies)
	g_cached_leapzombiescooldown = get_pcvar_float(cvar_leapzombiescooldown)
	g_cached_buytime = get_pcvar_float(cvar_buyzonetime)
}

load_customization_from_files()
{
	// Build customization file path
	new path[64]
	get_configsdir(path, charsmax(path))
	format(path, charsmax(path), "%s/%s", path, ZP_CUSTOMIZATION_FILE)
	
	// File not present
	if (!file_exists(path))
	{
		new error[100]
		formatex(error, charsmax(error), "Cannot load customization file %s!", path)
		set_fail_state(error)
		return;
	}
	
	// Set up some vars to hold parsing info
	new linedata[1024], key[64], value[960], section
	
	// Open customization file for reading
	new file = fopen(path, "rt")
	
	while (file && !feof(file))
	{
		// Read one line at a time
		fgets(file, linedata, charsmax(linedata))
		
		// Replace newlines with a null character to prevent headaches
		replace(linedata, charsmax(linedata), "^n", "")
		
		// Blank line or comment
		if (!linedata[0] || linedata[0] == ';') continue;
		
		// New section starting
		if (linedata[0] == '[')
		{
			section++
			continue;
		}
		
		// Get key and value(s)
		strtok(linedata, key, charsmax(key), value, charsmax(value), '=')
		
		// Trim spaces
		trim(key)
		trim(value)
		
		switch (section)
		{
			case SECTION_GENERAL:
			{
				if (equal(key, "ENABLE COUNTDOWN SOUNDS"))
					g_cdsounds_enabled = str_to_num(value)
			}
			case SECTION_ACCESS_FLAGS:
			{
				if (equal(key, "ENABLE/DISABLE MOD"))
					g_access_flag[ACCESS_ENABLE_MOD] = read_flags(value)
				else if (equal(key, "ADMIN MENU"))
					g_access_flag[ACCESS_ADMIN_MENU] = read_flags(value)
				else if (equal(key, "START MODE INFECTION"))
					g_access_flag[ACCESS_MODE_INFECTION] = read_flags(value)
				else if (equal(key, "START MODE MULTI"))
					g_access_flag[ACCESS_MODE_MULTI] = read_flags(value)
				else if (equal(key, "MAKE ZOMBIE"))
					g_access_flag[ACCESS_MAKE_ZOMBIE] = read_flags(value)
				else if (equal(key, "MAKE HUMAN"))
					g_access_flag[ACCESS_MAKE_HUMAN] = read_flags(value)
				else if (equal(key, "RESPAWN PLAYERS"))
					g_access_flag[ACCESS_RESPAWN_PLAYERS] = read_flags(value)
				else if (equal(key, "ADMIN MODELS"))
					g_access_flag[ACCESS_ADMIN_MODELS] = read_flags(value)
				else if (equal(key, "VIP LEVEL"))
					g_access_flag[ACCESS_VIP] = read_flags(value)
			}
			case SECTION_PLAYER_MODELS:
			{
				if (equal(key, "HUMAN"))
				{
					// Parse models
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to models array
						ArrayPushString(model_human, key)
					}
				}
				else if (equal(key, "ADMIN ZOMBIE"))
				{
					// Parse models
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to models array
						ArrayPushString(model_admin_zombie, key)
					}
				}
				else if (equal(key, "ADMIN HUMAN"))
				{
					// Parse models
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to models array
						ArrayPushString(model_admin_human, key)
					}
				}
				else if (equal(key, "FORCE CONSISTENCY"))
					g_force_consistency = str_to_num(value)
				else if (equal(key, "SAME MODELS FOR ALL"))
					g_same_models_for_all = str_to_num(value)
				else if (g_same_models_for_all && equal(key, "ZOMBIE"))
				{
					// Parse models
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to models array
						ArrayPushString(g_zclass_playermodel, key)
						
						// Precache model and retrieve its modelindex
						formatex(linedata, charsmax(linedata), "models/player/%s/%s.mdl", key, key)
						ArrayPushCell(g_zclass_modelindex, engfunc(EngFunc_PrecacheModel, linedata))
						if (g_force_consistency == 1) force_unmodified(force_model_samebounds, {0,0,0}, {0,0,0}, linedata)
						if (g_force_consistency == 2) force_unmodified(force_exactfile, {0,0,0}, {0,0,0}, linedata)
						// Precache modelT.mdl files too
						copy(linedata[strlen(linedata)-4], charsmax(linedata) - (strlen(linedata)-4), "T.mdl")
						if (file_exists(linedata)) engfunc(EngFunc_PrecacheModel, linedata)
					}
				}
			}
			case SECTION_WEAPON_MODELS:
			{
				if (equal(key, "V_KNIFE HUMAN"))
					copy(model_vknife_human, charsmax(model_vknife_human), value)
				else if (equal(key, "P_KNIFE HUMAN"))
					copy(model_pknife_human, charsmax(model_pknife_human), value)
				else if (equal(key, "GRENADE INFECT"))
					copy(model_grenade_infect, charsmax(model_grenade_infect), value)
				else if (equal(key, "V_GRENADE FIRE"))
					copy(model_grenade_fire, charsmax(model_grenade_fire), value)
				else if (equal(key, "P_GRENADE FIRE"))
					copy(model_pgrenade_fire, charsmax(model_pgrenade_fire), value)
				else if (equal(key, "W_GRENADE FIRE"))
					copy(model_wgrenade_fire, charsmax(model_wgrenade_fire), value)
				else if (equal(key, "V_GRENADE FROST"))
					copy(model_grenade_frost, charsmax(model_grenade_frost), value)
				else if (equal(key, "P_GRENADE FROST"))
					copy(model_pgrenade_frost, charsmax(model_pgrenade_frost), value)
				else if (equal(key, "W_GRENADE FROST"))
					copy(model_wgrenade_frost, charsmax(model_wgrenade_frost), value)
				else if (equal(key, "V_GRENADE FLARE"))
					copy(model_grenade_flare, charsmax(model_grenade_flare), value)
				else if (equal(key, "P_GRENADE FLARE"))
					copy(model_pgrenade_flare, charsmax(model_pgrenade_flare), value)
				else if (equal(key, "W_GRENADE FLARE"))
					copy(model_wgrenade_flare, charsmax(model_wgrenade_flare), value)
				else if (equal(key, "V_KNIFE ADMIN HUMAN"))
					copy(model_vknife_admin_human, charsmax(model_vknife_admin_human), value)
				else if (equal(key, "P_KNIFE ADMIN HUMAN"))
					copy(model_pknife_admin_human, charsmax(model_pknife_admin_human), value)
				else if (equal(key, "V_KNIFE ADMIN ZOMBIE"))
					copy(model_vknife_admin_zombie, charsmax(model_vknife_admin_zombie), value)
			}
			case SECTION_GRENADE_SPRITES:
			{
				if (equal(key, "TRAIL"))
					copy(sprite_grenade_trail, charsmax(sprite_grenade_trail), value)
				else if (equal(key, "RING"))
					copy(sprite_grenade_ring, charsmax(sprite_grenade_ring), value)
				else if (equal(key, "FIRE"))
					copy(sprite_grenade_fire, charsmax(sprite_grenade_fire), value)
				else if (equal(key, "SMOKE"))
					copy(sprite_grenade_smoke, charsmax(sprite_grenade_smoke), value)
				else if (equal(key, "GLASS"))
					copy(sprite_grenade_glass, charsmax(sprite_grenade_glass), value)
			}
			case SECTION_SOUNDS:
			{
				if (equal(key, "ROUND START")) 
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(sound_round_start, key)
						ArrayPushCell(sound_round_start_ismp3, equal(key[strlen(key)-4], ".mp3") ? 1 : 0)
					}
				}
				else if (equal(key, "WIN ZOMBIES"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(sound_win_zombies, key)
						ArrayPushCell(sound_win_zombies_ismp3, equal(key[strlen(key)-4], ".mp3") ? 1 : 0)
					}
				}
				else if (equal(key, "WIN HUMANS"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(sound_win_humans, key)
						ArrayPushCell(sound_win_humans_ismp3, equal(key[strlen(key)-4], ".mp3") ? 1 : 0)
					}
				}
				else if (equal(key, "WIN NO ONE"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(sound_win_no_one, key)
						ArrayPushCell(sound_win_no_one_ismp3, equal(key[strlen(key)-4], ".mp3") ? 1 : 0)
					}
				}
				else if (equal(key, "ZOMBIE INFECT"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(zombie_infect, key)
					}
				}
				else if (equal(key, "ZOMBIE PAIN"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(zombie_pain, key)
					}
				}
				else if (equal(key, "ZOMBIE DIE"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(zombie_die, key)
					}
				}
				else if (equal(key, "ZOMBIE FALL"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(zombie_fall, key)
					}
				}
				else if (equal(key, "ZOMBIE MISS SLASH"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(zombie_miss_slash, key)
					}
				}
				else if (equal(key, "ZOMBIE MISS WALL"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(zombie_miss_wall, key)
					}
				}
				else if (equal(key, "ZOMBIE HIT NORMAL"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(zombie_hit_normal, key)
					}
				}
				else if (equal(key, "ZOMBIE HIT STAB"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(zombie_hit_stab, key)
					}
				}
				else if (equal(key, "ZOMBIE IDLE"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(zombie_idle, key)
					}
				}
				else if (equal(key, "ZOMBIE IDLE LAST"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(zombie_idle_last, key)
					}
				}
				else if (equal(key, "ROUND MULTI"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(sound_multi, key)
					}
				}
				else if (equal(key, "GRENADE INFECT EXPLODE"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(grenade_infect, key)
					}
				}
				else if (equal(key, "GRENADE INFECT PLAYER"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(grenade_infect_player, key)
					}
				}
				else if (equal(key, "GRENADE FIRE EXPLODE"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(grenade_fire, key)
					}
				}
				else if (equal(key, "GRENADE FIRE PLAYER"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(grenade_fire_player, key)
					}
				}
				else if (equal(key, "GRENADE FROST EXPLODE"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(grenade_frost, key)
					}
				}
				else if (equal(key, "GRENADE FROST PLAYER"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(grenade_frost_player, key)
					}
				}
				else if (equal(key, "GRENADE FROST BREAK"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(grenade_frost_break, key)
					}
				}
				else if (equal(key, "GRENADE FLARE"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(grenade_flare, key)
					}
				}
				else if (equal(key, "ANTIDOTE"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(sound_antidote, key)
					}
				}
				else if (equal(key, "THUNDER"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(sound_thunder, key)
					}
				}
			}
			case SECTION_AMBIENCE_SOUNDS:
			{
				if (equal(key, "INFECTION ENABLE"))
					g_ambience_sounds[AMBIENCE_SOUNDS_INFECTION] = str_to_num(value)
				else if (g_ambience_sounds[AMBIENCE_SOUNDS_INFECTION] && equal(key, "INFECTION SOUNDS"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushString(sound_ambience1, key)
						ArrayPushCell(sound_ambience1_ismp3, equal(key[strlen(key)-4], ".mp3") ? 1 : 0)
					}
				}
				else if (g_ambience_sounds[AMBIENCE_SOUNDS_INFECTION] && equal(key, "INFECTION DURATIONS"))
				{
					// Parse sounds
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to sounds array
						ArrayPushCell(sound_ambience1_duration, str_to_num(key))
					}
				}
			}
			case SECTION_BUY_MENU_WEAPONS:
			{
				if (equal(key, "PRIMARY"))
				{
					// Parse weapons
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to weapons array
						ArrayPushString(g_primary_items, key)
						ArrayPushCell(g_primary_weaponids, cs_weapon_name_to_id(key))
					}
				}
				else if (equal(key, "SECONDARY"))
				{
					// Parse weapons
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to weapons array
						ArrayPushString(g_secondary_items, key)
						ArrayPushCell(g_secondary_weaponids, cs_weapon_name_to_id(key))
					}
				}
				else if (equal(key, "ADDITIONAL ITEMS"))
				{
					// Parse weapons
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to weapons array
						ArrayPushString(g_additional_items, key)
					}
				}
			}
			case SECTION_EXTRA_ITEMS_WEAPONS:
			{
				if (equal(key, "NAMES"))
				{
					// Parse weapon items
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to weapons array
						ArrayPushString(g_extraweapon_names, key)
					}
				}
				else if (equal(key, "ITEMS"))
				{
					// Parse weapon items
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to weapons array
						ArrayPushString(g_extraweapon_items, key)
					}
				}
				else if (equal(key, "COSTS"))
				{
					// Parse weapon items
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to weapons array
						ArrayPushCell(g_extraweapon_costs, str_to_num(key))
					}
				}
			}
			case SECTION_HARD_CODED_ITEMS_COSTS:
			{
				if (equal(key, "NIGHT VISION"))
					g_extra_costs2[EXTRA_NVISION] = str_to_num(value)
				else if (equal(key, "ANTIDOTE"))
					g_extra_costs2[EXTRA_ANTIDOTE] = str_to_num(value)
				else if (equal(key, "INFECTION BOMB"))
					g_extra_costs2[EXTRA_INFBOMB] = str_to_num(value)
			}
			case SECTION_WEATHER_EFFECTS:
			{
				if (equal(key, "RAIN"))
					g_ambience_rain = str_to_num(value)
				else if (equal(key, "SNOW"))
					g_ambience_snow = str_to_num(value)
				else if (equal(key, "FOG"))
					g_ambience_fog = str_to_num(value)
				else if (equal(key, "FOG DENSITY"))
					copy(g_fog_density, charsmax(g_fog_density), value)
				else if (equal(key, "FOG RED"))
					g_fog_color[0] = str_to_num(value)
				else if (equal(key, "FOG GREEN"))
					g_fog_color[1] = str_to_num(value)
				else if (equal(key, "FOG BLUE"))
					g_fog_color[2] = str_to_num(value)
			}
			case SECTION_SKY:
			{
				if (equal(key, "ENABLE"))
					g_sky_enable = str_to_num(value)
				else if (equal(key, "SKY NAMES"))
				{
					// Parse sky names
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to skies array
						ArrayPushString(g_sky_names, key)
						
						// Preache custom sky files
						formatex(linedata, charsmax(linedata), "gfx/env/%sbk.tga", key)
						engfunc(EngFunc_PrecacheGeneric, linedata)
						formatex(linedata, charsmax(linedata), "gfx/env/%sdn.tga", key)
						engfunc(EngFunc_PrecacheGeneric, linedata)
						formatex(linedata, charsmax(linedata), "gfx/env/%sft.tga", key)
						engfunc(EngFunc_PrecacheGeneric, linedata)
						formatex(linedata, charsmax(linedata), "gfx/env/%slf.tga", key)
						engfunc(EngFunc_PrecacheGeneric, linedata)
						formatex(linedata, charsmax(linedata), "gfx/env/%srt.tga", key)
						engfunc(EngFunc_PrecacheGeneric, linedata)
						formatex(linedata, charsmax(linedata), "gfx/env/%sup.tga", key)
						engfunc(EngFunc_PrecacheGeneric, linedata)
					}
				}
			}
			case SECTION_LIGHTNING:
			{
				if (equal(key, "LIGHTS"))
				{
					// Parse lights
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to lightning array
						ArrayPushString(lights_thunder, key)
					}
				}
			}
			case SECTION_ZOMBIE_DECALS:
			{
				if (equal(key, "DECALS"))
				{
					// Parse decals
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to zombie decals array
						ArrayPushCell(zombie_decals, str_to_num(key))
					}
				}
			}
			case SECTION_KNOCKBACK:
			{
				// Format weapon entity name
				strtolower(key)
				format(key, charsmax(key), "weapon_%s", key)
				
				// Add value to knockback power array
				kb_weapon_power[cs_weapon_name_to_id(key)] = str_to_float(value)
			}
			case SECTION_OBJECTIVE_ENTS:
			{
				if (equal(key, "CLASSNAMES"))
				{
					// Parse classnames
					while (value[0] != 0 && strtok(value, key, charsmax(key), value, charsmax(value), ','))
					{
						// Trim spaces
						trim(key)
						trim(value)
						
						// Add to objective ents array
						ArrayPushString(g_objective_ents, key)
					}
				}
			}
			case SECTION_SVC_BAD:
			{
				if (equal(key, "MODELCHANGE DELAY"))
					g_modelchange_delay = str_to_float(value)
				else if (equal(key, "HANDLE MODELS ON SEPARATE ENT"))
					g_handle_models_on_separate_ent = str_to_num(value)
				else if (equal(key, "SET MODELINDEX OFFSET"))
					g_set_modelindex_offset = str_to_num(value)
			}
		}
	}
	if (file) fclose(file)
}

// Register Ham Forwards for CZ bots
public register_ham_czbots(id)
{
	// Make sure it's a CZ bot and it's still connected
	if (g_hamczbots || !g_isconnected[id] || !get_pcvar_num(cvar_botquota))
		return;
	
	RegisterHamFromEntity(Ham_Spawn, id, "fw_PlayerSpawn_Post", 1)
	RegisterHamFromEntity(Ham_Killed, id, "fw_PlayerKilled")
	RegisterHamFromEntity(Ham_Killed, id, "fw_PlayerKilled_Post", 1)
	RegisterHamFromEntity(Ham_TakeDamage, id, "fw_TakeDamage")
	RegisterHamFromEntity(Ham_TakeDamage, id, "fw_TakeDamage_Post", 1)
	RegisterHamFromEntity(Ham_TraceAttack, id, "fw_TraceAttack")
	RegisterHamFromEntity(Ham_Player_ResetMaxSpeed, id, "fw_ResetMaxSpeed_Post", 1)
	
	// Ham forwards for CZ bots succesfully registered
	g_hamczbots = true
	
	// If the bot has already spawned, call the forward manually for him
	if (is_user_alive(id)) fw_PlayerSpawn_Post(id)
}

// Disable minmodels task
public disable_minmodels(id)
{
	if (!g_isconnected[id]) return;
	client_cmd(id, "cl_minmodels 0")
}

// Bots automatically buy extra items
public bot_buy_extras(taskid)
{
	if (!g_isalive[ID_SPAWN])
		return;
	
	if (!g_zombie[ID_SPAWN]) // human bots
	{
		// Attempt to buy Night Vision
		buy_extra_item(ID_SPAWN, EXTRA_NVISION)
		
		// Attempt to buy a weapon
		buy_extra_item(ID_SPAWN, random_num(EXTRA_WEAPONS_STARTID, EXTRAS_CUSTOM_STARTID-1))
	}
	else // zombie bots
	{
		// Do nothing
	}
}

// Refill BP Ammo Task
public refill_bpammo(const args[], id)
{
	// Player died or turned into a zombie
	if (!g_isalive[id] || g_zombie[id])
		return;
	
	set_msg_block(g_msgAmmoPickup, BLOCK_ONCE)
	ExecuteHamB(Ham_GiveAmmo, id, MAXBPAMMO[REFILL_WEAPONID], AMMOTYPE[REFILL_WEAPONID], MAXBPAMMO[REFILL_WEAPONID])
}

// Balance Teams Task
balance_teams()
{
	// Get amount of users playing
	static iPlayersnum
	iPlayersnum = fnGetPlaying()
	
	// No players, don't bother
	if (iPlayersnum < 1) return;
	
	// Split players evenly
	static iTerrors, iMaxTerrors, id, team[33]
	iMaxTerrors = iPlayersnum/2
	iTerrors = 0
	
	// First, set everyone to CT
	for (id = 1; id <= g_maxplayers; id++)
	{
		// Skip if not connected
		if (!g_isconnected[id])
			continue;
		
		team[id] = fm_cs_get_user_team(id)
		
		// Skip if not playing
		if (team[id] == FM_CS_TEAM_SPECTATOR || team[id] == FM_CS_TEAM_UNASSIGNED)
			continue;
		
		// Set team
		remove_task(id+TASK_TEAM)
		fm_cs_set_user_team(id, FM_CS_TEAM_CT)
		team[id] = FM_CS_TEAM_CT
	}
	
	// Then randomly set half of the players to Terrorists
	while (iTerrors < iMaxTerrors)
	{
		// Keep looping through all players
		if (++id > g_maxplayers) id = 1
		
		// Skip if not connected
		if (!g_isconnected[id])
			continue;
		
		// Skip if not playing or already a Terrorist
		if (team[id] != FM_CS_TEAM_CT)
			continue;
		
		// Random chance
		if (random_num(0, 1))
		{
			fm_cs_set_user_team(id, FM_CS_TEAM_T)
			team[id] = FM_CS_TEAM_T
			iTerrors++
		}
	}
}

// Respawn all (deathmatch = 5)
public respawn_dm5_task(taskid)
{
	// Already alive or round ended
	if (g_endround)
		return;
	
	// Respawn if only the last human is left?
	if (!get_pcvar_num(cvar_respawnafterlast) && fnGetHumans() <= 1)
		return;
	
	// Respawn everyone
	for (new id = 1; id <= g_maxplayers; id++)
	{
		// Skip if not dead
		if (!g_isconnected[id] && !g_isbot[id] || g_isalive[id])
			continue;
			
		// Get player's team
		new team = fm_cs_get_user_team(id)
		
		// Player moved to spectators
		if (team == FM_CS_TEAM_SPECTATOR || team == FM_CS_TEAM_UNASSIGNED)
			continue;
		
		// Respawn as zombie?
		g_respawn_as_zombie[id] = true
		
		respawn_player_manually(id)
	}
}

// Respawn Player Task (deathmatch)
public respawn_player_task(taskid)
{
	// Already alive or round ended
	if (g_isalive[ID_SPAWN] || g_endround)
		return;
	
	// Get player's team
	static team
	team = fm_cs_get_user_team(ID_SPAWN)
	
	// Player moved to spectators
	if (team == FM_CS_TEAM_SPECTATOR || team == FM_CS_TEAM_UNASSIGNED)
	return;
	
	// Respawn player automatically if allowed on current round
	// Infection rounds = none of the above
	if (!get_pcvar_num(cvar_allowrespawninfection))
		return;
	
	// Respawn if only the last human is left?
	if (!get_pcvar_num(cvar_respawnafterlast) && fnGetHumans() <= 1)
		return;
	
	// Respawn as zombie?
	if (get_pcvar_num(cvar_deathmatch) == 2 || (get_pcvar_num(cvar_deathmatch) == 3 && random_num(0, 1)) || (get_pcvar_num(cvar_deathmatch) == 4 && fnGetZombies() < fnGetAlive()/2))
		g_respawn_as_zombie[ID_SPAWN] = true
	
	respawn_player_manually(ID_SPAWN)
}

// Respawn Player Check Task (if killed by worldspawn)
public respawn_player_check_task(taskid)
{
	// Successfully spawned or round ended
	if (g_isalive[ID_SPAWN] || g_endround)
		return;
	
	// Get player's team
	static team
	team = fm_cs_get_user_team(ID_SPAWN)
	
	// Player moved to spectators
	if (team == FM_CS_TEAM_SPECTATOR || team == FM_CS_TEAM_UNASSIGNED)
		return;
	
	// If player was being spawned as a zombie, set the flag again
	if (g_zombie[ID_SPAWN]) g_respawn_as_zombie[ID_SPAWN] = true
	else g_respawn_as_zombie[ID_SPAWN] = false
	
	respawn_player_manually(ID_SPAWN)
}

// Respawn Player Manually (called after respawn checks are done)
respawn_player_manually(id)
{
	// Set proper team before respawning, so that the TeamInfo message that's sent doesn't confuse PODBots
	if (g_respawn_as_zombie[id])
		fm_cs_set_user_team(id, FM_CS_TEAM_T)
	else
		fm_cs_set_user_team(id, FM_CS_TEAM_CT)
	
	// Respawning a player has never been so easy
	ExecuteHamB(Ham_CS_RoundRespawn, id)
}

// Check Round Task -check that we still have both zombies and humans on a round-
check_round(leaving_player)
{
	// Round ended or make_a_zombie task still active
	if (g_endround || task_exists(TASK_MAKEZOMBIE))
		return;
	
	// Get alive players count
	static iPlayersnum, id
	iPlayersnum = fnGetAlive()
	
	// Last alive player, don't bother
	if (iPlayersnum < 2)
		return;
	
	// Last zombie disconnecting
	if (g_zombie[leaving_player] && fnGetZombies() == 1)
	{
		// Only one CT left, don't bother
		if (fnGetHumans() == 1 && fnGetCTs() == 1)
			return;
		
		// Pick a random one to take his place
		while ((id = fnGetRandomAlive(random_num(1, iPlayersnum))) == leaving_player ) { /* keep looping */ }
		
		// Set player leaving flag
		g_lastplayerleaving = true
		
		// Turn into a zombie
		zombieme(id, 0, 0, 0, 1)
		
		// Remove player leaving flag
		g_lastplayerleaving = false
	}
	
	// Last human disconnecting
	else if (!g_zombie[leaving_player] && fnGetHumans() == 1)
	{
		// Only one T left, don't bother
		if (fnGetZombies() == 1 && fnGetTs() == 1)
			return;
		
		// Pick a random one to take his place
		while ((id = fnGetRandomAlive(random_num(1, iPlayersnum))) == leaving_player ) { /* keep looping */ }
		
		// Set player leaving flag
		g_lastplayerleaving = true
		
		// Turn into a human?
		humanme(id, 0)
		
		// Remove player leaving flag
		g_lastplayerleaving = false
	}
}

// Lighting Effects Task
public lighting_effects()
{
	// Cache some CVAR values at every 5 secs
	cache_cvars()
	
	static thunderclap_in_progress, Float:thunder
	thunderclap_in_progress = task_exists(TASK_THUNDER)
	thunder = get_pcvar_float(cvar_thunder)
	
	// Set thunderclap tasks if not existant
	if (thunder > 0.0 && !task_exists(TASK_THUNDER_PRE) && !thunderclap_in_progress)
	{
		g_lights_i = 0
		ArrayGetString(lights_thunder, random_num(0, ArraySize(lights_thunder) - 1), g_lights_cycle, charsmax(g_lights_cycle))
		g_lights_cycle_len = strlen(g_lights_cycle)
		set_task(thunder, "thunderclap", TASK_THUNDER_PRE)
	}
	
	// Set lighting only when no thunderclaps are going on
	if (!thunderclap_in_progress) {
		for (new i = 1; i <= g_maxplayers; i++) {
			if(!g_nvisionenabled[i] && g_modestarted) SetLight(i, "c")
			else if(!g_modestarted && !g_nvisionenabled[i]) {
				switch(g_seconds) {
					case 0: SetLight(i, "c")
					case 1: SetLight(i, "d")
					case 2: SetLight(i, "e")
					case 3: SetLight(i, "f")
					case 4: SetLight(i, "g")
					case 5: SetLight(i, "h")
					case 6: SetLight(i, "i")
					case 7: SetLight(i, "j")
					default: SetLight(i, "k")
				}
			}
		}
	}
}

// Thunderclap task
public thunderclap()
{
	// Play thunder sound
	if (g_lights_i == 0)
	{
		static sound[64]
		ArrayGetString(sound_thunder, random_num(0, ArraySize(sound_thunder) - 1), sound, charsmax(sound))
		PlaySound(sound)
	}
	
	// Set lighting
	static light[2]
	light[0] = g_lights_cycle[g_lights_i]
	for(new i = 1; i <= g_maxplayers; i++) if(is_user_connected(i)) {
		if(!g_nvisionenabled[i]) SetLight(i, light)
	}
	
	g_lights_i++
	
	// Lighting cycle end?
	if (g_lights_i >= g_lights_cycle_len)
	{
		remove_task(TASK_THUNDER)
		lighting_effects()
	}
	// Lighting cycle start?
	else if (!task_exists(TASK_THUNDER))
		set_task(0.1, "thunderclap", TASK_THUNDER, _, _, "b")
}

// Ambience Sound Effects Task
public ambience_sound_effects(taskid)
{
	// Play a random sound depending on the round
	static sound[64], iRand, duration
	iRand = random_num(0, ArraySize(sound_ambience1) - 1)
	ArrayGetString(sound_ambience1, iRand, sound, charsmax(sound))
	duration = ArrayGetCell(sound_ambience1_duration, iRand)
	
	// Play it on clients
	PlaySound(sound)
	
	// Set the task for when the sound is done playing
	set_task(float(duration), "ambience_sound_effects", TASK_AMBIENCESOUNDS)
}

// Flashlight Charge Task
public flashlight_charge(taskid)
{
	// Drain or charge?
	if (g_flashlight[ID_CHARGE])
		g_flashbattery[ID_CHARGE] -= get_pcvar_num(cvar_flashdrain)
	else
		g_flashbattery[ID_CHARGE] += get_pcvar_num(cvar_flashcharge)
	
	// Battery fully charged
	if (g_flashbattery[ID_CHARGE] >= 100)
	{
		// Don't exceed 100%
		g_flashbattery[ID_CHARGE] = 100
		
		// Update flashlight battery on HUD
		message_begin(MSG_ONE, g_msgFlashBat, _, ID_CHARGE)
		write_byte(100) // battery
		message_end()
		
		// Task not needed anymore
		remove_task(taskid);
		return;
	}
	
	// Battery depleted
	if (g_flashbattery[ID_CHARGE] <= 0)
	{
		// Turn it off
		g_flashlight[ID_CHARGE] = false
		g_flashbattery[ID_CHARGE] = 0
		
		// Play flashlight toggle sound
		emit_sound(ID_CHARGE, CHAN_ITEM, sound_flashlight, 1.0, ATTN_NORM, 0, PITCH_NORM)
		
		// Update flashlight status on HUD
		message_begin(MSG_ONE, g_msgFlashlight, _, ID_CHARGE)
		write_byte(0) // toggle
		write_byte(0) // battery
		message_end()
		
		// Remove flashlight task for this player
		remove_task(ID_CHARGE+TASK_FLASH)
	}
	else
	{
		// Update flashlight battery on HUD
		message_begin(MSG_ONE_UNRELIABLE, g_msgFlashBat, _, ID_CHARGE)
		write_byte(g_flashbattery[ID_CHARGE]) // battery
		message_end()
	}
}

// Remove Spawn Protection Task
public remove_spawn_protection(taskid)
{
	// Not alive
	if (!g_isalive[ID_SPAWN])
		return;
	
	// Remove spawn protection
	g_nodamage[ID_SPAWN] = false
	set_pev(ID_SPAWN, pev_effects, pev(ID_SPAWN, pev_effects) & ~EF_NODRAW)
}

// Hide Player's Money Task
public task_hide_money(taskid)
{
	// Not alive
	if (!g_isalive[ID_SPAWN])
		return;
	
	// Hide money
	message_begin(MSG_ONE, g_msgHideWeapon, _, ID_SPAWN)
	write_byte(HIDEHUD_MONEY) // what to hide bitsum
	message_end()
	
	// Hide the HL crosshair that's drawn
	message_begin(MSG_ONE, g_msgCrosshair, _, ID_SPAWN)
	write_byte(0) // toggle
	message_end()
}

// Turn Off Flashlight and Restore Batteries
turn_off_flashlight(id)
{
	// Restore batteries for the next use
	fm_cs_set_user_batteries(id, 100)
	
	// Check if flashlight is on
	if (pev(id, pev_effects) & EF_DIMLIGHT)
	{
		// Turn it off
		set_pev(id, pev_impulse, IMPULSE_FLASHLIGHT)
	}
	else
	{
		// Clear any stored flashlight impulse (bugfix)
		set_pev(id, pev_impulse, 0)
	}
	
	// Turn off custom flashlight
	if (g_cached_customflash)
	{
		// Turn it off
		g_flashlight[id] = false
		g_flashbattery[id] = 100
		
		// Update flashlight HUD
		message_begin(MSG_ONE, g_msgFlashlight, _, id)
		write_byte(0) // toggle
		write_byte(100) // battery
		message_end()
		
		// Remove previous tasks
		remove_task(id+TASK_CHARGE)
		remove_task(id+TASK_FLASH)
	}
}

// Infection Bomb Explosion
infection_explode(ent)
{
	// Round ended (bugfix)
	if (g_endround) return;
	
	// Get origin
	static Float:originF[3]
	pev(ent, pev_origin, originF)
	
	// Make the explosion
	create_blast(originF)
	
	// Infection nade explode sound
	static sound[64]
	ArrayGetString(grenade_infect, random_num(0, ArraySize(grenade_infect) - 1), sound, charsmax(sound))
	emit_sound(ent, CHAN_WEAPON, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
	
	// Get attacker
	static attacker
	attacker = pev(ent, pev_owner)
	
	// Infection bomb owner disconnected? (bugfix)
	if (!is_user_valid_connected(attacker))
	{
		// Get rid of the grenade
		engfunc(EngFunc_RemoveEntity, ent)
		return;
	}
	
	// Collisions
	static victim
	victim = -1
	
	while ((victim = engfunc(EngFunc_FindEntityInSphere, victim, originF, NADE_EXPLOSION_RADIUS)) != 0)
	{
		// Only effect alive non-spawnprotected humans
		if (!is_user_valid_alive(victim) || g_zombie[victim] || g_nodamage[victim])
			continue;
		
		// Infected victim's sound
		ArrayGetString(grenade_infect_player, random_num(0, ArraySize(grenade_infect_player) - 1), sound, charsmax(sound))
		emit_sound(victim, CHAN_VOICE, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
		
		// Turn into zombie
		zombieme(victim, attacker, 1, 1, 1)
	}
	
	// Get rid of the grenade
	engfunc(EngFunc_RemoveEntity, ent)
}

// Fire Grenade Explosion
fire_explode(ent)
{
	// Get origin
	static Float:originF[3]
	pev(ent, pev_origin, originF)
	
	// Make the explosion
	create_blast2(originF)
	
	// Fire nade explode sound
	static sound[64]
	ArrayGetString(grenade_fire, random_num(0, ArraySize(grenade_fire) - 1), sound, charsmax(sound))
	emit_sound(ent, CHAN_WEAPON, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
	
	// Collisions
	static victim
	victim = -1
	
	while ((victim = engfunc(EngFunc_FindEntityInSphere, victim, originF, NADE_EXPLOSION_RADIUS)) != 0)
	{
		// Only effect alive zombies
		if (!is_user_valid_alive(victim) || !g_zombie[victim] || g_nodamage[victim])
			continue;
		
		// Heat icon?
		if (get_pcvar_num(cvar_hudicons))
		{
			message_begin(MSG_ONE_UNRELIABLE, g_msgDamage, _, victim)
			write_byte(0) // damage save
			write_byte(0) // damage take
			write_long(DMG_BURN) // damage type
			write_coord(0) // x
			write_coord(0) // y
			write_coord(0) // z
			message_end()
		}
		
		g_burning_duration[victim] += get_pcvar_num(cvar_fireduration) * 5
		
		// Set burning task on victim if not present
		if (!task_exists(victim+TASK_BURN))
			set_task(0.2, "burning_flame", victim+TASK_BURN, _, _, "b")
	}
	
	// Get rid of the grenade
	engfunc(EngFunc_RemoveEntity, ent)
}

// Frost Grenade Explosion
frost_explode(ent)
{
	// Get origin
	static Float:originF[3]
	pev(ent, pev_origin, originF)
	
	// Make the explosion
	create_blast3(originF)
	
	// Frost nade explode sound
	static sound[64]
	ArrayGetString(grenade_frost, random_num(0, ArraySize(grenade_frost) - 1), sound, charsmax(sound))
	emit_sound(ent, CHAN_WEAPON, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
	
	// Collisions
	static victim
	victim = -1
	
	while ((victim = engfunc(EngFunc_FindEntityInSphere, victim, originF, NADE_EXPLOSION_RADIUS)) != 0)
	{
		// Only effect alive unfrozen zombies
		if (!is_user_valid_alive(victim) || !g_zombie[victim] || g_frozen[victim] || g_nodamage[victim])
			continue;
		
		// Freeze icon?
		if (get_pcvar_num(cvar_hudicons))
		{
			message_begin(MSG_ONE_UNRELIABLE, g_msgDamage, _, victim)
			write_byte(0) // damage save
			write_byte(0) // damage take
			write_long(DMG_DROWN) // damage type - DMG_FREEZE
			write_coord(0) // x
			write_coord(0) // y
			write_coord(0) // z
			message_end()
		}
		
		// Light blue glow while frozen
		if (g_handle_models_on_separate_ent)
			fm_set_rendering(g_ent_playermodel[victim], kRenderFxGlowShell, 0, 100, 200, kRenderNormal, 25)
		else
			fm_set_rendering(victim, kRenderFxGlowShell, 0, 100, 200, kRenderNormal, 25)
		
		// Freeze sound
		ArrayGetString(grenade_frost_player, random_num(0, ArraySize(grenade_frost_player) - 1), sound, charsmax(sound))
		emit_sound(victim, CHAN_BODY, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
		
		// Add a blue tint to their screen
		message_begin(MSG_ONE, g_msgScreenFade, _, victim)
		write_short(0) // duration
		write_short(0) // hold time
		write_short(FFADE_STAYOUT) // fade type
		write_byte(0) // red
		write_byte(50) // green
		write_byte(200) // blue
		write_byte(100) // alpha
		message_end()
		
		// Set the frozen flag
		g_frozen[victim] = true
		
		// Save player's view angles
		pev(victim, pev_v_angle, g_frozen_v_angle[victim])
		
		// Save player's old gravity (bugfix)
		pev(victim, pev_gravity, g_frozen_gravity[victim])
		
		// Prevent from jumping
		if (pev(victim, pev_flags) & FL_ONGROUND)
			set_pev(victim, pev_gravity, 999999.9) // set really high
		else
			set_pev(victim, pev_gravity, 0.000001) // no gravity
		
		// Prevent from moving
		ExecuteHamB(Ham_Player_ResetMaxSpeed, victim)
		
		// Prevent from attacking
		set_pdata_float(victim, OFFSET_NEXTATTACK, get_pcvar_float(cvar_freezeduration), OFFSET_LINUX)
		
		// Set a task to remove the freeze
		set_task(get_pcvar_float(cvar_freezeduration), "remove_freeze", victim)
	}
	
	// Get rid of the grenade
	engfunc(EngFunc_RemoveEntity, ent)
}

// Remove freeze task
public remove_freeze(id)
{
	// Not alive or not frozen anymore
	if (!g_isalive[id] || !g_frozen[id])
		return;
	
	// Unfreeze
	g_frozen[id] = false;
	g_frozen_v_angle[id] = {0, 0, 0};
	
	// Restore gravity and maxspeed (bugfix)
	set_pev(id, pev_gravity, g_frozen_gravity[id])
	ExecuteHamB(Ham_Player_ResetMaxSpeed, id)
	
	// Restore rendering
	if (g_handle_models_on_separate_ent)
	{
		// Remove glow on player model entity
		fm_set_rendering(g_ent_playermodel[id])
	}
	else
	{
		// Remove glow
		fm_set_rendering(id)
	}
	
	// Gradually remove screen's blue tint
	if(!g_nvisionenabled[id]) {
		SetLight(id,"c")
		message_begin(MSG_ONE, g_msgScreenFade, _, id)
		write_short(UNIT_SECOND) // duration
		write_short(0) // hold time
		write_short(FFADE_IN) // fade type
		write_byte(0) // red
		write_byte(50) // green
		write_byte(200) // blue
		write_byte(100) // alpha
		message_end()
	}
	else Nvg(id)
	
	// Broken glass sound
	static sound[64]
	ArrayGetString(grenade_frost_break, random_num(0, ArraySize(grenade_frost_break) - 1), sound, charsmax(sound))
	emit_sound(id, CHAN_BODY, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
	
	// Get player's origin
	static origin2[3]
	get_user_origin(id, origin2)
	
	// Glass shatter
	message_begin(MSG_PVS, SVC_TEMPENTITY, origin2)
	write_byte(TE_BREAKMODEL) // TE id
	write_coord(origin2[0]) // x
	write_coord(origin2[1]) // y
	write_coord(origin2[2]+24) // z
	write_coord(16) // size x
	write_coord(16) // size y
	write_coord(16) // size z
	write_coord(random_num(-50, 50)) // velocity x
	write_coord(random_num(-50, 50)) // velocity y
	write_coord(25) // velocity z
	write_byte(10) // random velocity
	write_short(g_glassSpr) // model
	write_byte(10) // count
	write_byte(25) // life
	write_byte(BREAK_GLASS) // flags
	message_end()
	
	ExecuteForward(g_fwUserUnfrozen, g_fwDummyResult, id);
}

// Remove Stuff Task
public remove_stuff()
{
	static ent
	
	// Remove rotating doors
	if (get_pcvar_num(cvar_removedoors) > 0)
	{
		ent = -1;
		while ((ent = engfunc(EngFunc_FindEntityByString, ent, "classname", "func_door_rotating")) != 0)
			engfunc(EngFunc_SetOrigin, ent, Float:{8192.0 ,8192.0 ,8192.0})
	}
	
	// Remove all doors
	if (get_pcvar_num(cvar_removedoors) > 1)
	{
		ent = -1;
		while ((ent = engfunc(EngFunc_FindEntityByString, ent, "classname", "func_door")) != 0)
			engfunc(EngFunc_SetOrigin, ent, Float:{8192.0 ,8192.0 ,8192.0})
	}
	
	// Triggered lights
	if (!get_pcvar_num(cvar_triggered))
	{
		ent = -1
		while ((ent = engfunc(EngFunc_FindEntityByString, ent, "classname", "light")) != 0)
		{
			dllfunc(DLLFunc_Use, ent, 0); // turn off the light
			set_pev(ent, pev_targetname, 0) // prevent it from being triggered
		}
	}
}

// Set Custom Weapon Models
replace_weapon_models(id, weaponid)
{
	switch (weaponid)
	{
		case CSW_KNIFE: // Custom knife models
		{
			if (g_zombie[id])
			{
				// Admin knife models?
				if (get_pcvar_num(cvar_adminknifemodelszombie) && get_user_flags(id) & g_access_flag[ACCESS_ADMIN_MODELS])
				{
					set_pev(id, pev_viewmodel2, model_vknife_admin_zombie)
					set_pev(id, pev_weaponmodel2, "")
				}
				else
				{
					static clawmodel[100]
					ArrayGetString(g_zclass_clawmodel, g_zombieclass[id], clawmodel, charsmax(clawmodel))
					format(clawmodel, charsmax(clawmodel), "models/zn/%s", clawmodel)
					set_pev(id, pev_viewmodel2, clawmodel)
					set_pev(id, pev_weaponmodel2, "")
				}
			}
			else // Humans
			{
				// Admin knife models?
				if (get_pcvar_num(cvar_adminknifemodelshuman) && get_user_flags(id) & g_access_flag[ACCESS_ADMIN_MODELS])
				{
					set_pev(id, pev_viewmodel2, model_vknife_admin_human)
					set_pev(id, pev_weaponmodel2, model_pknife_admin_human)
				}
				else
				{
					set_pev(id, pev_viewmodel2, model_vknife_human)
					set_pev(id, pev_weaponmodel2, model_pknife_human)
				}
			}
		}
		case CSW_HEGRENADE: // Infection bomb or fire grenade
		{
			if (g_zombie[id])
				set_pev(id, pev_viewmodel2, model_grenade_infect)
			else {
				set_pev(id, pev_viewmodel2, model_grenade_fire)
				set_pev(id, pev_weaponmodel2, model_pgrenade_fire)
			}
		}
		case CSW_FLASHBANG: // Frost grenade
		{
			set_pev(id, pev_viewmodel2, model_grenade_frost)
			set_pev(id, pev_weaponmodel2, model_pgrenade_frost)
		}
		case CSW_SMOKEGRENADE: // Flare grenade
		{
			set_pev(id, pev_viewmodel2, model_grenade_flare)
			set_pev(id, pev_weaponmodel2, model_pgrenade_flare)
		}
	}
	
	// Update model on weaponmodel ent
	if (g_handle_models_on_separate_ent) fm_set_weaponmodel_ent(id)
}

// Reset Player Vars
reset_vars(id, resetall)
{
	g_zombie[id] = false
	g_instantinfect[id] = false
	g_firstzombie[id] = false
	g_lastzombie[id] = false
	g_lasthuman[id] = false
	g_frozen[id] = false
	g_frozen_v_angle[id] = {0, 0, 0}
	g_nodamage[id] = false
	g_respawn_as_zombie[id] = false
	g_nvision[id] = false
	g_nvisionenabled[id] = false
	g_flashlight[id] = false
	g_flashbattery[id] = 100
	g_canbuy[id] = true
	g_burning_duration[id] = 0
	g_gametime_infect[id] = 0.0
	
	if (resetall)
	{
		set_ammo(id, get_pcvar_num(cvar_startammopacks))
		g_zombieclass[id] = ZCLASS_NONE
		g_zombieclassnext[id] = ZCLASS_NONE
		g_damagedealt_human[id] = 0
		g_damagedealt_zombie[id] = 0
		WPN_AUTO_ON = 0
		WPN_STARTID = 0
		PL_ACTION = 0
		MENU_PAGE_ZCLASS = 0
		MENU_PAGE_EXTRAS = 0
		MENU_PAGE_PLAYERS = 0
	}
}

// Set spectators nightvision
public spec_nvision(id) {
	// Not connected, alive, or bot
	if (!g_isconnected[id] || g_isalive[id] || g_isbot[id])
		return;
	
	// Give Night Vision?
	if (get_pcvar_num(cvar_nvggive)) {
		g_nvision[id] = true
		
		// Turn on Night Vision automatically?
		if (get_pcvar_num(cvar_nvggive) == 1) {
			g_nvisionenabled[id] = true
			Nvg(id)
		}
	}
}

// Show HUD Task
public ShowHUD(taskid) {
	static id
	id = ID_SHOWHUD;
	
	if(g_nvision[ID_SHOWHUD] && g_nvisionenabled[ID_SHOWHUD] && !g_frozen[ID_SHOWHUD])
		Nvg(ID_SHOWHUD)
	
	// Player died?
	if (!g_isalive[id]) {
		// Get spectating target
		id = pev(id, PEV_SPEC_TARGET)
		
		// Target not alive
		if (!g_isalive[id]) return;
	}
	
	// Format classname
	static class[32]
	if (g_zombie[id]) {
		copy(class, charsmax(class), g_zombie_classname[id])
		replace_all(class, charsmax(class), "\y", "")
		replace_all(class, charsmax(class), "\d", "")
		replace_all(class, charsmax(class), "\w", "")
		replace_all(class, charsmax(class), "\r", "")
	} else {
		formatex(class, charsmax(class), "%L", ID_SHOWHUD, "CLASS_HUMAN")
	}
	
	// Spectating someone else?
	if (id != ID_SHOWHUD) {
		// Show name, health, class, and ammo packs
		set_dhudmessage(255, 255, 255, HUD_SPECT_X, HUD_SPECT_Y, 0, 6.0, 1.1, 0.0, 0.0)
		if(get_user_flags(id) & g_access_flag[ACCESS_VIP]) show_dhudmessage(ID_SHOWHUD, "[%L %s] [VIP]^nHP: %d - %L %s - %L %d", ID_SHOWHUD, "SPECTATING", g_playername[id], pev(id, pev_health), ID_SHOWHUD, "CLASS_CLASS", class, ID_SHOWHUD, "AMMO_PACKS1", g_ammopacks[id])
		else show_dhudmessage(ID_SHOWHUD, "[%L %s]^nHP: %d - %L %s - %L %d", ID_SHOWHUD, "SPECTATING", g_playername[id], pev(id, pev_health), ID_SHOWHUD, "CLASS_CLASS", class, ID_SHOWHUD, "AMMO_PACKS1", g_ammopacks[id])
	} else {
		// Show VIP flag in [TAB] Player list
		if(get_user_flags(ID_SHOWHUD) & g_access_flag[ACCESS_VIP]) {
			message_begin(MSG_ALL, g_msgScoreAttrib)
			write_byte(ID_SHOWHUD)
			write_byte(4)
			message_end()
		}
	}
}

// Play idle zombie sounds
public zombie_play_idle(taskid) {
	// Round ended/new one starting
	if (g_endround || g_newround)
		return;
	
	static sound[64]
	
	// Last zombie?
	if (g_lastzombie[ID_BLOOD]) {
		ArrayGetString(zombie_idle_last, random_num(0, ArraySize(zombie_idle_last) - 1), sound, charsmax(sound))
		emit_sound(ID_BLOOD, CHAN_VOICE, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
	} else {
		ArrayGetString(zombie_idle, random_num(0, ArraySize(zombie_idle) - 1), sound, charsmax(sound))
		emit_sound(ID_BLOOD, CHAN_VOICE, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
	}
}

// Place user at a random spawn
do_random_spawn(id, regularspawns = 0) {
	static hull, sp_index, i
	
	// Get whether the player is crouching
	hull = (pev(id, pev_flags) & FL_DUCKING) ? HULL_HEAD : HULL_HUMAN
	
	// Use regular spawns?
	if (!regularspawns) {
		// No spawns?
		if (!g_spawnCount)
			return;
		
		// Choose random spawn to start looping at
		sp_index = random_num(0, g_spawnCount - 1)
		
		// Try to find a clear spawn
		for (i = sp_index + 1; /*no condition*/; i++) {
			// Start over when we reach the end
			if (i >= g_spawnCount) i = 0
			
			// Free spawn space?
			if (is_hull_vacant(g_spawns[i], hull)) {
				// Engfunc_SetOrigin is used so ent's mins and maxs get updated instantly
				engfunc(EngFunc_SetOrigin, id, g_spawns[i])
				break;
			}
			
			// Loop completed, no free space found
			if (i == sp_index) break;
		}
	} else {
		// No spawns?
		if (!g_spawnCount2)
			return;
		
		// Choose random spawn to start looping at
		sp_index = random_num(0, g_spawnCount2 - 1)
		
		// Try to find a clear spawn
		for (i = sp_index + 1; /*no condition*/; i++) {
			// Start over when we reach the end
			if (i >= g_spawnCount2) i = 0
			
			// Free spawn space?
			if (is_hull_vacant(g_spawns2[i], hull)) {
				// Engfunc_SetOrigin is used so ent's mins and maxs get updated instantly
				engfunc(EngFunc_SetOrigin, id, g_spawns2[i])
				break;
			}
			
			// Loop completed, no free space found
			if (i == sp_index) break;
		}
	}
}

// Get Zombies -returns alive zombies number-
fnGetZombies() {
	static iZombies, id
	iZombies = 0
	for (id = 1; id <= g_maxplayers; id++) {
		if (g_isalive[id] && g_zombie[id])
			iZombies++
	}
	return iZombies;
}

// Get Humans -returns alive humans number-
fnGetHumans() {
	static iHumans, id
	iHumans = 0
	for (id = 1; id <= g_maxplayers; id++) {
		if (g_isalive[id] && !g_zombie[id])
			iHumans++
	}
	return iHumans;
}

// Get Alive -returns alive players number-
fnGetAlive() {
	static iAlive, id
	iAlive = 0
	for (id = 1; id <= g_maxplayers; id++) {
		if (g_isalive[id])
			iAlive++
	}
	return iAlive;
}

// Get Random Alive -returns index of alive player number n -
fnGetRandomAlive(n) {
	static iAlive, id
	iAlive = 0
	for (id = 1; id <= g_maxplayers; id++) {
		if (g_isalive[id])
			iAlive++
		
		if (iAlive == n)
			return id;
	}
	return -1;
}

// Get Playing -returns number of users playing-
fnGetPlaying() {
	static iPlaying, id, team
	iPlaying = 0
	for (id = 1; id <= g_maxplayers; id++) {
		if (g_isconnected[id]) {
			team = fm_cs_get_user_team(id)
			if (team != FM_CS_TEAM_SPECTATOR && team != FM_CS_TEAM_UNASSIGNED)
				iPlaying++
		}
	}
	return iPlaying;
}

// Get CTs -returns number of CTs connected-
fnGetCTs() {
	static iCTs, id
	iCTs = 0
	for (id = 1; id <= g_maxplayers; id++) {
		if (g_isconnected[id]) {			
			if (fm_cs_get_user_team(id) == FM_CS_TEAM_CT)
				iCTs++
		}
	}
	return iCTs;
}

// Get Ts -returns number of Ts connected-
fnGetTs() {
	static iTs, id
	iTs = 0
	for (id = 1; id <= g_maxplayers; id++) {
		if (g_isconnected[id]) {			
			if (fm_cs_get_user_team(id) == FM_CS_TEAM_T)
				iTs++
		}
	}
	return iTs;
}

// Last Zombie Check -check for last zombie and set its flag-
fnCheckLastZombie() {
	static id;
	new zombies = fnGetZombies();
	new humans = fnGetHumans();
	if(zombies > 1 && humans > 1) for (id = 1; id <= g_maxplayers; id++) {
		g_lastzombie[id] = false;
		g_lasthuman[id] = false;
	} else {
		if (zombies == 1) for (id = 1; id <= g_maxplayers; id++) {
			// Last zombie
			if (g_isalive[id] && g_zombie[id]) {
				if (!g_lastzombie[id]) {
					// Last zombie forward
					ExecuteForward(g_fwUserLastZombie, g_fwDummyResult, id);
				}
				g_lastzombie[id] = true
			}
			else g_lastzombie[id] = false
		} else if (zombies > 1) for (id = 1; id <= g_maxplayers; id++) {
			g_lastzombie[id] = false;
		}
		if(humans == 1) for (id = 1; id <= g_maxplayers; id++) {
			// Last human
			if (g_isalive[id] && !g_zombie[id]) {
				if (!g_lasthuman[id]) {
					// Last human forward
					ExecuteForward(g_fwUserLastHuman, g_fwDummyResult, id);
					
					// Reward extra hp
					fm_set_user_health(id, pev(id, pev_health) + get_pcvar_num(cvar_humanlasthp))
				}
				g_lasthuman[id] = true
			}
			else g_lasthuman[id] = false
		} else if (humans > 1) for (id = 1; id <= g_maxplayers; id++) {
			g_lasthuman[id] = false;
		}
	}
}

// Save player's stats to database
save_stats(id) {
	new ip[32]
	get_user_ip(id, ip, charsmax(ip))
	TrieSetCell(gSavedAmmo, ip, g_ammopacks[id])
	TrieSetCell(gSavedSouls, ip, g_souls[id])
}

// Load player's stats from database (if a record is found)
load_stats(id) {
	new ip[32]
	get_user_ip(id, ip, charsmax(ip))
	if(TrieKeyExists(gSavedAmmo, ip))
		TrieGetCell(gSavedAmmo, ip, g_ammopacks[id])
	if(TrieKeyExists(gSavedSouls, ip))
		TrieGetCell(gSavedSouls, ip, g_souls[id])
}

// Checks if a player is allowed to be zombie
allowed_zombie(id) {
	if (g_zombie[id] || g_endround || !g_isalive[id])
		return false;
	
	return true;
}

// Checks if a player is allowed to be human
allowed_human(id) {
	if (!g_zombie[id] || g_endround || !g_isalive[id] || (!g_newround && g_zombie[id] && fnGetZombies() == 1))
		return false;
	
	return true;
}

// Checks if a player is allowed to respawn
allowed_respawn(id) {
	static team
	team = fm_cs_get_user_team(id)
	
	if (g_endround || team == FM_CS_TEAM_SPECTATOR || team == FM_CS_TEAM_UNASSIGNED || g_isalive[id])
		return false;
	
	return true;
}

// Checks if multi infection mode is allowed
allowed_multi() {
	if (g_endround || !g_newround || floatround(fnGetAlive()*get_pcvar_float(cvar_multiratio), floatround_ceil) < 2 || floatround(fnGetAlive()*get_pcvar_float(cvar_multiratio), floatround_ceil) >= fnGetAlive())
		return false;
	
	return true;
}

// Admin Command. zp_zombie
command_zombie(id, player) {
	switch (get_pcvar_num(cvar_showactivity)) {
		case 1: client_print(0, print_chat, "ADMIN - %s %L", g_playername[player], LANG_PLAYER, "CMD_INFECT")
		case 2: client_print(0, print_chat, "ADMIN %s - %s %L", g_playername[id], g_playername[player], LANG_PLAYER, "CMD_INFECT")
	}
	if (get_pcvar_num(cvar_logcommands)) {
		static logdata[100], authid[32], ip[16]
		get_user_authid(id, authid, charsmax(authid))
		get_user_ip(id, ip, charsmax(ip), 1)
		formatex(logdata, charsmax(logdata), "ADMIN %s <%s><%s> - %s %L (Players: %d/%d)", g_playername[id], authid, ip, g_playername[player], LANG_SERVER, "CMD_INFECT", fnGetPlaying(), g_maxplayers)
		log_to_file("zombienightmare.log", logdata)
	}
	if (g_newround) {
		remove_task(TASK_MAKEZOMBIE)
		make_a_zombie(MODE_INFECTION, player)
	}
	else zombieme(player, 0, 0, 0, 1)
}

// Admin Command. zp_human
command_human(id, player) {
	switch (get_pcvar_num(cvar_showactivity)) {
		case 1: client_print(0, print_chat, "ADMIN - %s %L", g_playername[player], LANG_PLAYER, "CMD_DISINFECT")
		case 2: client_print(0, print_chat, "ADMIN %s - %s %L", g_playername[id], g_playername[player], LANG_PLAYER, "CMD_DISINFECT")
	}
	if (get_pcvar_num(cvar_logcommands)) {
		static logdata[100], authid[32], ip[16]
		get_user_authid(id, authid, charsmax(authid))
		get_user_ip(id, ip, charsmax(ip), 1)
		formatex(logdata, charsmax(logdata), "ADMIN %s <%s><%s> - %s %L (Players: %d/%d)", g_playername[id], authid, ip, g_playername[player], LANG_SERVER,"CMD_DISINFECT", fnGetPlaying(), g_maxplayers)
		log_to_file("zombienightmare.log", logdata)
	}
	humanme(player, 0)
}

// Admin Command. zp_respawn
command_respawn(id, player) {
	switch (get_pcvar_num(cvar_showactivity)) {
		case 1: client_print(0, print_chat, "ADMIN - %s %L", g_playername[player], LANG_PLAYER, "CMD_RESPAWN")
		case 2: client_print(0, print_chat, "ADMIN %s - %s %L", g_playername[id], g_playername[player], LANG_PLAYER, "CMD_RESPAWN")
	}
	if (get_pcvar_num(cvar_logcommands)) {
		static logdata[100], authid[32], ip[16]
		get_user_authid(id, authid, charsmax(authid))
		get_user_ip(id, ip, charsmax(ip), 1)
		formatex(logdata, charsmax(logdata), "ADMIN %s <%s><%s> - %s %L (Players: %d/%d)", g_playername[id], authid, ip, g_playername[player], LANG_SERVER, "CMD_RESPAWN", fnGetPlaying(), g_maxplayers)
		log_to_file("zombienightmare.log", logdata)
	}
	if (get_pcvar_num(cvar_deathmatch) == 2 || (get_pcvar_num(cvar_deathmatch) == 3 && random_num(0, 1)) || (get_pcvar_num(cvar_deathmatch) == 4 && fnGetZombies() < fnGetAlive()/2) || get_pcvar_num(cvar_deathmatch) == 5)
		g_respawn_as_zombie[player] = true
	
	respawn_player_manually(player);
}

// Admin Command. zp_multi
command_multi(id) {
	switch (get_pcvar_num(cvar_showactivity)) {
		case 1: client_print(0, print_chat, "ADMIN - %L", LANG_PLAYER, "CMD_MULTI")
		case 2: client_print(0, print_chat, "ADMIN %s - %L", g_playername[id], LANG_PLAYER, "CMD_MULTI")
	}
	if (get_pcvar_num(cvar_logcommands)) {
		static logdata[100], authid[32], ip[16]
		get_user_authid(id, authid, charsmax(authid))
		get_user_ip(id, ip, charsmax(ip), 1)
		formatex(logdata, charsmax(logdata), "ADMIN %s <%s><%s> - %L (Players: %d/%d)", g_playername[id], authid, ip, LANG_SERVER,"CMD_MULTI", fnGetPlaying(), g_maxplayers)
		log_to_file("zombienightmare.log", logdata)
	}
	remove_task(TASK_MAKEZOMBIE)
	make_a_zombie(MODE_MULTI, 0)
}

// Set proper maxspeed for player
set_player_maxspeed(id)
{
	// If frozen, prevent from moving
	if (g_frozen[id])
	{
		set_pev(id, pev_maxspeed, 1.0)
	}
	// Otherwise, set maxspeed directly
	else
	{
		if (g_zombie[id])
		{
			set_pev(id, pev_maxspeed, g_zombie_spd[id])
		}
		else
		{
			set_pev(id, pev_maxspeed, get_pcvar_float(cvar_humanspd))
		}
	}
}

/*================================================================================
 [Custom Natives]
=================================================================================*/

public native_set_ammo_value(id, iValue)
	g_iCurrentAmmoValue[id] = iValue

public native_set_ammo_cost(id, iValue)
	g_iCurrentAmmoCost[id] = iValue

public native_set_ammo_max(id, iValue)
	g_iCurrentAmmoMax[id] = iValue

public native_get_user_vip(id)
{
	if(!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return get_user_flags(id) & g_access_flag[ACCESS_VIP];
}

// Native: zp_get_user_zombie
public native_get_user_zombie(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return g_zombie[id];
}

// Native: zn_get_user_class
public native_get_user_class(id, name[], len)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id);
		return formatex(name, len, "ERROR");
	}
	param_convert(2);
	if (!g_zombie[id])
		return formatex(name, len, "%L", id, "CLASS_HUMAN");
	
	return ArrayGetString(g_zclass_name, g_zombieclass[id], name, len)
}

// Native: zp_set_user_instainf
public native_set_user_instainf(id, ii)
{
	if(!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id);
		return false;
	}
	g_instantinfect[id] = ii;
	return true;
}

public native_set_user_knife_weaponkey(id, weaponkey)
{
	if(!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id);
		return false;
	}
	g_knife_weaponkey[id] = weaponkey;
	return true;
}

public native_get_user_first_zombie(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return g_firstzombie[id];
}

// Native: zp_get_user_last_zombie
public native_get_user_last_zombie(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return g_lastzombie[id];
}

// Native: zp_get_user_last_human
public native_get_user_last_human(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return g_lasthuman[id];
}

// Native: zp_get_user_zombie_class
public native_get_user_zombie_class(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return g_zombieclass[id];
}

// Native: zp_get_user_next_class
public native_get_user_next_class(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return g_zombieclassnext[id];
}

// Native: zp_set_user_zombie_class
public native_set_user_zombie_class(id, classid)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	if (classid < 0 || classid >= g_zclass_i)
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid zombie class id (%d)", ZP_PREFIX, classid)
		return false;
	}
	
	g_zombieclassnext[id] = classid
	return true;
}

// Native: zn_get_user_zclass_access
public native_get_user_zclass_access(id, classid)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	if (classid < 0 || classid >= g_zclass_i)
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid zombie class id (%d)", ZP_PREFIX, classid)
		return false;
	}
	
	if(g_hasclass[id][classid] || (ArrayGetCell(g_zclass_cost1, classid) == 0 && ArrayGetCell(g_zclass_cost2, classid) == 0))
		return true;
	
	return false;
}

// Native: zn_set_user_zclass_access
public native_set_user_zclass_access(id, classid, bool:hasaccess)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	if (classid < 0 || classid >= g_zclass_i)
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid zombie class id (%d)", ZP_PREFIX, classid)
		return false;
	}
	
	g_hasclass[id][classid] = hasaccess
	
	return true;
}

// Native: zp_get_user_souls
public native_get_user_souls(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return g_souls[id];
}

// Native: zp_set_user_souls
public native_set_user_souls(id, amount)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	set_souls(id, amount)
	return true;
}

// Native: zp_get_user_ammo_packs
public native_get_user_ammo_packs(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return g_ammopacks[id];
}

// Native: zp_set_user_ammo_packs
public native_set_user_ammo_packs(id, amount)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	set_ammo(id, amount)
	return true;
}

// Native: zp_get_zombie_maxhealth
public native_get_zombie_maxhealth(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	if (!g_zombie[id])
	{
		log_error(AMX_ERR_NATIVE, "[%s] Player not a zombie (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	if (g_firstzombie[id])
		return floatround(float(ArrayGetCell(g_zclass_hp, g_zombieclass[id])) * get_pcvar_float(cvar_zombiefirsthp));
	
	return ArrayGetCell(g_zclass_hp, g_zombieclass[id]);
}

// Native: zp_get_user_batteries
public native_get_user_batteries(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return g_flashbattery[id];
}

// Native: zp_set_user_batteries
public native_set_user_batteries(id, value)
{
	if (!is_user_valid_connected(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	g_flashbattery[id] = clamp(value, 0, 100);
	
	if (g_cached_customflash)
	{
		// Set the flashlight charge task to update battery status
		remove_task(id+TASK_CHARGE)
		set_task(1.0, "flashlight_charge", id+TASK_CHARGE, _, _, "b")
	}
	return true;
}

// Native: zp_get_user_nightvision
public native_get_user_nightvision(id)
{
	if (!is_user_valid(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return -1;
	}
	
	return g_nvision[id];
}

// Native: zp_set_user_nightvision
public native_set_user_nightvision(id, set)
{
	if (!is_user_valid_connected(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	if (set)
	{
		g_nvision[id] = true
		
		if (!g_isbot[id])
		{
			g_nvisionenabled[id] = true
			Nvg(id)
		}
		else
			cs_set_user_nvg(id, 1)
	}
	else
	{
		// Remove CS nightvision if player owns one (bugfix)
		cs_set_user_nvg(id, 0)
		g_nvision[id] = false
		g_nvisionenabled[id] = false
		// Fix NVG
		message_begin(MSG_ONE, g_msgScreenFade, _, id)
		write_short(0)
		write_short(0)
		write_short(0x0000)
		write_byte(100)
		write_byte(100)
		write_byte(100)
		write_byte(255)
		message_end()
	}
	return true;
}

// Native: zp_infect_user
public native_infect_user(id, infector, silent, rewards)
{
	if (!is_user_valid_alive(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	// Not allowed to be zombie
	if (!allowed_zombie(id))
		return false;
	
	if(g_currentmode >= MODE_CUSTOM && !g_modestarted)
	{
		zombieme(id, 0, (silent == 1) ? 1 : 0, (rewards == 1) ? 1 : 0, 1)
	}
	else if (g_newround)
	{
		// Set as first zombie
		remove_task(TASK_MAKEZOMBIE)
		make_a_zombie(MODE_INFECTION, id)
	}
	else
	{
		// Just infect (plus some checks)
		zombieme(id, is_user_valid_alive(infector) ? infector : 0, (silent == 1) ? 1 : 0, (rewards == 1) ? 1 : 0, 1)
	}
	return true;
}

// Native: zp_disinfect_user
public native_disinfect_user(id, silent)
{
	if (!is_user_valid_alive(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	// Not allowed to be human
	if (!allowed_human(id))
		return false;
	
	// Turn to human
	humanme(id, (silent == 1) ? 1 : 0)
	return true;
}

// Native: zp_respawn_user
public native_respawn_user(id, team)
{
	if (!is_user_valid_connected(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	// Respawn not allowed
	if (!allowed_respawn(id))
		return false;
	
	// Respawn as zombie?
	g_respawn_as_zombie[id] = (team == ZP_TEAM_ZOMBIE) ? true : false
	
	// Respawnish!
	respawn_player_manually(id)
	return true;
}

// Native: zp_force_buy_extra_item
public native_force_buy_extra_item(id, itemid, ignorecost)
{
	if (!is_user_valid_alive(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	if (itemid < 0 || itemid >= g_extraitem_i)
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid extra item id (%d)", ZP_PREFIX, itemid)
		return false;
	}
	
	buy_extra_item(id, itemid, ignorecost)
	return true;
}

// Native: zp_override_user_model
public native_override_user_model(id, const newmodel[], modelindex)
{
	if (!is_user_valid_connected(id))
	{
		log_error(AMX_ERR_NATIVE, "[%s] Invalid Player (%d)", ZP_PREFIX, id)
		return false;
	}
	
	// Strings passed byref
	param_convert(2)
	
	// Remove previous tasks
	remove_task(id+TASK_MODEL)
	
	// Custom models stuff
	static currentmodel[32]
	
	if (g_handle_models_on_separate_ent)
	{
		// Set the right model
		copy(g_playermodel[id], charsmax(g_playermodel[]), newmodel)
		if (g_set_modelindex_offset && modelindex) fm_cs_set_user_model_index(id, modelindex)
		
		// Set model on player model entity
		fm_set_playermodel_ent(id)
	}
	else
	{
		// Get current model for comparing it with the current one
		fm_cs_get_user_model(id, currentmodel, charsmax(currentmodel))
		
		// Set the right model, after checking that we don't already have it
		if (!equal(currentmodel, newmodel))
		{
			copy(g_playermodel[id], charsmax(g_playermodel[]), newmodel)
			if (g_set_modelindex_offset && modelindex) fm_cs_set_user_model_index(id, modelindex)
			
			// An additional delay is offset at round start
			// since SVC_BAD is more likely to be triggered there
			if (g_newround)
				set_task(5.0 * g_modelchange_delay, "fm_user_model_update", id+TASK_MODEL)
			else
				fm_user_model_update(id+TASK_MODEL)
		}
	}
	return true;
}

// Native: zp_has_round_started
public native_has_round_started()
{
	if (g_newround) return 0; // not started
	if (g_modestarted) return 1; // started
	return 2; // starting
}

// Native: zp_get_zombie_count
public native_get_zombie_count()
{
	return fnGetZombies();
}

// Native: zp_get_human_count
public native_get_human_count()
{
	return fnGetHumans();
}

// Native: zp_register_extra_item
public native_register_extra_item(const name[], cost, team)
{
	// Strings passed byref
	param_convert(1)
	
	// Arrays not yet initialized
	if (!g_arrays_created)
	{
		log_error(AMX_ERR_NATIVE, "[%s] Can't register extra item yet (%s)", ZP_PREFIX, name)
		return -1;
	}
	
	if (strlen(name) < 1)
	{
		log_error(AMX_ERR_NATIVE, "[%s] Can't register extra item with an empty name", ZP_PREFIX)
		return -1;
	}
	
	new index, extraitem_name[64]
	for (index = 0; index < g_extraitem_i; index++)
	{
		ArrayGetString(g_extraitem_name, index, extraitem_name, charsmax(extraitem_name))
		if (equali(name, extraitem_name))
		{
			log_error(AMX_ERR_NATIVE, "[%s] Extra item already registered (%s)", ZP_PREFIX, name)
			return -1;
		}
	}
	
	// For backwards compatibility
	if (team == ZP_TEAM_ANY)
		team = (ZP_TEAM_ZOMBIE|ZP_TEAM_HUMAN)
	
	// Add the item
	ArrayPushString(g_extraitem_name, name)
	ArrayPushCell(g_extraitem_cost, cost)
	ArrayPushCell(g_extraitem_team, team)
	
	// Increase registered items counter
	g_extraitem_i++
	
	// Return id under which we registered the item
	return g_extraitem_i-1;
}

// Function: zp_register_extra_item (to be used within this plugin only)
native_register_extra_item2(const name[], cost, team)
{
	// Add the item
	ArrayPushString(g_extraitem_name, name)
	ArrayPushCell(g_extraitem_cost, cost)
	ArrayPushCell(g_extraitem_team, team)
	
	// Increase registered items counter
	g_extraitem_i++
}

// Native: zn_register_gamemode
public native_register_gamemode(const name[], const lighting[])
{
	// Strings passed byref
	param_convert(1)
	param_convert(2)
	
	// Arrays not yet initialized
	if (!g_arrays_created)
	{
		log_error(AMX_ERR_NATIVE, "[%s] Can't register gamemode yet (%s)", ZP_PREFIX, name)
		return -1;
	}
	
	// No gamemode title
	if (strlen(name) < 1)
	{
		log_error(AMX_ERR_NATIVE, "[%s] Can't register gamemode with an empty name", ZP_PREFIX)
		return -1;
	}
	
	new index, gamemode_name[32]
	for (index = 0; index < g_gamemode_i; index++)
	{
		ArrayGetString(g_gamemode_name, index, gamemode_name, charsmax(gamemode_name))
		if (equali(name, gamemode_name))
		{
			log_error(AMX_ERR_NATIVE, "[%s] Gamemode already registered (%s)", ZP_PREFIX, name)
			return -1;
		}
	}
	
	// Add the gamemode
	ArrayPushString(g_gamemode_name, name)
	ArrayPushString(g_gamemode_lighting, lighting)
	
	// Increase registered gamemodes counter
	g_gamemode_i++
	
	// Return id under which we registered the gamemode
	return g_gamemode_i+MODE_CUSTOM-1;
}

// Native: zn_register_zombie_class
public native_register_zombie_class(const name[], const model[], const clawmodel[], hp, speed, Float:gravity, Float:knockback, bool:vip, costAmmo, costSouls)
{
	// Strings passed byref
	param_convert(1)
	param_convert(2)
	param_convert(3)
	
	// Arrays not yet initialized
	if (!g_arrays_created)
	{
		log_error(AMX_ERR_NATIVE, "[%s] Can't register zombie class yet (%s)", ZP_PREFIX, name)
		return -1;
	}
	
	if (strlen(name) < 1)
	{
		log_error(AMX_ERR_NATIVE, "[%s] Can't register zombie class with an empty name", ZP_PREFIX)
		return -1;
	}
	
	new index, zombieclass_name[32]
	for (index = 0; index < g_zclass_i; index++)
	{
		ArrayGetString(g_zclass_name, index, zombieclass_name, charsmax(zombieclass_name))
		if (equali(name, zombieclass_name))
		{
			log_error(AMX_ERR_NATIVE, "[%s] Zombie class already registered (%s)", ZP_PREFIX, name)
			return -1;
		}
	}
	
	// Add the class
	ArrayPushString(g_zclass_name, name)
	
	// Using same zombie models for all classes?
	if (g_same_models_for_all)
	{
		ArrayPushCell(g_zclass_modelsstart, 0)
		ArrayPushCell(g_zclass_modelsend, ArraySize(g_zclass_playermodel))
	}
	else
	{
		ArrayPushCell(g_zclass_modelsstart, ArraySize(g_zclass_playermodel))
		ArrayPushString(g_zclass_playermodel, model)
		ArrayPushCell(g_zclass_modelsend, ArraySize(g_zclass_playermodel))
		ArrayPushCell(g_zclass_modelindex, -1)
	}
	
	ArrayPushString(g_zclass_clawmodel, clawmodel)
	ArrayPushCell(g_zclass_hp, hp)
	ArrayPushCell(g_zclass_spd, speed)
	ArrayPushCell(g_zclass_grav, gravity)
	ArrayPushCell(g_zclass_kb, knockback)
	ArrayPushCell(g_zclass_vip, vip)
	ArrayPushCell(g_zclass_cost1, costAmmo)
	ArrayPushCell(g_zclass_cost2, costSouls)
	
	new prec_mdl[100]
	// If not using same models for all classes
	if (!g_same_models_for_all)
	{
		// Precache default class model and replace modelindex with the real one
		formatex(prec_mdl, charsmax(prec_mdl), "models/player/%s/%s.mdl", model, model)
		ArraySetCell(g_zclass_modelindex, ArrayGetCell(g_zclass_modelsstart, g_zclass_i), engfunc(EngFunc_PrecacheModel, prec_mdl))
		if (g_force_consistency == 1) force_unmodified(force_model_samebounds, {0,0,0}, {0,0,0}, prec_mdl)
		if (g_force_consistency == 2) force_unmodified(force_exactfile, {0,0,0}, {0,0,0}, prec_mdl)
		// Precache modelT.mdl files too
		copy(prec_mdl[strlen(prec_mdl)-4], charsmax(prec_mdl) - (strlen(prec_mdl)-4), "T.mdl")
		if (file_exists(prec_mdl)) engfunc(EngFunc_PrecacheModel, prec_mdl)
	}
	
	// Precache default clawmodel
	formatex(prec_mdl, charsmax(prec_mdl), "models/zn/%s", clawmodel)
	engfunc(EngFunc_PrecacheModel, prec_mdl)
	
	// Increase registered classes counter
	g_zclass_i++
	
	// Return id under which we registered the class
	return g_zclass_i-1;
}

// Native: zp_get_extra_item_id
public native_get_extra_item_id(const name[])
{
	// Strings passed byref
	param_convert(1)
	
	// Loop through every item (not using Tries since ZP should work on AMXX 1.8.0)
	static i, item_name[64]
	for (i = 0; i < g_extraitem_i; i++)
	{
		ArrayGetString(g_extraitem_name, i, item_name, charsmax(item_name))
		
		// Check if this is the item to retrieve
		if (equali(name, item_name))
			return i;
	}
	
	return -1;
}

// Native: zp_get_zombie_class_id
public native_get_zombie_class_id(const name[])
{
	// Strings passed byref
	param_convert(1)
	
	// Loop through every class (not using Tries since ZP should work on AMXX 1.8.0)
	static i, class_name[32]
	for (i = 0; i < g_zclass_i; i++)
	{
		ArrayGetString(g_zclass_name, i, class_name, charsmax(class_name))
		
		// Check if this is the class to retrieve
		if (equali(name, class_name))
			return i;
	}
	
	return -1;
}

public native_get_prefix(name[], len) {
	param_convert(1)
	return formatex(name, len, "%s", ZP_PREFIX)
}

/*================================================================================
 [Custom Messages]
=================================================================================*/

// Ammopacks
set_ammo(id, amount)
{
	if(amount < 0) g_ammopacks[id] = 0
	else if(get_user_flags(id) & g_access_flag[ACCESS_VIP] && amount <= ZP_MAX_AMMO_VIP) g_ammopacks[id] = amount
	else if(amount <= ZP_MAX_AMMO) g_ammopacks[id] = amount
	else if(get_user_flags(id) & g_access_flag[ACCESS_VIP]) g_ammopacks[id] = ZP_MAX_AMMO_VIP
	else g_ammopacks[id] = ZP_MAX_AMMO
}

// Souls
set_souls(id, amount)
{
	if(amount < 0) g_souls[id] = 0
	else if(get_user_flags(id) & g_access_flag[ACCESS_VIP] && amount <= ZP_MAX_SOULS_VIP) g_souls[id] = amount
	else if(amount <= ZP_MAX_SOULS) g_souls[id] = amount
	else if(get_user_flags(id) & g_access_flag[ACCESS_VIP]) g_souls[id] = ZP_MAX_SOULS_VIP
	else g_souls[id] = ZP_MAX_SOULS
}

// Custom Flashlight
public set_user_flashlight(taskid)
{
	// Get player and aiming origins
	static Float:originF[3], Float:destoriginF[3]
	pev(ID_FLASH, pev_origin, originF)
	fm_get_aim_origin(ID_FLASH, destoriginF)
	
	// Max distance check
	if (get_distance_f(originF, destoriginF) > get_pcvar_float(cvar_flashdist))
		return;
	
	// Send to all players?
	if (get_pcvar_num(cvar_flashshowall))
		engfunc(EngFunc_MessageBegin, MSG_PVS, SVC_TEMPENTITY, destoriginF, 0)
	else
		message_begin(MSG_ONE_UNRELIABLE, SVC_TEMPENTITY, _, ID_FLASH)
	
	// Flashlight
	write_byte(TE_DLIGHT) // TE id
	engfunc(EngFunc_WriteCoord, destoriginF[0]) // x
	engfunc(EngFunc_WriteCoord, destoriginF[1]) // y
	engfunc(EngFunc_WriteCoord, destoriginF[2]) // z
	write_byte(get_pcvar_num(cvar_flashsize)) // radius
	write_byte(get_pcvar_num(cvar_flashcolor[0])) // r
	write_byte(get_pcvar_num(cvar_flashcolor[1])) // g
	write_byte(get_pcvar_num(cvar_flashcolor[2])) // b
	write_byte(3) // life
	write_byte(0) // decay rate
	message_end()
}

// Infection special effects
infection_effects(id)
{
	// Screen fade? (unless frozen)
	if (!g_frozen[id] && get_pcvar_num(cvar_infectionscreenfade))
	{
		message_begin(MSG_ONE_UNRELIABLE, g_msgScreenFade, _, id)
		write_short(UNIT_SECOND) // duration
		write_short(0) // hold time
		write_short(FFADE_IN) // fade type
		write_byte(ZP_NVG_ZOMBIE_R) // r
		write_byte(ZP_NVG_ZOMBIE_G) // g
		write_byte(ZP_NVG_ZOMBIE_B) // b
		write_byte (255) // alpha
		message_end()
	}
	
	// Screen shake?
	if (get_pcvar_num(cvar_infectionscreenshake))
	{
		message_begin(MSG_ONE_UNRELIABLE, g_msgScreenShake, _, id)
		write_short(UNIT_SECOND*4) // amplitude
		write_short(UNIT_SECOND*2) // duration
		write_short(UNIT_SECOND*10) // frequency
		message_end()
	}
	
	// Infection icon?
	if (get_pcvar_num(cvar_hudicons))
	{
		message_begin(MSG_ONE_UNRELIABLE, g_msgDamage, _, id)
		write_byte(0) // damage save
		write_byte(0) // damage take
		write_long(DMG_NERVEGAS) // damage type - DMG_RADIATION
		write_coord(0) // x
		write_coord(0) // y
		write_coord(0) // z
		message_end()
	}
	
	// Get player's origin
	static origin[3]
	get_user_origin(id, origin)
	
	// Tracers?
	if (get_pcvar_num(cvar_infectiontracers))
	{
		message_begin(MSG_PVS, SVC_TEMPENTITY, origin)
		write_byte(TE_IMPLOSION) // TE id
		write_coord(origin[0]) // x
		write_coord(origin[1]) // y
		write_coord(origin[2]) // z
		write_byte(128) // radius
		write_byte(20) // count
		write_byte(3) // duration
		message_end()
	}
	
	// Particle burst?
	if (get_pcvar_num(cvar_infectionparticles))
	{
		message_begin(MSG_PVS, SVC_TEMPENTITY, origin)
		write_byte(TE_PARTICLEBURST) // TE id
		write_coord(origin[0]) // x
		write_coord(origin[1]) // y
		write_coord(origin[2]) // z
		write_short(50) // radius
		write_byte(70) // color
		write_byte(3) // duration (will be randomized a bit)
		message_end()
	}
	
	// Light sparkle?
	if (get_pcvar_num(cvar_infectionsparkle))
	{
		message_begin(MSG_PVS, SVC_TEMPENTITY, origin)
		write_byte(TE_DLIGHT) // TE id
		write_coord(origin[0]) // x
		write_coord(origin[1]) // y
		write_coord(origin[2]) // z
		write_byte(20) // radius
		write_byte(ZP_NVG_ZOMBIE_R) // r
		write_byte(ZP_NVG_ZOMBIE_G) // g
		write_byte(ZP_NVG_ZOMBIE_B) // b
		write_byte(2) // life
		write_byte(0) // decay rate
		message_end()
	}
}

// Make zombies leave footsteps and bloodstains on the floor
public make_blood(taskid)
{
	// Only bleed when moving on ground
	if (!(pev(ID_BLOOD, pev_flags) & FL_ONGROUND) || fm_get_speed(ID_BLOOD) < 80)
		return;
	
	// Get user origin
	static Float:originF[3]
	pev(ID_BLOOD, pev_origin, originF)
	
	// If ducking set a little lower
	if (pev(ID_BLOOD, pev_bInDuck))
		originF[2] -= 18.0
	else
		originF[2] -= 36.0
	
	// Send the decal message
	engfunc(EngFunc_MessageBegin, MSG_PAS, SVC_TEMPENTITY, originF, 0)
	write_byte(TE_WORLDDECAL) // TE id
	engfunc(EngFunc_WriteCoord, originF[0]) // x
	engfunc(EngFunc_WriteCoord, originF[1]) // y
	engfunc(EngFunc_WriteCoord, originF[2]) // z
	write_byte(ArrayGetCell(zombie_decals, random_num(0, ArraySize(zombie_decals) - 1)) + (g_czero * 12)) // random decal number (offsets +12 for CZ)
	message_end()
}

// Burning Flames
public burning_flame(taskid)
{
	// Get player origin and flags
	static origin[3], flags
	get_user_origin(ID_BURN, origin)
	flags = pev(ID_BURN, pev_flags)
	
	// In water - burning stopped
	if ((flags & FL_INWATER) || g_burning_duration[ID_BURN] < 1)
	{
		// Smoke sprite
		message_begin(MSG_PVS, SVC_TEMPENTITY, origin)
		write_byte(TE_SMOKE) // TE id
		write_coord(origin[0]) // x
		write_coord(origin[1]) // y
		write_coord(origin[2]-50) // z
		write_short(g_smokeSpr) // sprite
		write_byte(random_num(15, 20)) // scale
		write_byte(random_num(10, 20)) // framerate
		message_end()
		
		// Task not needed anymore
		remove_task(taskid);
		return;
	}
	
	// Randomly play burning zombie scream sounds
	if (!random_num(0, 20))
	{
		static sound[64]
		ArrayGetString(grenade_fire_player, random_num(0, ArraySize(grenade_fire_player) - 1), sound, charsmax(sound))
		emit_sound(ID_BURN, CHAN_VOICE, sound, 1.0, ATTN_NORM, 0, PITCH_NORM)
	}
	
	// Fire slow down
	if (flags & FL_ONGROUND && get_pcvar_float(cvar_fireslowdown) > 0.0)
	{
		static Float:velocity[3]
		pev(ID_BURN, pev_velocity, velocity)
		xs_vec_mul_scalar(velocity, get_pcvar_float(cvar_fireslowdown), velocity)
		set_pev(ID_BURN, pev_velocity, velocity)
	}
	
	// Get player's health
	static health
	health = pev(ID_BURN, pev_health)
	
	// Take damage from the fire
	if (health - floatround(get_pcvar_float(cvar_firedamage), floatround_ceil) > 0)
		fm_set_user_health(ID_BURN, health - floatround(get_pcvar_float(cvar_firedamage), floatround_ceil))
	
	// Flame sprite
	message_begin(MSG_PVS, SVC_TEMPENTITY, origin)
	write_byte(TE_SPRITE) // TE id
	write_coord(origin[0]+random_num(-5, 5)) // x
	write_coord(origin[1]+random_num(-5, 5)) // y
	write_coord(origin[2]+random_num(-10, 10)) // z
	write_short(g_flameSpr) // sprite
	write_byte(random_num(5, 10)) // scale
	write_byte(200) // brightness
	message_end()
	
	// Decrease burning duration counter
	g_burning_duration[ID_BURN]--
}

// Infection Bomb: Green Blast
create_blast(const Float:originF[3]) {
	// Smallest ring
	engfunc(EngFunc_MessageBegin, MSG_PVS, SVC_TEMPENTITY, originF, 0)
	write_byte(TE_BEAMCYLINDER) // TE id
	engfunc(EngFunc_WriteCoord, originF[0]) // x
	engfunc(EngFunc_WriteCoord, originF[1]) // y
	engfunc(EngFunc_WriteCoord, originF[2]) // z
	engfunc(EngFunc_WriteCoord, originF[0]) // x axis
	engfunc(EngFunc_WriteCoord, originF[1]) // y axis
	engfunc(EngFunc_WriteCoord, originF[2]+385.0) // z axis
	write_short(g_exploSpr) // sprite
	write_byte(0) // startframe
	write_byte(0) // framerate
	write_byte(4) // life
	write_byte(60) // width
	write_byte(0) // noise
	write_byte(80) // red
	write_byte(200) // green
	write_byte(80) // blue
	write_byte(150) // brightness
	write_byte(0) // speed
	message_end()
	
	// Medium ring
	engfunc(EngFunc_MessageBegin, MSG_PVS, SVC_TEMPENTITY, originF, 0)
	write_byte(TE_BEAMCYLINDER) // TE id
	engfunc(EngFunc_WriteCoord, originF[0]) // x
	engfunc(EngFunc_WriteCoord, originF[1]) // y
	engfunc(EngFunc_WriteCoord, originF[2]) // z
	engfunc(EngFunc_WriteCoord, originF[0]) // x axis
	engfunc(EngFunc_WriteCoord, originF[1]) // y axis
	engfunc(EngFunc_WriteCoord, originF[2]+470.0) // z axis
	write_short(g_exploSpr) // sprite
	write_byte(0) // startframe
	write_byte(0) // framerate
	write_byte(4) // life
	write_byte(60) // width
	write_byte(0) // noise
	write_byte(80) // red
	write_byte(200) // green
	write_byte(80) // blue
	write_byte(150) // brightness
	write_byte(0) // speed
	message_end()
	
	// Largest ring
	engfunc(EngFunc_MessageBegin, MSG_PVS, SVC_TEMPENTITY, originF, 0)
	write_byte(TE_BEAMCYLINDER) // TE id
	engfunc(EngFunc_WriteCoord, originF[0]) // x
	engfunc(EngFunc_WriteCoord, originF[1]) // y
	engfunc(EngFunc_WriteCoord, originF[2]) // z
	engfunc(EngFunc_WriteCoord, originF[0]) // x axis
	engfunc(EngFunc_WriteCoord, originF[1]) // y axis
	engfunc(EngFunc_WriteCoord, originF[2]+555.0) // z axis
	write_short(g_exploSpr) // sprite
	write_byte(0) // startframe
	write_byte(0) // framerate
	write_byte(4) // life
	write_byte(60) // width
	write_byte(0) // noise
	write_byte(80) // red
	write_byte(200) // green
	write_byte(80) // blue
	write_byte(150) // brightness
	write_byte(0) // speed
	message_end()
}

// Fire Grenade: Fire Blast
create_blast2(const Float:originF[3]) {
	// Smallest ring
	engfunc(EngFunc_MessageBegin, MSG_PVS, SVC_TEMPENTITY, originF, 0)
	write_byte(TE_BEAMCYLINDER) // TE id
	engfunc(EngFunc_WriteCoord, originF[0]) // x
	engfunc(EngFunc_WriteCoord, originF[1]) // y
	engfunc(EngFunc_WriteCoord, originF[2]) // z
	engfunc(EngFunc_WriteCoord, originF[0]) // x axis
	engfunc(EngFunc_WriteCoord, originF[1]) // y axis
	engfunc(EngFunc_WriteCoord, originF[2]+385.0) // z axis
	write_short(g_exploSpr) // sprite
	write_byte(0) // startframe
	write_byte(0) // framerate
	write_byte(4) // life
	write_byte(60) // width
	write_byte(0) // noise
	write_byte(200) // red
	write_byte(100) // green
	write_byte(0) // blue
	write_byte(200) // brightness
	write_byte(0) // speed
	message_end()
	
	// Medium ring
	engfunc(EngFunc_MessageBegin, MSG_PVS, SVC_TEMPENTITY, originF, 0)
	write_byte(TE_BEAMCYLINDER) // TE id
	engfunc(EngFunc_WriteCoord, originF[0]) // x
	engfunc(EngFunc_WriteCoord, originF[1]) // y
	engfunc(EngFunc_WriteCoord, originF[2]) // z
	engfunc(EngFunc_WriteCoord, originF[0]) // x axis
	engfunc(EngFunc_WriteCoord, originF[1]) // y axis
	engfunc(EngFunc_WriteCoord, originF[2]+470.0) // z axis
	write_short(g_exploSpr) // sprite
	write_byte(0) // startframe
	write_byte(0) // framerate
	write_byte(4) // life
	write_byte(60) // width
	write_byte(0) // noise
	write_byte(200) // red
	write_byte(50) // green
	write_byte(0) // blue
	write_byte(200) // brightness
	write_byte(0) // speed
	message_end()
	
	// Largest ring
	engfunc(EngFunc_MessageBegin, MSG_PVS, SVC_TEMPENTITY, originF, 0)
	write_byte(TE_BEAMCYLINDER) // TE id
	engfunc(EngFunc_WriteCoord, originF[0]) // x
	engfunc(EngFunc_WriteCoord, originF[1]) // y
	engfunc(EngFunc_WriteCoord, originF[2]) // z
	engfunc(EngFunc_WriteCoord, originF[0]) // x axis
	engfunc(EngFunc_WriteCoord, originF[1]) // y axis
	engfunc(EngFunc_WriteCoord, originF[2]+555.0) // z axis
	write_short(g_exploSpr) // sprite
	write_byte(0) // startframe
	write_byte(0) // framerate
	write_byte(4) // life
	write_byte(60) // width
	write_byte(0) // noise
	write_byte(200) // red
	write_byte(0) // green
	write_byte(0) // blue
	write_byte(200) // brightness
	write_byte(0) // speed
	message_end()
}

// Frost Grenade: Freeze Blast
create_blast3(const Float:originF[3]) {
	// Smallest ring
	engfunc(EngFunc_MessageBegin, MSG_PVS, SVC_TEMPENTITY, originF, 0)
	write_byte(TE_BEAMCYLINDER) // TE id
	engfunc(EngFunc_WriteCoord, originF[0]) // x
	engfunc(EngFunc_WriteCoord, originF[1]) // y
	engfunc(EngFunc_WriteCoord, originF[2]) // z
	engfunc(EngFunc_WriteCoord, originF[0]) // x axis
	engfunc(EngFunc_WriteCoord, originF[1]) // y axis
	engfunc(EngFunc_WriteCoord, originF[2]+385.0) // z axis
	write_short(g_exploSpr) // sprite
	write_byte(0) // startframe
	write_byte(0) // framerate
	write_byte(4) // life
	write_byte(60) // width
	write_byte(0) // noise
	write_byte(0) // red
	write_byte(100) // green
	write_byte(200) // blue
	write_byte(200) // brightness
	write_byte(0) // speed
	message_end()
	
	// Medium ring
	engfunc(EngFunc_MessageBegin, MSG_PVS, SVC_TEMPENTITY, originF, 0)
	write_byte(TE_BEAMCYLINDER) // TE id
	engfunc(EngFunc_WriteCoord, originF[0]) // x
	engfunc(EngFunc_WriteCoord, originF[1]) // y
	engfunc(EngFunc_WriteCoord, originF[2]) // z
	engfunc(EngFunc_WriteCoord, originF[0]) // x axis
	engfunc(EngFunc_WriteCoord, originF[1]) // y axis
	engfunc(EngFunc_WriteCoord, originF[2]+470.0) // z axis
	write_short(g_exploSpr) // sprite
	write_byte(0) // startframe
	write_byte(0) // framerate
	write_byte(4) // life
	write_byte(60) // width
	write_byte(0) // noise
	write_byte(0) // red
	write_byte(100) // green
	write_byte(200) // blue
	write_byte(200) // brightness
	write_byte(0) // speed
	message_end()
	
	// Largest ring
	engfunc(EngFunc_MessageBegin, MSG_PVS, SVC_TEMPENTITY, originF, 0)
	write_byte(TE_BEAMCYLINDER) // TE id
	engfunc(EngFunc_WriteCoord, originF[0]) // x
	engfunc(EngFunc_WriteCoord, originF[1]) // y
	engfunc(EngFunc_WriteCoord, originF[2]) // z
	engfunc(EngFunc_WriteCoord, originF[0]) // x axis
	engfunc(EngFunc_WriteCoord, originF[1]) // y axis
	engfunc(EngFunc_WriteCoord, originF[2]+555.0) // z axis
	write_short(g_exploSpr) // sprite
	write_byte(0) // startframe
	write_byte(0) // framerate
	write_byte(4) // life
	write_byte(60) // width
	write_byte(0) // noise
	write_byte(0) // red
	write_byte(100) // green
	write_byte(200) // blue
	write_byte(200) // brightness
	write_byte(0) // speed
	message_end()
}

// Fix Dead Attrib on scoreboard
FixDeadAttrib(id) {
	message_begin(MSG_BROADCAST, g_msgScoreAttrib)
	write_byte(id) // id
	write_byte(0) // attrib
	message_end()
}

// Send Death Message for infections
SendDeathMsg(attacker, victim) {
	message_begin(MSG_BROADCAST, g_msgDeathMsg)
	write_byte(attacker) // killer
	write_byte(victim) // victim
	write_byte(0) // headshot flag, disabled
	write_string("knife") // killer's weapon, return knife sprite
	message_end()
}

// Update Player Frags and Deaths
UpdateFrags(attacker, victim, frags, deaths, scoreboard) {
	// Set attacker frags
	set_pev(attacker, pev_frags, float(pev(attacker, pev_frags) + frags))
	
	// Set victim deaths
	fm_cs_set_user_deaths(victim, cs_get_user_deaths(victim) + deaths)
	
	// Update scoreboard with attacker and victim info
	if (scoreboard)
	{
		message_begin(MSG_BROADCAST, g_msgScoreInfo)
		write_byte(attacker) // id
		write_short(pev(attacker, pev_frags)) // frags
		write_short(cs_get_user_deaths(attacker)) // deaths
		write_short(0) // class?
		write_short(fm_cs_get_user_team(attacker)) // team
		message_end()
		
		message_begin(MSG_BROADCAST, g_msgScoreInfo)
		write_byte(victim) // id
		write_short(pev(victim, pev_frags)) // frags
		write_short(cs_get_user_deaths(victim)) // deaths
		write_short(0) // class?
		write_short(fm_cs_get_user_team(victim)) // team
		message_end()
	}
}

// Plays a sound on clients
PlaySound(const sound[])
{
	if (equal(sound[strlen(sound)-4], ".mp3"))
		client_cmd(0, "mp3 play ^"sound/%s^"", sound)
	else
		client_cmd(0, "spk ^"%s^"", sound)
}

/*================================================================================
 [Stocks]
=================================================================================*/

// Remove Player Frags
stock RemoveFrags(attacker, victim)
{
	// Remove attacker frags
	set_pev(attacker, pev_frags, float(pev(attacker, pev_frags) - 1))
	
	// Remove victim deaths
	fm_cs_set_user_deaths(victim, cs_get_user_deaths(victim) - 1)
}

// Set an entity's key value (from fakemeta_util)
stock fm_set_kvd(entity, const key[], const value[], const classname[]) {
	set_kvd(0, KV_ClassName, classname)
	set_kvd(0, KV_KeyName, key)
	set_kvd(0, KV_Value, value)
	set_kvd(0, KV_fHandled, 0)
	dllfunc(DLLFunc_KeyValue, entity, 0)
}

// Set entity's rendering type (from fakemeta_util)
stock fm_set_rendering(entity, fx = kRenderFxNone, r = 255, g = 255, b = 255, render = kRenderNormal, amount = 16) {
	static Float:color[3]
	color[0] = float(r)
	color[1] = float(g)
	color[2] = float(b)
	set_pev(entity, pev_renderfx, fx)
	set_pev(entity, pev_rendercolor, color)
	set_pev(entity, pev_rendermode, render)
	set_pev(entity, pev_renderamt, float(amount))
}

// Get entity's speed (from fakemeta_util)
stock fm_get_speed(entity) {
	static Float:velocity[3]
	pev(entity, pev_velocity, velocity)
	return floatround(vector_length(velocity));
}

// Get entity's aim origins (from fakemeta_util)
stock fm_get_aim_origin(id, Float:origin[3]) {
	static Float:origin1F[3], Float:origin2F[3]
	pev(id, pev_origin, origin1F)
	pev(id, pev_view_ofs, origin2F)
	xs_vec_add(origin1F, origin2F, origin1F)
	pev(id, pev_v_angle, origin2F);
	engfunc(EngFunc_MakeVectors, origin2F)
	global_get(glb_v_forward, origin2F)
	xs_vec_mul_scalar(origin2F, 9999.0, origin2F)
	xs_vec_add(origin1F, origin2F, origin2F)
	engfunc(EngFunc_TraceLine, origin1F, origin2F, 0, id, 0)
	get_tr2(0, TR_vecEndPos, origin)
}

// Find entity by its owner (from fakemeta_util)
stock fm_find_ent_by_owner(entity, const classname[], owner) {
	while ((entity = engfunc(EngFunc_FindEntityByString, entity, "classname", classname)) && pev(entity, pev_owner) != owner) { /* keep looping */ }
	return entity;
}

// Set player's health (from fakemeta_util)
stock fm_set_user_health(id, health) {
	(health > 0) ? set_pev(id, pev_health, float(health)) : dllfunc(DLLFunc_ClientKill, id);
}

// Give an item to a player (from fakemeta_util)
stock fm_give_item(id, const item[]) {
	static ent
	ent = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, item))
	if (!pev_valid(ent)) return;
	
	static Float:originF[3]
	pev(id, pev_origin, originF)
	set_pev(ent, pev_origin, originF)
	set_pev(ent, pev_spawnflags, pev(ent, pev_spawnflags) | SF_NORESPAWN)
	dllfunc(DLLFunc_Spawn, ent)
	static save
	save = pev(ent, pev_solid)
	dllfunc(DLLFunc_Touch, ent, id)
	if (pev(ent, pev_solid) != save)
		return;
	
	engfunc(EngFunc_RemoveEntity, ent)
}

// Strip user weapons (from fakemeta_util)
stock fm_strip_user_weapons(id) {
	static ent
	ent = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, "player_weaponstrip"))
	if (!pev_valid(ent)) return;
	
	dllfunc(DLLFunc_Spawn, ent)
	dllfunc(DLLFunc_Use, ent, id)
	engfunc(EngFunc_RemoveEntity, ent)
}

// Collect random spawn points
stock load_spawns() {
	new cfgdir[32], mapname[32], filepath[100], linedata[64]
	get_configsdir(cfgdir, charsmax(cfgdir))
	get_mapname(mapname, charsmax(mapname))
	formatex(filepath, charsmax(filepath), "%s/csdm/%s.spawns.cfg", cfgdir, mapname)
	if (file_exists(filepath)) {
		new csdmdata[10][6], file = fopen(filepath,"rt")
		while (file && !feof(file)) {
			fgets(file, linedata, charsmax(linedata))
			if(!linedata[0] || str_count(linedata,' ') < 2) continue;
			
			parse(linedata,csdmdata[0],5,csdmdata[1],5,csdmdata[2],5,csdmdata[3],5,csdmdata[4],5,csdmdata[5],5,csdmdata[6],5,csdmdata[7],5,csdmdata[8],5,csdmdata[9],5)
			g_spawns[g_spawnCount][0] = floatstr(csdmdata[0])
			g_spawns[g_spawnCount][1] = floatstr(csdmdata[1])
			g_spawns[g_spawnCount][2] = floatstr(csdmdata[2])
			g_spawnCount++
			if (g_spawnCount >= sizeof g_spawns) break;
		}
		if (file) fclose(file)
	} else {
		// Collect regular spawns
		collect_spawns_ent("info_player_start")
		collect_spawns_ent("info_player_deathmatch")
	}
	collect_spawns_ent2("info_player_start")
	collect_spawns_ent2("info_player_deathmatch")
}

// Collect spawn points from entity origins
stock collect_spawns_ent(const classname[]) {
	new ent = -1
	while ((ent = engfunc(EngFunc_FindEntityByString, ent, "classname", classname)) != 0) {
		new Float:originF[3]
		pev(ent, pev_origin, originF)
		g_spawns[g_spawnCount][0] = originF[0]
		g_spawns[g_spawnCount][1] = originF[1]
		g_spawns[g_spawnCount][2] = originF[2]
		g_spawnCount++
		if (g_spawnCount >= sizeof g_spawns) break;
	}
}

// Collect spawn points from entity origins
stock collect_spawns_ent2(const classname[]) {
	new ent = -1
	while ((ent = engfunc(EngFunc_FindEntityByString, ent, "classname", classname)) != 0) {
		new Float:originF[3]
		pev(ent, pev_origin, originF)
		g_spawns2[g_spawnCount2][0] = originF[0]
		g_spawns2[g_spawnCount2][1] = originF[1]
		g_spawns2[g_spawnCount2][2] = originF[2]
		g_spawnCount2++
		if (g_spawnCount2 >= sizeof g_spawns2) break;
	}
}

// Drop primary/secondary weapons
stock drop_weapons(id, dropwhat) {
	static weapons[32], num, i, weaponid
	num = 0 // reset passed weapons count (bugfix)
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

// Stock by (probably) Twilight Suzuka -counts number of chars in a string
stock str_count(const str[], searchchar) {
	new count, i, len = strlen(str)
	for (i = 0; i <= len; i++) {
		if(str[i] == searchchar)
			count++
	}
	return count;
}

// Checks if a space is vacant (credits to VEN)
stock is_hull_vacant(Float:origin[3], hull) {
	engfunc(EngFunc_TraceHull, origin, origin, 0, hull, 0, 0)
	if (!get_tr2(0, TR_StartSolid) && !get_tr2(0, TR_AllSolid) && get_tr2(0, TR_InOpen))
		return true;
	
	return false;
}

// Check if a player is stuck (credits to VEN)
stock is_player_stuck(id) {
	static Float:originF[3]
	pev(id, pev_origin, originF)
	engfunc(EngFunc_TraceHull, originF, originF, 0, (pev(id, pev_flags) & FL_DUCKING) ? HULL_HEAD : HULL_HUMAN, id, 0)
	if (get_tr2(0, TR_StartSolid) || get_tr2(0, TR_AllSolid) || !get_tr2(0, TR_InOpen))
		return true;
	
	return false;
}

// Simplified get_weaponid (CS only)
stock cs_weapon_name_to_id(const weapon[]) {
	static i
	for (i = 0; i < sizeof WEAPONENTNAMES; i++) {
		if (equal(weapon, WEAPONENTNAMES[i]))
			return i;
	}
	return 0;
}

// Get User Current Weapon Entity
stock fm_cs_get_current_weapon_ent(id) {
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return -1;
	
	return get_pdata_cbase(id, OFFSET_ACTIVE_ITEM, OFFSET_LINUX);
}

// Get Weapon Entity's Owner
stock fm_cs_get_weapon_ent_owner(ent) {
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(ent) != PDATA_SAFE)
		return -1;
	
	return get_pdata_cbase(ent, OFFSET_WEAPONOWNER, OFFSET_LINUX_WEAPONS);
}

// Set User Deaths
stock fm_cs_set_user_deaths(id, value) {
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return;
	
	set_pdata_int(id, OFFSET_CSDEATHS, value, OFFSET_LINUX)
}

// Get User Team
stock fm_cs_get_user_team(id) {
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return FM_CS_TEAM_UNASSIGNED;
	
	return get_pdata_int(id, OFFSET_CSTEAMS, OFFSET_LINUX);
}

// Set a Player's Team
stock fm_cs_set_user_team(id, team) {
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return;
	
	set_pdata_int(id, OFFSET_CSTEAMS, team, OFFSET_LINUX)
}

// Set User Money
stock fm_cs_set_user_money(id, value) {
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return;
	
	set_pdata_int(id, OFFSET_CSMONEY, value, OFFSET_LINUX)
}

// Set User Flashlight Batteries
stock fm_cs_set_user_batteries(id, value) {
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return;
	
	set_pdata_int(id, OFFSET_FLASHLIGHT_BATTERY, value, OFFSET_LINUX)
}

// Update Player's Team on all clients (adding needed delays)
stock fm_user_team_update(id) {
	if (g_gametime - g_teams_targettime >= 0.1) {
		set_task(0.1, "fm_cs_set_user_team_msg", id+TASK_TEAM)
		g_teams_targettime = g_gametime + 0.1
	} else {
		set_task((g_teams_targettime + 0.1) - g_gametime, "fm_cs_set_user_team_msg", id+TASK_TEAM)
		g_teams_targettime = g_teams_targettime + 0.1
	}
}

// Send User Team Message
public fm_cs_set_user_team_msg(taskid) {
	// Note to self: this next message can now be received by other plugins
	
	// Set the switching team flag
	g_switchingteam = true
	
	// Tell everyone my new team
	emessage_begin(MSG_ALL, g_msgTeamInfo)
	ewrite_byte(ID_TEAM) // player
	ewrite_string(CS_TEAM_NAMES[fm_cs_get_user_team(ID_TEAM)]) // team
	emessage_end()
	
	// Done switching team
	g_switchingteam = false
}

// Set the precached model index (updates hitboxes server side)
stock fm_cs_set_user_model_index(id, value) {
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return
	
	set_pdata_int(id, OFFSET_MODELINDEX, value, OFFSET_LINUX)
	set_pev(id, pev_body, g_playermodelbody[id])
}

// Set Player Model on Entity
stock fm_set_playermodel_ent(id) {
	// Make original player entity invisible without hiding shadows or firing effects
	fm_set_rendering(id, kRenderFxNone, 255, 255, 255, kRenderTransTexture, 1)
	
	// Format model string
	static model[100]
	formatex(model, charsmax(model), "models/player/%s/%s.mdl", g_playermodel[id], g_playermodel[id])
	
	// Set model on entity or make a new one if unexistant
	if (!pev_valid(g_ent_playermodel[id])) {
		g_ent_playermodel[id] = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, "info_target"))
		if (!pev_valid(g_ent_playermodel[id]))
			return
		
		set_pev(g_ent_playermodel[id], pev_classname, MODEL_ENT_CLASSNAME)
		set_pev(g_ent_playermodel[id], pev_movetype, MOVETYPE_FOLLOW)
		set_pev(g_ent_playermodel[id], pev_aiment, id)
		set_pev(g_ent_playermodel[id], pev_owner, id)
	}
	engfunc(EngFunc_SetModel, g_ent_playermodel[id], model)
	set_pev(g_ent_playermodel[id], pev_body, g_playermodelbody[id])
}

// Set Weapon Model on Entity
stock fm_set_weaponmodel_ent(id) {
	// Get player's p_ weapon model
	static model[100]
	pev(id, pev_weaponmodel2, model, charsmax(model))
	
	// Set model on entity or make a new one if unexistant
	if (!pev_valid(g_ent_weaponmodel[id])) {
		g_ent_weaponmodel[id] = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, "info_target"))
		if (!pev_valid(g_ent_weaponmodel[id]))
			return
		
		set_pev(g_ent_weaponmodel[id], pev_classname, WEAPON_ENT_CLASSNAME)
		set_pev(g_ent_weaponmodel[id], pev_movetype, MOVETYPE_FOLLOW)
		set_pev(g_ent_weaponmodel[id], pev_aiment, id)
		set_pev(g_ent_weaponmodel[id], pev_owner, id)
	}
	engfunc(EngFunc_SetModel, g_ent_weaponmodel[id], model)
}

// Remove Custom Model Entities
stock fm_remove_model_ents(id) {
	// Remove "playermodel" ent if present
	if (pev_valid(g_ent_playermodel[id])) {
		engfunc(EngFunc_RemoveEntity, g_ent_playermodel[id])
		g_ent_playermodel[id] = 0
	}
	
	// Remove "weaponmodel" ent if present
	if (pev_valid(g_ent_weaponmodel[id])) {
		engfunc(EngFunc_RemoveEntity, g_ent_weaponmodel[id])
		g_ent_weaponmodel[id] = 0
	}
}

// Set User Model
public fm_cs_set_user_model(taskid) {
	set_user_info(ID_MODEL, "model", g_playermodel[ID_MODEL])
	set_pev(ID_MODEL, pev_body, g_playermodelbody[ID_MODEL])
}

// Get User Model -model passed byref-
stock fm_cs_get_user_model(player, model[], len)
	get_user_info(player, "model", model, len)

// Update Player's Model on all clients (adding needed delays)
public fm_user_model_update(taskid) {
	if (g_gametime - g_models_targettime >= g_modelchange_delay) {
		fm_cs_set_user_model(taskid)
		g_models_targettime = g_gametime
	} else {
		set_task((g_models_targettime + g_modelchange_delay) - g_gametime, "fm_cs_set_user_model", taskid)
		g_models_targettime = g_models_targettime + g_modelchange_delay
	}
}

UTIL_TextMsg(id, szMessage[]) {
	message_begin(MSG_ONE, 77, _, id)
	write_byte(4)
	write_string(szMessage)
	message_end()
}

UTIL_BlinkAcct(id, BlinkAmt) {
	message_begin(MSG_ONE_UNRELIABLE, 104, _, id)
	write_byte(BlinkAmt)
	message_end()
}

stock get_weapon_index(id, const wname[]) {
	static ent; ent = -1
	while((ent = engfunc(EngFunc_FindEntityByString, ent, "classname", wname)) && pev(ent, pev_owner) != id) {}
	if(!ent) return false
	return ent
}