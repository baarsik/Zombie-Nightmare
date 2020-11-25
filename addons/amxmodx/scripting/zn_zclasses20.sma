#include <amxmodx>
#include <zombienightmare>

/*================================================================================
 [Plugin Customization]
=================================================================================*/

// Classic Zombie Attributes
new const zclass1_name[] = { "Classic" };
new const zclass1_model[] = { "zn_zombie1" };
new const zclass1_clawmodel[] = { "v_knife_zm-1.mdl" };
const zclass1_health = 1815;
const zclass1_speed = 240;
const Float:zclass1_gravity = 0.9;
const Float:zclass1_knockback = 1.0;
const bool:zclass1_onlyvip = false;
const zclass1_costAmmo = 0;
const zclass1_costSouls = 0;

// Fast Zombie Attributes
new const zclass2_name[] = { "Fast" };
new const zclass2_model[] = { "zn_zombie1" };
new const zclass2_clawmodel[] = { "v_knife_zm-1.mdl" };
const zclass2_health = 935;
const zclass2_speed = 275;
const Float:zclass2_gravity = 0.9;
const Float:zclass2_knockback = 1.5;
const bool:zclass2_onlyvip = false;
const zclass2_costAmmo = 50;
const zclass2_costSouls = 1;

// Jumper Zombie Attributes
new const zclass3_name[] = { "Jumper" };
new const zclass3_model[] = { "zn_zombie1" };
new const zclass3_clawmodel[] = { "v_knife_zm-1.mdl" };
const zclass3_health = 1430;
const zclass3_speed = 210;
const Float:zclass3_gravity = 0.57;
const Float:zclass3_knockback = 1.25;
const bool:zclass3_onlyvip = false;
const zclass3_costAmmo = 50;
const zclass3_costSouls = 1;

// Tank Zombie Attributes
new const zclass4_name[] = { "Tank" };
new const zclass4_model[] = { "zn_zombie1" };
new const zclass4_clawmodel[] = { "v_knife_zm-1.mdl" };
const zclass4_health = 2750;
const zclass4_speed = 190;
const Float:zclass4_gravity = 0.9;
const Float:zclass4_knockback = 0.45;
const bool:zclass4_onlyvip = false;
const zclass4_costAmmo = 50;
const zclass4_costSouls = 1;

// Combined Zombie Attributes
new const zclass5_name[] = { "Combined" };
new const zclass5_model[] = { "zn_zombie1" };
new const zclass5_clawmodel[] = { "v_knife_zm-1.mdl" };
const zclass5_health = 1540;
const zclass5_speed = 255;
const Float:zclass5_gravity = 0.78;
const Float:zclass5_knockback = 0.8;
const bool:zclass5_onlyvip = true;
const zclass5_costAmmo = 75;
const zclass5_costSouls = 1;

/*============================================================================*/

// Zombie Classes MUST be registered on plugin_precache
public plugin_precache()
{
	register_plugin("[ZN] Default Zombie Classes", "2.0", "BaRSiK");
	
	// Register all classes
	zn_register_zombie_class(zclass1_name, zclass1_model, zclass1_clawmodel, zclass1_health, zclass1_speed, zclass1_gravity, zclass1_knockback,
		zclass1_onlyvip, zclass1_costAmmo, zclass1_costSouls);
	zn_register_zombie_class(zclass2_name, zclass2_model, zclass2_clawmodel, zclass2_health, zclass2_speed, zclass2_gravity, zclass2_knockback,
		zclass2_onlyvip, zclass2_costAmmo, zclass2_costSouls);
	zn_register_zombie_class(zclass3_name, zclass3_model, zclass3_clawmodel, zclass3_health, zclass3_speed, zclass3_gravity, zclass3_knockback,
		zclass3_onlyvip, zclass3_costAmmo, zclass3_costSouls);
	zn_register_zombie_class(zclass4_name, zclass4_model, zclass4_clawmodel, zclass4_health, zclass4_speed, zclass4_gravity, zclass4_knockback,
		zclass4_onlyvip, zclass4_costAmmo, zclass4_costSouls);
	zn_register_zombie_class(zclass5_name, zclass5_model, zclass5_clawmodel, zclass5_health, zclass5_speed, zclass5_gravity, zclass5_knockback,
		zclass5_onlyvip, zclass5_costAmmo, zclass5_costSouls);
}