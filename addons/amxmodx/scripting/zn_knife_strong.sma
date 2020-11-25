#define KNIFE_V_MODEL				"models/zn/weapons/v_strong.mdl"
#define KNIFE_P_MODEL				"models/zn/weapons/p_strong.mdl"
#define WEAPON_KEY					850

// Animation
#define IDLE_ANIM 0
#define IDLE_SPEED 15.0
#define ATTACK1_ANIM 2
#define ATTACK1_SPEED 4.83
#define ATTACK2_ANIM 5
#define ATTACK2_SPEED 4.63
#define STAB_ANIM 4
#define STAB_SPEED 4.63
#define DRAW_ANIM 3
#define DRAW_SPEED 1.03

new const newknife_sounds[][] = {
	"weapons/strong_deploy1.wav",							// Deploy Sound
	"weapons/strong_hit1.wav",								// Hit 1
	"weapons/strong_hit2.wav",								// Hit 2
	"weapons/strong_hit1.wav",								// Hit 3
	"weapons/strong_hit2.wav",								// Hit 4
	"weapons/strong_hitwall1.wav",							// Hit Wall
	"weapons/strong_miss.wav",								// Slash 1
	"weapons/strong_miss.wav",								// Slash 2
	"weapons/strong_stab.wav"								// Stab
}

#include <amxmodx>
#include <fakemeta>
#include <hamsandwich>
#include <zombienightmare>

#define CustomItem(%0) (pev(%0, pev_impulse) == WEAPON_KEY)

#define m_pPlayer					41
#define m_flNextPrimaryAttack		46
#define m_flNextSecondaryAttack		47
#define m_flTimeWeaponIdle			48
#define m_flNextAttack				83
#define m_pActiveItem				373

new const newknife_anim[] = { ATTACK2_ANIM, ATTACK2_ANIM, ATTACK2_ANIM, STAB_ANIM }

new const knife_sounds[][] = {
	"weapons/knife_deploy1.wav",	// Deploy Sound
	"weapons/knife_hit1.wav",		// Hit 1
	"weapons/knife_hit2.wav",		// Hit 2
	"weapons/knife_hit3.wav",		// Hit 3
	"weapons/knife_hit4.wav",		// Hit 4
	"weapons/knife_hitwall1.wav",	// Hit Wall
	"weapons/knife_slash1.wav",		// Slash 1
	"weapons/knife_slash2.wav",		// Slash 2
	"weapons/knife_stab.wav"		// Stab
}

// Cvars
new cvar_knife_damage, cvar_knife_prate, cvar_knife_srate;

new g_item

public plugin_natives () {
	register_native("zn_give_strong_knife", "give_wpn", 1)
}

public plugin_init() {
	register_plugin("[ZN] Strong Knife", "1.1", "BaRSiK");
	cvar_knife_prate = register_cvar("zn_knife_strong_prim_rate", "1.0");
	cvar_knife_srate = register_cvar("zn_knife_strong_sec_rate", "1.5");
	cvar_knife_damage = register_cvar("zn_knife_strong_dmg", "5.5");
	RegisterHam(Ham_Item_Deploy, "weapon_knife", "fw_Item_Deploy_Post", 1);
	RegisterHam(Ham_Weapon_WeaponIdle, "weapon_knife", "fw_Weapon_WeaponIdle");
	RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_knife", "fw_Weapon_PrimaryAttack");
	RegisterHam(Ham_Weapon_SecondaryAttack, "weapon_knife", "fw_Weapon_SecondaryAttack");
	RegisterHam(Ham_TakeDamage, "player", "fw_TakeDamage");
	register_forward(FM_EmitSound, "fw_EmitSound");
	register_forward(FM_PlaybackEvent, "fw_PlaybackEvent");
	g_item = zp_register_extra_item("strongknife", 10, ZP_TEAM_HUMAN);
}

public plugin_precache() {
	precache_model(KNIFE_V_MODEL);
	precache_model(KNIFE_P_MODEL);
	for(new i = 0; i < sizeof newknife_sounds; i++)
		precache_sound(newknife_sounds[i]);
}

public zp_extra_item_selected(id, item) if(item == g_item) give_wpn(id);
public give_wpn(id) {
	zp_set_user_knife_weaponkey(id, WEAPON_KEY);
	if(zp_has_round_started()) return;
	static weapon; weapon = give_weapon(id);
	if(!weapon) return;
	emit_sound(id, CHAN_ITEM, "items/gunpickup2.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
}
public give_weapon(id) {
	static ent; ent = get_weapon_index(id, "weapon_knife");
	if(ent <= 0) return 0;
	set_pev(ent, pev_impulse, WEAPON_KEY);
	fw_Item_Deploy_Post(ent);
	client_cmd(id, "weapon_knife");
	return ent;
}

public fw_TakeDamage(victim, inflictor, id, Float:damage) {
	if (victim != id && is_user_connected(id)) {
		if(get_user_weapon(id) == CSW_KNIFE && !zp_get_user_zombie(id)) {
			static item; item = get_pdata_cbase(id, m_pActiveItem, 5);
			if(CustomItem(item))
				SetHamParamFloat(4, damage * get_pcvar_float(cvar_knife_damage));
		}
	}
}

public fw_EmitSound(id, channel, const sound[]) {
	if(!is_user_alive(id)) return FMRES_IGNORED;
	if(zp_get_user_zombie(id)) return FMRES_IGNORED;
	static item; item = get_pdata_cbase(id, m_pActiveItem, 5);
	if(!CustomItem(item)) return FMRES_IGNORED;
	
	for(new i = 0; i < sizeof newknife_sounds; i++) {
		if(equal(sound, knife_sounds[i])) {
			if(i>=5) UTIL_SendWeaponAnim(id, newknife_anim[i-5]);
			emit_sound(id, channel, newknife_sounds[i], 1.0, ATTN_NORM, 0, PITCH_NORM);
			return FMRES_SUPERCEDE;
		}
	}
	return FMRES_IGNORED;
}

public fw_Weapon_PrimaryAttack(ent) {
	if(!CustomItem(ent)) return HAM_IGNORED;
	static id; id = get_pdata_cbase(ent, m_pPlayer, 4);
	if(zp_get_user_zombie(id)) return HAM_IGNORED;
	static Float:Punchangle[3]; pev(id, pev_punchangle, Punchangle);
	
	state FireBullets: Enabled;
	ExecuteHam(Ham_Weapon_PrimaryAttack, ent);
	state FireBullets: Disabled;
	
	UTIL_SendWeaponAnim(id, ATTACK1_ANIM);
	set_pdata_float(ent, m_flNextPrimaryAttack, get_pcvar_float(cvar_knife_prate), 4);
	set_pdata_float(ent, m_flNextSecondaryAttack, get_pcvar_float(cvar_knife_prate), 4);
	set_pdata_float(ent, m_flTimeWeaponIdle, ATTACK1_SPEED, 4);
	return HAM_SUPERCEDE;
}

public fw_Weapon_SecondaryAttack(ent) {
	if(!CustomItem(ent)) return HAM_IGNORED;
	static id; id = get_pdata_cbase(ent, m_pPlayer, 4);
	if(zp_get_user_zombie(id)) return HAM_IGNORED;
	static Float:Punchangle[3]; pev(id, pev_punchangle, Punchangle);
	
	state FireBullets: Enabled;
	ExecuteHam(Ham_Weapon_SecondaryAttack, ent);
	state FireBullets: Disabled;
	
	//UTIL_SendWeaponAnim(id, ATTACK2_ANIM);
	set_pdata_float(ent, m_flNextPrimaryAttack, get_pcvar_float(cvar_knife_srate), 4);
	set_pdata_float(ent, m_flNextSecondaryAttack, get_pcvar_float(cvar_knife_srate), 4);
	set_pdata_float(ent, m_flTimeWeaponIdle, ATTACK2_SPEED, 4);
	return HAM_SUPERCEDE;
}

public fw_Weapon_WeaponIdle(ent) {
	if(!CustomItem(ent) || get_pdata_float(ent, m_flTimeWeaponIdle, 4) > 0.0) return HAM_IGNORED;
	static id; id = get_pdata_cbase(ent, m_pPlayer, 4);
	if(zp_get_user_zombie(id)) return HAM_IGNORED;
	UTIL_SendWeaponAnim(get_pdata_cbase(ent, m_pPlayer, 4), IDLE_ANIM);
	set_pdata_float(ent, m_flTimeWeaponIdle, IDLE_SPEED, 4);
	return HAM_SUPERCEDE;
}

public fw_Item_Deploy_Post(ent) {
	if(!CustomItem(ent)) return HAM_IGNORED;
	static id; id = get_pdata_cbase(ent, m_pPlayer, 4);
	if(zp_get_user_zombie(id)) return HAM_IGNORED;
	set_pev(id, pev_viewmodel2,   KNIFE_V_MODEL);
	set_pev(id, pev_weaponmodel2, KNIFE_P_MODEL);
	UTIL_SendWeaponAnim(id, DRAW_ANIM);
	set_pdata_float(id, m_flNextAttack, DRAW_SPEED, 5);
	set_pdata_float(ent, m_flTimeWeaponIdle, 1.0, 4);
	return HAM_IGNORED;
}

public fw_PlaybackEvent() <FireBullets: Enabled> { return FMRES_SUPERCEDE; }
public fw_PlaybackEvent() <FireBullets: Disabled> { return FMRES_IGNORED; }
public fw_PlaybackEvent() <> { return FMRES_IGNORED; }

stock UTIL_SendWeaponAnim(id, Sequence) {
	set_pev(id, pev_weaponanim, Sequence);
	message_begin(MSG_ONE_UNRELIABLE, SVC_WEAPONANIM, _, id);
	write_byte(Sequence);
	write_byte(0);
	message_end();
}

stock get_weapon_index(id, const wname[]) {
    static ent; ent = -1
    while((ent = engfunc(EngFunc_FindEntityByString, ent, "classname", wname)) && pev(ent, pev_owner) != id) {}
    if(!ent) return false
    return ent
}