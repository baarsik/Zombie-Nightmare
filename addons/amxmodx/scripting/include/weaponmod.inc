/*
* Weaponmod natives & constants
* Author: Барс
* Last edit: 10.07.2014
*/

#if defined _weaponmod_included
  #endinput
#endif
#define _weaponmod_included

#include <fakemeta_util>

// Weapon bytes for weaponlist
#define WN_P228_NAME		weapon_p228
#define WN_P228_PRIMID		9
#define WN_P228_PRIMMAX		52
#define WN_P228_SECID		-1
#define WN_P228_SECMAX		-1
#define WN_P228_SLOTID		1
#define WN_P228_SLOTNUM		3
#define WN_P228_WEAPID		1
#define WN_P228_FLAGS		0

#define WN_SCOUT_NAME		weapon_scout
#define WN_SCOUT_PRIMID		2
#define WN_SCOUT_PRIMMAX	90
#define WN_SCOUT_SECID		-1
#define WN_SCOUT_SECMAX		-1
#define WN_SCOUT_SLOTID		0
#define WN_SCOUT_SLOTNUM	9
#define WN_SCOUT_WEAPID		3
#define WN_SCOUT_FLAGS		0

#define WN_HEGREN_NAME		weapon_hegrenade
#define WN_HEGREN_PRIMID	12
#define WN_HEGREN_PRIMMAX	1
#define WN_HEGREN_SECID		-1
#define WN_HEGREN_SECMAX	-1
#define WN_HEGREN_SLOTID	3
#define WN_HEGREN_SLOTNUM	1
#define WN_HEGREN_WEAPID	4
#define WN_HEGREN_FLAGS		24

#define WN_XM1014_NAME		weapon_xm1014
#define WN_XM1014_PRIMID	5
#define WN_XM1014_PRIMMAX	32
#define WN_XM1014_SECID		-1
#define WN_XM1014_SECMAX	-1
#define WN_XM1014_SLOTID	0
#define WN_XM1014_SLOTNUM	12
#define WN_XM1014_WEAPID	5
#define WN_XM1014_FLAGS		0

#define WN_C4_NAME		weapon_c4
#define WN_C4_PRIMID		14
#define WN_C4_PRIMMAX		1
#define WN_C4_SECID		-1
#define WN_C4_SECMAX		-1
#define WN_C4_SLOTID		4
#define WN_C4_SLOTNUM		3
#define WN_C4_WEAPID		6
#define WN_C4_FLAGS		24

#define WN_MAC10_NAME		weapon_mac10
#define WN_MAC10_PRIMID		6
#define WN_MAC10_PRIMMAX	100
#define WN_MAC10_SECID		-1
#define WN_MAC10_SECMAX		-1
#define WN_MAC10_SLOTID		0
#define WN_MAC10_SLOTNUM	13
#define WN_MAC10_WEAPID		7
#define WN_MAC10_FLAGS		0

#define WN_AUG_NAME		weapon_aug
#define WN_AUG_PRIMID		4
#define WN_AUG_PRIMMAX		90
#define WN_AUG_SECID		-1
#define WN_AUG_SECMAX		-1
#define WN_AUG_SLOTID		0
#define WN_AUG_SLOTNUM		14
#define WN_AUG_WEAPID		8
#define WN_AUG_FLAGS		0

#define WN_SMOKE_NAME		weapon_smokegrenade
#define WN_SMOKE_PRIMID		13
#define WN_SMOKE_PRIMMAX	1
#define WN_SMOKE_SECID		-1
#define WN_SMOKE_SECMAX		-1
#define WN_SMOKE_SLOTID		3
#define WN_SMOKE_SLOTNUM	3
#define WN_SMOKE_WEAPID		9
#define WN_SMOKE_FLAGS		24

#define WN_ELITE_NAME		weapon_elite
#define WN_ELITE_PRIMID		10
#define WN_ELITE_PRIMMAX	120
#define WN_ELITE_SECID		-1
#define WN_ELITE_SECMAX		-1
#define WN_ELITE_SLOTID		1
#define WN_ELITE_SLOTNUM	5
#define WN_ELITE_WEAPID		10
#define WN_ELITE_FLAGS		0

#define WN_FIVESEVEN_NAME	weapon_fiveseven
#define WN_FIVESEVEN_PRIMID	7
#define WN_FIVESEVEN_PRIMMAX	100
#define WN_FIVESEVEN_SECID	-1
#define WN_FIVESEVEN_SECMAX	-1
#define WN_FIVESEVEN_SLOTID	1
#define WN_FIVESEVEN_SLOTNUM	6
#define WN_FIVESEVEN_WEAPID	11
#define WN_FIVESEVEN_FLAGS	0

#define WN_UMP45_NAME		weapon_ump45
#define WN_UMP45_PRIMID		6
#define WN_UMP45_PRIMMAX	100
#define WN_UMP45_SECID		-1
#define WN_UMP45_SECMAX		-1
#define WN_UMP45_SLOTID		0
#define WN_UMP45_SLOTNUM	15
#define WN_UMP45_WEAPID		12
#define WN_UMP45_FLAGS		0

#define WN_SG550_NAME		weapon_sg550
#define WN_SG550_PRIMID		4
#define WN_SG550_PRIMMAX	90
#define WN_SG550_SECID		-1
#define WN_SG550_SECMAX		-1
#define WN_SG550_SLOTID		0
#define WN_SG550_SLOTNUM	16
#define WN_SG550_WEAPID		13
#define WN_SG550_FLAGS		0

#define WN_GALIL_NAME		weapon_galil
#define WN_GALIL_PRIMID		4
#define WN_GALIL_PRIMMAX	90
#define WN_GALIL_SECID		-1
#define WN_GALIL_SECMAX		-1
#define WN_GALIL_SLOTID		0
#define WN_GALIL_SLOTNUM	17
#define WN_GALIL_WEAPID		14
#define WN_GALIL_FLAGS		0

#define WN_FAMAS_NAME		weapon_famas
#define WN_FAMAS_PRIMID		4
#define WN_FAMAS_PRIMMAX	90
#define WN_FAMAS_SECID		-1
#define WN_FAMAS_SECMAX		-1
#define WN_FAMAS_SLOTID		0
#define WN_FAMAS_SLOTNUM	18
#define WN_FAMAS_WEAPID		15
#define WN_FAMAS_FLAGS		0

#define WN_USP_NAME		weapon_usp
#define WN_USP_PRIMID		6
#define WN_USP_PRIMMAX		100
#define WN_USP_SECID		-1
#define WN_USP_SECMAX		-1
#define WN_USP_SLOTID		1
#define WN_USP_SLOTNUM		4
#define WN_USP_WEAPID		16
#define WN_USP_FLAGS		0

#define WN_GLOCK_NAME		weapon_glock18
#define WN_GLOCK_PRIMID		10
#define WN_GLOCK_PRIMMAX	120
#define WN_GLOCK_SECID		-1
#define WN_GLOCK_SECMAX		-1
#define WN_GLOCK_SLOTID		1
#define WN_GLOCK_SLOTNUM	2
#define WN_GLOCK_WEAPID		17
#define WN_GLOCK_FLAGS		0

#define WN_AWP_NAME		weapon_awp
#define WN_AWP_PRIMID		1
#define WN_AWP_PRIMMAX		30
#define WN_AWP_SECID		-1
#define WN_AWP_SECMAX		-1
#define WN_AWP_SLOTID		0
#define WN_AWP_SLOTNUM		2
#define WN_AWP_WEAPID		18
#define WN_AWP_FLAGS		0

#define WN_MP5_NAME		weapon_mp5navy
#define WN_MP5_PRIMID		10
#define WN_MP5_PRIMMAX		120
#define WN_MP5_SECID		-1
#define WN_MP5_SECMAX		-1
#define WN_MP5_SLOTID		0
#define WN_MP5_SLOTNUM		7
#define WN_MP5_WEAPID		19
#define WN_MP5_FLAGS		0

#define WN_M249_NAME		weapon_m249
#define WN_M249_PRIMID		3
#define WN_M249_PRIMMAX		200
#define WN_M249_SECID		-1
#define WN_M249_SECMAX		-1
#define WN_M249_SLOTID		0
#define WN_M249_SLOTNUM		4
#define WN_M249_WEAPID		20
#define WN_M249_FLAGS		0

#define WN_M3_NAME		weapon_m3
#define WN_M3_PRIMID		5
#define WN_M3_PRIMMAX		32
#define WN_M3_SECID		-1
#define WN_M3_SECMAX		-1
#define WN_M3_SLOTID		0
#define WN_M3_SLOTNUM		5
#define WN_M3_WEAPID		21
#define WN_M3_FLAGS		0

#define WN_M4A1_NAME		weapon_m4a1
#define WN_M4A1_PRIMID		4
#define WN_M4A1_PRIMMAX		90
#define WN_M4A1_SECID		-1
#define WN_M4A1_SECMAX		-1
#define WN_M4A1_SLOTID		0
#define WN_M4A1_SLOTNUM		6
#define WN_M4A1_WEAPID		22
#define WN_M4A1_FLAGS		0

#define WN_TMP_NAME		weapon_tmp
#define WN_TMP_PRIMID		10
#define WN_TMP_PRIMMAX		120
#define WN_TMP_SECID		-1
#define WN_TMP_SECMAX		-1
#define WN_TMP_SLOTID		0
#define WN_TMP_SLOTNUM		11
#define WN_TMP_WEAPID		23
#define WN_TMP_FLAGS		0

#define WN_G3SG1_NAME		weapon_g3sg1
#define WN_G3SG1_PRIMID		2
#define WN_G3SG1_PRIMMAX	90
#define WN_G3SG1_SECID		-1
#define WN_G3SG1_SECMAX		-1
#define WN_G3SG1_SLOTID		0
#define WN_G3SG1_SLOTNUM	3
#define WN_G3SG1_WEAPID		24
#define WN_G3SG1_FLAGS		0

#define WN_FLASH_NAME		weapon_flashbang
#define WN_FLASH_PRIMID		11
#define WN_FLASH_PRIMMAX	2
#define WN_FLASH_SECID		-1
#define WN_FLASH_SECMAX		-1
#define WN_FLASH_SLOTID		3
#define WN_FLASH_SLOTNUM	2
#define WN_FLASH_WEAPID		25
#define WN_FLASH_FLAGS		24

#define WN_DEAGLE_NAME		weapon_deagle
#define WN_DEAGLE_PRIMID	8
#define WN_DEAGLE_PRIMMAX	35
#define WN_DEAGLE_SECID		-1
#define WN_DEAGLE_SECMAX	-1
#define WN_DEAGLE_SLOTID	1
#define WN_DEAGLE_SLOTNUM	1
#define WN_DEAGLE_WEAPID	26
#define WN_DEAGLE_FLAGS		0

#define WN_SG552_NAME		weapon_sg552
#define WN_SG552_PRIMID		4
#define WN_SG552_PRIMMAX	90
#define WN_SG552_SECID		-1
#define WN_SG552_SECMAX		-1
#define WN_SG552_SLOTID		0
#define WN_SG552_SLOTNUM	10
#define WN_SG552_WEAPID		27
#define WN_SG552_FLAGS		0

#define WN_AK47_NAME		weapon_ak47
#define WN_AK47_PRIMID		2
#define WN_AK47_PRIMMAX		90
#define WN_AK47_SECID		-1
#define WN_AK47_SECMAX		-1
#define WN_AK47_SLOTID		0
#define WN_AK47_SLOTNUM		1
#define WN_AK47_WEAPID		28
#define WN_AK47_FLAGS		0

#define WN_KNIFE_NAME		weapon_knife
#define WN_KNIFE_PRIMID		-1
#define WN_KNIFE_PRIMMAX	-1
#define WN_KNIFE_SECID		-1
#define WN_KNIFE_SECMAX		-1
#define WN_KNIFE_SLOTID		2
#define WN_KNIFE_SLOTNUM	1
#define WN_KNIFE_WEAPID		29
#define WN_KNIFE_FLAGS		0

#define WN_P90_NAME		weapon_p90
#define WN_P90_PRIMID		7
#define WN_P90_PRIMMAX		100
#define WN_P90_SECID		-1
#define WN_P90_SECMAX		-1
#define WN_P90_SLOTID		0
#define WN_P90_SLOTNUM		8
#define WN_P90_WEAPID		30
#define WN_P90_FLAGS		0

// Weapons bit sums
stock const PRIMARY_WEAPONS_BIT_SUM = (1<<CSW_SCOUT)|(1<<CSW_XM1014)|(1<<CSW_MAC10)|(1<<CSW_AUG)|(1<<CSW_UMP45)|(1<<CSW_SG550)|(1<<CSW_GALIL)|(1<<CSW_FAMAS)|(1<<CSW_AWP)|
	(1<<CSW_MP5NAVY)|(1<<CSW_M249)|(1<<CSW_M3)|(1<<CSW_M4A1)|(1<<CSW_TMP)|(1<<CSW_G3SG1)|(1<<CSW_SG552)|(1<<CSW_AK47)|(1<<CSW_P90)
stock const SECONDARY_WEAPONS_BIT_SUM = (1<<CSW_P228)|(1<<CSW_ELITE)|(1<<CSW_FIVESEVEN)|(1<<CSW_USP)|(1<<CSW_GLOCK18)|(1<<CSW_DEAGLE)

// Weapon names
stock const WEAPONNAMES[][] = { "", "P228 Compact", "", "Schmidt Scout", "High Explosive Grenade", "XM1014 M4", "Composition C-4", "Ingram MAC-10", "Steyr AUG A1",
	"Smoke Grenade", "Dual Elite Berettas", "FiveseveN", "UMP 45", "SG-550 Auto-Sniper", "IMI Galil", "Famas", "USP .45 ACP Tactical", "Glock 18C",
	"AWP Magnum Sniper", "MP5 Navy", "M249 Para Machinegun", "M3 Super 90", "M4A1 Carbine", "Schmidt TMP", "G3SG1 Auto-Sniper", "M84 Stun Grenade",
	"Desert Eagle .50 AE", "SG-552 Commando", "AK-47 Kalashnikov", "Tactical Knife", "ES P90" }

// Weapon entity names
stock const WEAPONENTNAMES[][] = { "", "weapon_p228", "", "weapon_scout", "weapon_hegrenade", "weapon_xm1014", "weapon_c4", "weapon_mac10",
	"weapon_aug", "weapon_smokegrenade", "weapon_elite", "weapon_fiveseven", "weapon_ump45", "weapon_sg550", "weapon_galil", "weapon_famas",
	"weapon_usp", "weapon_glock18", "weapon_awp", "weapon_mp5navy", "weapon_m249", "weapon_m3", "weapon_m4a1", "weapon_tmp", "weapon_g3sg1",
	"weapon_flashbang", "weapon_deagle", "weapon_sg552", "weapon_ak47", "weapon_knife", "weapon_p90" }

// Drop weapons(1 - primary, 2 - secondary)
stock drop_weapons(id, dropwhat) {
	static weapons[32], num, i, weaponid
	num = 0
	get_user_weapons(id, weapons, num)
	for (i = 0; i < num; i++) {
		weaponid = weapons[i]
		if ((dropwhat == 1 && ((1<<weaponid) & PRIMARY_WEAPONS_BIT_SUM)) || (dropwhat == 2 && ((1<<weaponid) & SECONDARY_WEAPONS_BIT_SUM))) {
			static wname[32]
			get_weaponname(weaponid, wname, sizeof wname - 1)
			engclient_cmd(id, "drop", wname)
		}
	}
}

// Play weapon animation
stock UTIL_PlayWeaponAnimation(const Player, const Sequence) {
	set_pev(Player, pev_weaponanim, Sequence)
	message_begin(MSG_ONE_UNRELIABLE, SVC_WEAPONANIM, .player = Player)
	write_byte(Sequence)
	write_byte(pev(Player, pev_body))
	message_end()
}