#include <amxmodx>
#include <fakemeta>
#include <hamsandwich>
#include <zombienightmare>

new cvar_clip, cvar_ammo, cvar_rate, cvar_damage, cvar_return_left, cvar_return_right, cvar_return_up, cvar_return_down, cvar_return_multi;

#define CustomItem(%0) (pev(%0, pev_impulse) == WEAPON_KEY)

// CWeaponBox
#define m_rgpPlayerItems_CWeaponBox 34

// CBasePlayerItem
#define m_pPlayer 41
#define m_pNext 42
#define m_iId 43

// CBasePlayerWeapon
#define m_flNextPrimaryAttack 46
#define m_flNextSecondaryAttack 47
#define m_flTimeWeaponIdle 48
#define m_iPrimaryAmmoType 49
#define m_iClip 51
#define m_fInReload 54

// CBaseMonster
#define m_flNextAttack 83

// CBasePlayer
#define m_rpgPlayerItems 367
#define m_pActiveItem 373
#define m_rgAmmo 376

// Settings
#define WEAPON_KEY 401 // WeaponKey
#define WEAPON_OLD "weapon_galil" // Old weapon
//#define customShell

// Animation
#define IDLE_ANIM 0
#define IDLE_SPEED 3.36
#define SHOOT_ANIM 3, 5
#define SHOOT_SPEED 1.03
#define RELOAD_ANIM 1
#define RELOAD_SPEED 3.03
#define DRAW_ANIM 2
#define DRAW_SPEED 1.03

// Resources
#define WEAPON_MODEL_V "models/zn/weapons/v_ak74u.mdl"
#define WEAPON_MODEL_P "models/zn/weapons/p_ak74u.mdl"
#define WEAPON_MODEL_W "models/zn/weapons/w_ak74u.mdl"
#define WEAPON_MODEL_S "models/zn/weapons/rshell.mdl"
#define WEAPON_SOUND_S "weapons/ak74u-1.wav"

new g_item

#if defined customShell
new g_shell
#endif

public plugin_natives () {
	register_native("zn_give_ak74u", "give_wpn", 1)
}

public plugin_init() {
	RegisterHam(Ham_Item_Deploy,           WEAPON_OLD, "fw_Item_Deploy_Post", 1);
	RegisterHam(Ham_Item_PostFrame,        WEAPON_OLD, "fw_Item_PostFrame");
	RegisterHam(Ham_Weapon_PrimaryAttack,  WEAPON_OLD, "fw_Weapon_PrimaryAttack");
	RegisterHam(Ham_Weapon_WeaponIdle,     WEAPON_OLD, "fw_Weapon_WeaponIdle");
	RegisterHam(Ham_Weapon_Reload,         WEAPON_OLD, "fw_Weapon_Reload");
	RegisterHam(Ham_TraceAttack, "func_breakable",     "fw_TraceAttack");
	RegisterHam(Ham_TraceAttack, "hostage_entity",     "fw_TraceAttack");
	RegisterHam(Ham_TraceAttack, "player",             "fw_TraceAttack");
	RegisterHam(Ham_TraceAttack, "info_target",        "fw_TraceAttack");
	RegisterHam(Ham_TraceAttack, "func_breakable",     "fw_TraceAttack_Post", 1);
	RegisterHam(Ham_TraceAttack, "func_wall",          "fw_TraceAttack_Post", 1);
	RegisterHam(Ham_TraceAttack, "func_door",          "fw_TraceAttack_Post", 1);
	RegisterHam(Ham_TraceAttack, "func_plat",          "fw_TraceAttack_Post", 1);
	RegisterHam(Ham_TraceAttack, "func_rotating",      "fw_TraceAttack_Post", 1);
	RegisterHam(Ham_TraceAttack, "worldspawn",         "fw_TraceAttack_Post", 1);
	RegisterHam(Ham_TraceAttack, "func_door_rotating", "fw_TraceAttack_Post", 1);
	cvar_clip = register_cvar("zn_wpn_ak74u_clip", "30")
	cvar_ammo = register_cvar("zn_wpn_ak74u_ammo", "135")
	cvar_rate = register_cvar("zn_wpn_ak74u_rate", "0.1")
	cvar_damage = register_cvar("zn_wpn_ak74u_damage", "1.15")
	cvar_return_left = register_cvar("zn_wpn_ak74u_return_left", "1.5")
	cvar_return_right = register_cvar("zn_wpn_ak74u_return_right", "3.2")
	cvar_return_up = register_cvar("zn_wpn_ak74u_return_up", "1.5")
	cvar_return_down = register_cvar("zn_wpn_ak74u_return_down", "-1.0")
	cvar_return_multi = register_cvar("zn_wpn_ak74u_return_multi", "0.25")
	RegisterHam(Ham_Spawn, "weaponbox", "fw_Spawn_Weaponbox_Post", 1);
	register_forward(FM_UpdateClientData, "fw_UpdateClientData_Post", 1);
	register_forward(FM_PlaybackEvent, "fw_PlaybackEvent");
	register_forward(FM_SetModel, "fw_SetModel");
	state WeaponBox_Disabled;
	g_item = zp_register_extra_item("ak74u", 10, ZP_TEAM_HUMAN);
}
public plugin_precache() {
	engfunc(EngFunc_PrecacheModel, WEAPON_MODEL_V);
	engfunc(EngFunc_PrecacheModel, WEAPON_MODEL_P);
	engfunc(EngFunc_PrecacheModel, WEAPON_MODEL_W);
	engfunc(EngFunc_PrecacheSound, WEAPON_SOUND_S);
	
	engfunc(EngFunc_PrecacheSound, "weapons/ak74u_boltpull.wav");
	engfunc(EngFunc_PrecacheSound, "weapons/ak74u_clipin.wav");
	engfunc(EngFunc_PrecacheSound, "weapons/ak74u_clipout.wav");
	engfunc(EngFunc_PrecacheSound, "weapons/ak74u_draw.wav");
	
	#if defined customShell
	g_shell = engfunc(EngFunc_PrecacheModel, WEAPON_MODEL_S);
	#endif
}
public zp_user_buy_primammo(id) {
	static item; item = get_pdata_cbase(id, m_pActiveItem, 5);
	if(item <= 0 || !CustomItem(item)) return;
	zp_set_ammo_value(id, get_pcvar_num(cvar_clip));
	zp_set_ammo_max(id, get_pcvar_num(cvar_ammo));
	zp_set_ammo_cost(id, 5);
}
public zp_extra_item_selected(id, item) if(item == g_item) give_wpn(id);
public give_wpn(id) {
	UTIL_DropWeapon(id, 1);
	static weapon; weapon = give_weapon(id);
	if(!weapon) return;
	emit_sound(id, CHAN_ITEM, "items/gunpickup2.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	static ammotype; ammotype = m_rgAmmo + get_pdata_int(weapon, m_iPrimaryAmmoType, 4);
	if(get_pdata_int(id, ammotype, 5) < get_pcvar_num(cvar_ammo)) set_pdata_int(id, ammotype, get_pcvar_num(cvar_ammo), 5);
}
public give_weapon(id) {
	static string; if(!string) string = engfunc(EngFunc_AllocString, WEAPON_OLD);
	static ent; ent = engfunc(EngFunc_CreateNamedEntity, string);
	if(ent <= 0) return 0;
	set_pev(ent, pev_spawnflags, SF_NORESPAWN);
	set_pev(ent, pev_impulse, WEAPON_KEY);
	ExecuteHam(Ham_Spawn, ent);
	if(!ExecuteHamB(Ham_AddPlayerItem, id, ent)) {
		set_pev(ent, pev_flags, FL_KILLME);
		return 0;
	}
	ExecuteHamB(Ham_Item_AttachToPlayer, ent, id);
	set_pdata_int(ent, m_iClip, get_pcvar_num(cvar_clip), 4);
	return ent;
}
public fw_Item_Deploy_Post(ent) {
	if(!CustomItem(ent)) return HAM_IGNORED;
	static id; id = get_pdata_cbase(ent, m_pPlayer, 4);
	set_pev(id, pev_viewmodel2,   WEAPON_MODEL_V);
	set_pev(id, pev_weaponmodel2, WEAPON_MODEL_P);
	UTIL_SendWeaponAnim(id, DRAW_ANIM);
	set_pdata_float(id, m_flNextAttack, DRAW_SPEED, 5);
	set_pdata_float(ent, m_flTimeWeaponIdle, 1.0, 4);
	return HAM_IGNORED;
}
public fw_Item_PostFrame(ent) {
	if(!CustomItem(ent) || !get_pdata_int(ent, m_fInReload, 4)) return HAM_IGNORED;	
	static id; id = get_pdata_cbase(ent, m_pPlayer, 4);
	static clip; clip = get_pdata_int(ent, m_iClip, 4);
	static ammotype; ammotype = m_rgAmmo + get_pdata_int(ent, m_iPrimaryAmmoType, 4);
	static ammo; ammo = get_pdata_int(id, ammotype, 5);
	static j; j = min(get_pcvar_num(cvar_clip) - clip, ammo);
	set_pdata_int(ent, m_iClip, clip+j, 4);
	set_pdata_int(id, ammotype, ammo-j, 5);
	set_pdata_int(ent, m_fInReload, 0, 4);
	return HAM_IGNORED;
}
public fw_Weapon_PrimaryAttack(ent) {
	if(!CustomItem(ent) || !get_pdata_int(ent, m_iClip, 4)) return HAM_IGNORED;
	static id; id = get_pdata_cbase(ent, m_pPlayer, 4);
	static Float:Punchangle[3]; pev(id, pev_punchangle, Punchangle);
	
	state FireBullets: Enabled;
	ExecuteHam(Ham_Weapon_PrimaryAttack, ent);
	state FireBullets: Disabled;
	
	Punchangle[0] -= random_float((get_pcvar_float(cvar_return_left)), (get_pcvar_float(cvar_return_right))) + Punchangle[0] * get_pcvar_float(cvar_return_multi); // TYT
	Punchangle[1] += random_float((get_pcvar_float(cvar_return_up)), (get_pcvar_float(cvar_return_down)));
	set_pev(id, pev_punchangle, Punchangle);
	
	emit_sound(id, CHAN_WEAPON, WEAPON_SOUND_S, VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	UTIL_SendWeaponAnim(id, random_num(SHOOT_ANIM));
	set_pdata_float(ent, m_flNextPrimaryAttack, get_pcvar_float(cvar_rate), 4);
	set_pdata_float(ent, m_flNextSecondaryAttack, get_pcvar_float(cvar_rate), 4);
	set_pdata_float(ent, m_flTimeWeaponIdle, SHOOT_SPEED, 4);
	#if defined customShell
	UTIL_EjectBrass(id, g_shell, -8.0, 10.0, -4.0, 50.0, 70.0);
	#endif
	return HAM_SUPERCEDE;
}
public fw_Weapon_WeaponIdle(ent) {
	if(!CustomItem(ent) || get_pdata_float(ent, m_flTimeWeaponIdle, 4) > 0.0) return HAM_IGNORED;
	UTIL_SendWeaponAnim(get_pdata_cbase(ent, m_pPlayer, 4), IDLE_ANIM);
	set_pdata_float(ent, m_flTimeWeaponIdle, IDLE_SPEED, 4);
	return HAM_SUPERCEDE;
}
public fw_Weapon_Reload(ent) {
	if(!CustomItem(ent)) return HAM_IGNORED;
	static clip; clip = get_pdata_int(ent, m_iClip, 4);
	if(clip == get_pcvar_num(cvar_clip)) return HAM_SUPERCEDE;
	static id; id = get_pdata_cbase(ent, m_pPlayer, 4);
	if(!get_pdata_int(id, m_rgAmmo + get_pdata_int(ent, m_iPrimaryAmmoType, 4), 5)) return HAM_SUPERCEDE;
	set_pdata_int(ent, m_iClip, 0, 4);
	ExecuteHam(Ham_Weapon_Reload, ent);
	set_pdata_int(ent, m_iClip, clip, 4);
	UTIL_SendWeaponAnim(id, RELOAD_ANIM);
	set_pdata_float(id, m_flNextAttack, RELOAD_SPEED, 5);
	set_pdata_float(ent, m_flTimeWeaponIdle, 2.3, 4);
	set_pdata_int(ent, m_fInReload, 1, 4);
	return HAM_SUPERCEDE;
}
public fw_TraceAttack(victim, attacker, Float:damage) <FireBullets: Enabled> 
{
	if(attacker == victim) return HAM_IGNORED;
	static item; item = get_pdata_cbase(attacker, m_pActiveItem, 5);
	if(item <= 0 || !CustomItem(item)) return HAM_IGNORED;
	SetHamParamFloat(3, damage * get_pcvar_float(cvar_damage));
	return HAM_IGNORED;
}
public fw_TraceAttack_Post(entity, attacker, Float:damage, Float:fDir[3], ptr, damagetype) <FireBullets: Enabled>
{
	static Float:vecEnd[3]; get_tr2(ptr, TR_vecEndPos, vecEnd);
	engfunc(EngFunc_MessageBegin, MSG_PAS, SVC_TEMPENTITY, vecEnd, 0);
	write_byte(TE_GUNSHOTDECAL);
	engfunc(EngFunc_WriteCoord, vecEnd[0]);
	engfunc(EngFunc_WriteCoord, vecEnd[1]);
	engfunc(EngFunc_WriteCoord, vecEnd[2]);
	write_short(entity);
	write_byte(random_num(41, 45));
	message_end();
	return HAM_IGNORED;
}
public fw_Spawn_Weaponbox_Post(ent) {
	if(ent > 0)
		state (pev(ent, pev_owner) > 0) WeaponBox_Enabled;
}
public fw_UpdateClientData_Post(id, SendWeapons, CD_Handle) {
	if(!is_user_alive(id)) return FMRES_IGNORED;
	static item; item = get_pdata_cbase(id, m_pActiveItem, 5);
	if(item <= 0 || !CustomItem(item)) return FMRES_IGNORED;
	set_cd(CD_Handle, CD_flNextAttack, 999999.0);
	return FMRES_HANDLED;
}
public fw_SetModel(ent) <WeaponBox_Enabled>
{
	state WeaponBox_Disabled;
	if(ent <= 0) return FMRES_IGNORED;
	static i;
	for(i = 0; i < 6; i++) {
		static item; item = get_pdata_cbase(ent, m_rgpPlayerItems_CWeaponBox + i, 4);
		if(item > 0 && CustomItem(item)) {
			engfunc(EngFunc_SetModel, ent, WEAPON_MODEL_W);
			return FMRES_SUPERCEDE;
		}
	}
	return FMRES_IGNORED;
}
public fw_SetModel() <WeaponBox_Disabled> { return FMRES_IGNORED; }
public fw_PlaybackEvent() <FireBullets: Enabled> { return FMRES_SUPERCEDE; }
public fw_PlaybackEvent() <FireBullets: Disabled> { return FMRES_IGNORED; }
public fw_PlaybackEvent() <> { return FMRES_IGNORED; }
public fw_TraceAttack() <FireBullets: Disabled> { return HAM_IGNORED; }
public fw_TraceAttack() <> { return FMRES_IGNORED; }
public fw_TraceAttack_Post() <FireBullets: Disabled> { return HAM_IGNORED; }
public fw_TraceAttack_Post() <> { return FMRES_IGNORED; }
stock UTIL_SendWeaponAnim(id, Sequence) {
	set_pev(id, pev_weaponanim, Sequence);
	message_begin(MSG_ONE_UNRELIABLE, SVC_WEAPONANIM, _, id);
	write_byte(Sequence);
	write_byte(0);
	message_end();
}
stock UTIL_DropWeapon(id, slot) {
	static iEntity; iEntity = get_pdata_cbase(id, (m_rpgPlayerItems + slot), 5);
	if(iEntity > 0) {
		static iNext;
		static szWeaponName[32];
		do {
			iNext = get_pdata_cbase(iEntity, m_pNext, 4);
			if(get_weaponname(get_pdata_int(iEntity, m_iId, 4), szWeaponName, 31))
				engclient_cmd(id, "drop", szWeaponName);
		} 
		while((iEntity = iNext) > 0);
	}
}
#if defined customShell
stock UTIL_EjectBrass(id, ModelShellIndex, Float:Up, Float:Forward, Float:Right, Float:Koord1, Float:Koord2) {
	static Float:AnglesV[3]; pev(id, pev_v_angle, AnglesV);
	static Float:Punchangle[3]; pev(id, pev_punchangle, Punchangle);
	
	AnglesV[0] = Punchangle[0] + AnglesV[0];
	AnglesV[1] = Punchangle[1] + AnglesV[1];
	AnglesV[2] = Punchangle[2] + AnglesV[2];
	
	engfunc(EngFunc_MakeVectors, AnglesV);
	
	static Float:VForward[3]; global_get(glb_v_forward, VForward);
	static Float:VRight[3]; global_get(glb_v_right, VRight);
	static Float:VUp[3]; global_get(glb_v_up, VUp);
	
	static Float:Velocity[3]; pev(id, pev_velocity, Velocity);
	static Float:Origin[3]; pev(id, pev_origin, Origin);
	static Float:ViewOfs[3]; pev(id, pev_view_ofs, ViewOfs);
	static Float:Angles[3]; pev(id, pev_angles, Angles);
	
	static Float:ShellVelocity[3], Float:ShellOrigin[3];
	ShellVelocity[0] = Velocity[0] + VRight[0] * random_float(Koord1, Koord2) + VUp[0] * random_float(100.0, 150.0) + VForward[0] * 25.0;
	ShellVelocity[1] = Velocity[1] + VRight[1] * random_float(Koord1, Koord2) + VUp[1] * random_float(100.0, 150.0) + VForward[1] * 25.0;
	ShellVelocity[2] = Velocity[2] + VRight[2] * random_float(Koord1, Koord2) + VUp[2] * random_float(100.0, 150.0) + VForward[2] * 25.0;
	
	ShellOrigin[0] = Origin[0] + ViewOfs[0] + VUp[0] * Up + VForward[0] * Forward + VRight[0] * Right;
	ShellOrigin[1] = Origin[1] + ViewOfs[1] + VUp[1] * Up + VForward[1] * Forward + VRight[1] * Right;
	ShellOrigin[2] = Origin[2] + ViewOfs[2] + VUp[2] * Up + VForward[2] * Forward + VRight[2] * Right;
	
	static msg_Brass; if(!msg_Brass) msg_Brass = get_user_msgid("Brass");
	
	engfunc(EngFunc_MessageBegin, MSG_PVS, msg_Brass, ShellOrigin, 0);
	write_byte(0);
	engfunc(EngFunc_WriteCoord, ShellOrigin[0]);
	engfunc(EngFunc_WriteCoord, ShellOrigin[1]);
	engfunc(EngFunc_WriteCoord, ShellOrigin[2]);
	engfunc(EngFunc_WriteCoord, 0.0);
	engfunc(EngFunc_WriteCoord, 0.0);
	engfunc(EngFunc_WriteCoord, 0.0);
	engfunc(EngFunc_WriteCoord, ShellVelocity[0]);
	engfunc(EngFunc_WriteCoord, ShellVelocity[1]);
	engfunc(EngFunc_WriteCoord, ShellVelocity[2]);
	engfunc(EngFunc_WriteAngle, Angles[1]);
	write_short(ModelShellIndex);
	write_byte(1); //sound type
	write_byte(15); // 2.5 seconds
	write_byte(id); 
	message_end();
}
#endif
