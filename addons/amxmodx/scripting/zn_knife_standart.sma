#define WEAPON_KEY					0

// Animation
#define DRAW_ANIM 3
#define DRAW_SPEED 1.03

#include <amxmodx>
#include <fakemeta>
#include <zombienightmare>

new gItem

public plugin_natives () {
	register_native("zn_give_standart_knife", "give_wpn", 1)
}

public plugin_init() {
	register_plugin("[ZN] Standart Knife", "1.0", "BaRSiK");
	gItem = zp_register_extra_item("standartknife", 10, ZP_TEAM_HUMAN);
}

public zp_extra_item_selected(id, item) if(item == gItem) give_wpn(id);
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
	set_pev(id, pev_viewmodel2,   "models/v_knife.mdl");
	set_pev(id, pev_weaponmodel2, "models/p_knife.mdl");
	UTIL_SendWeaponAnim(id, DRAW_ANIM);
	client_cmd(id, "weapon_knife");
	return ent;
}

stock get_weapon_index(id, const wname[]) {
	static ent; ent = -1
	while((ent = engfunc(EngFunc_FindEntityByString, ent, "classname", wname)) && pev(ent, pev_owner) != id) {}
	if(!ent) return false
	return ent
}

stock UTIL_SendWeaponAnim(id, Sequence) {
	set_pev(id, pev_weaponanim, Sequence);
	message_begin(MSG_ONE_UNRELIABLE, SVC_WEAPONANIM, _, id);
	write_byte(Sequence);
	write_byte(0);
	message_end();
}