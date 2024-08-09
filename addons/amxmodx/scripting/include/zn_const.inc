#if defined _zn_const
  #endinput
#endif
#define _zn_const

#include <cstrike>
#include <fakemeta>
#include <hamsandwich>

#define OFFSET_LINUX 5
#define OFFSET_LINUX_WEAPONS 4

// CS Player PData Offsets (win32)
#define PDATA_SAFE 2
#define OFFSET_PAINSHOCK 108
#define OFFSET_CSTEAMS 114
#define OFFSET_CSMONEY 115
#define OFFSET_CSMENUCODE 205
#define OFFSET_FLASHLIGHT_BATTERY 244
#define OFFSET_CSDEATHS 444
#define OFFSET_MODELINDEX 491
#define OFFSET_NEXTATTACK 83

// CS Player CBase Offsets (win32)
#define OFFSET_ACTIVE_ITEM 373 
#define OFFSET_WEAPONOWNER 41

// HACK: pev_ field used to store additional ammo on weapons
#define PEV_ADDITIONAL_AMMO pev_iuser1

// Primary and Secondary Weapon Names
new const WEAPONNAMES[][] = { "", "P228 Compact", "", "Schmidt Scout", "", "XM1014 M4", "", "Ingram MAC-10", "Steyr AUG A1",
			"", "Dual Elite Berettas", "FiveseveN", "UMP 45", "SG-550 Auto-Sniper", "IMI Galil", "Famas",
			"USP .45 ACP Tactical", "Glock 18C", "AWP Magnum Sniper", "MP5 Navy", "M249 Para Machinegun",
			"M3 Super 90", "M4A1 Carbine", "Schmidt TMP", "G3SG1 Auto-Sniper", "", "Desert Eagle .50 AE",
			"SG-552 Commando", "AK-47 Kalashnikov", "", "ES P90" };

new const WEAPONENTNAMES[][] = { "", "weapon_p228", "", "weapon_scout", "weapon_hegrenade", "weapon_xm1014", "weapon_c4", "weapon_mac10",
			"weapon_aug", "weapon_smokegrenade", "weapon_elite", "weapon_fiveseven", "weapon_ump45", "weapon_sg550",
			"weapon_galil", "weapon_famas", "weapon_usp", "weapon_glock18", "weapon_awp", "weapon_mp5navy", "weapon_m249",
			"weapon_m3", "weapon_m4a1", "weapon_tmp", "weapon_g3sg1", "weapon_flashbang", "weapon_deagle", "weapon_sg552",
			"weapon_ak47", "weapon_knife", "weapon_p90" };