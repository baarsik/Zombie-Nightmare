// Last edit: 23.05.2015

#if defined _zombienightmare_included
  #endinput
#endif
#define _zombienightmare_included

/* Teams for zp_register_extra_item() */
#define ZP_TEAM_ZOMBIE (1<<0)
#define ZP_TEAM_HUMAN (1<<1)

/* Game modes for zp_round_started() */
enum
{
	MODE_INFECTION = 1,
	MODE_MULTI
}

/* Winner teams for zp_round_ended() */
enum
{
	WIN_NO_ONE = 0,
	WIN_ZOMBIES,
	WIN_HUMANS
}

/* Custom forward return values */
#define ZP_PLUGIN_HANDLED 97

/**
 * Returns whether a player has VIP rights.
 *
 * @param id		Player index.
 * @return		True if it is, false otherwise.
 */
native zp_get_user_vip(id)

/**
 * Returns whether a player is a zombie.
 *
 * @param id		Player index.
 * @return		True if it is, false otherwise.
 */
native zp_get_user_zombie(id)

/**
 * Returns whether a player is the first zombie.
 *
 * @param id		Player index.
 * @return		True if it is, false otherwise.
 */
native zp_get_user_first_zombie(id)

/**
 * Returns whether a player is the last zombie.
 *
 * @param id		Player index.
 * @return		True if it is, false otherwise.
 */
native zp_get_user_last_zombie(id)

/**
 * Returns whether a player is the last human.
 *
 * @param id		Player index.
 * @return		True if it is, false otherwise.
 */
native zp_get_user_last_human(id)

/**
 * Returns a player's current zombie class ID.
 *
 * @param id		Player index.
 * @return		Internal zombie class ID, or -1 if not yet chosen.
 */
native zp_get_user_zombie_class(id)

/**
 * Returns a player's next zombie class ID (for the next infection).
 *
 * @param id		Player index.
 * @return		Internal zombie class ID, or -1 if not yet chosen.
 */
native zp_get_user_next_class(id)

/**
 * Sets a player's next zombie class ID (for the next infection).
 *
 * @param id		Player index.
 * @param classid	A valid zombie class ID.
 * @return		True on success, false otherwise.
 */
native zp_set_user_zombie_class(id, classid)

/**
 * Returns if player has bought the class.
 *
 * @param id		Player index.
 * @param classid	A valid zombie class ID.
 * @return		True if available, false otherwise.
 */
native zn_get_user_zclass_access(id, classid)

/**
 * Sets if player has bought the class.
 *
 * @param id		Player index.
 * @param classid	A valid zombie class ID.
 * @param hasaccess	If player should have an access.
 * @return		True on success, false otherwise.
 */
native zn_set_user_zclass_access(id, classid, bool:hasaccess)

/**
 * Returns a player's soul count.
 *
 * @param id		Player index.
 * @return		Number of ammo packs owned.
 */
native zp_get_user_souls(id)

/**
 * Sets a player's soul count.
 *
 * @param id		Player index.
 * @param amount	New quantity of ammo packs owned.
 */
native zp_set_user_souls(id, amount)

/**
 * Returns a player's ammo pack count.
 *
 * @param id		Player index.
 * @return		Number of ammo packs owned.
 */
native zp_get_user_ammo_packs(id)

/**
 * Sets a player's ammo pack count.
 *
 * @param id		Player index.
 * @param amount	New quantity of ammo packs owned.
 */
native zp_set_user_ammo_packs(id, amount)

/**
 * Returns the default maximum health of a zombie.
 *
 * Note: Takes into account first zombie's HP multiplier.
 *
 * @param id		Player index.
 * @return		Maximum amount of health points, or -1 if not a normal zombie.
 */
native zp_get_zombie_maxhealth(id)

/**
 * Returns a player's custom flashlight batteries charge.
 *
 * @param id		Player index.
 * @return		Charge percent (0 to 100).
 */
native zp_get_user_batteries(id)

/**
 * Sets a player's custom flashlight batteries charge.
 *
 * @param id		Player index.
 * @param value		New charge percent (0 to 100).
 */
native zp_set_user_batteries(id, charge)

/**
 * Returns whether a player has night vision.
 *
 * @param id		Player index.
 * @return		True if it has, false otherwise.
 */
native zp_get_user_nightvision(id)

/**
 * Sets whether a player has night vision.
 *
 * @param id		Player index.
 * @param set		True to give, false for removing it.
 */
native zp_set_user_nightvision(id, set)

/**
 * Forces a player to become a zombie.
 *
 * Note: Unavailable for last human/survivor.
 *
 * @param id		Player index to be infected.
 * @param infector	Player index who infected him (optional).
 * @param silent	If set, there will be no HUD messages or infection sounds.
 * @param rewards	Whether to show DeathMsg and reward frags, hp, and ammo packs to infector.
 * @return		True on success, false otherwise.
 */
native zp_infect_user(id, infector = 0, silent = 0, rewards = 0)

/**
 * Forces a player to become a human.
 *
 * Note: Unavailable for last zombie.
 *
 * @param id		Player index to be cured.
 * @param silent	If set, there will be no HUD messages or antidote sounds.
 * @return		True on success, false otherwise.
 */
native zp_disinfect_user(id, silent = 0)

/**
 * Respawns a player into a specific team.
 *
 * @param id		Player index to be respawned.
 * @param team		Team to respawn the player into (ZP_TEAM_ZOMBIE or ZP_TEAM_HUMAN).
 * @return		True on success, false otherwise.
 */
native zp_respawn_user(id, team)

/**
 * Forces a player to buy an extra item.
 *
 * @param id		Player index.
 * @param itemid	A valid extra item ID.
 * @param ignorecost	If set, item's cost won't be deduced from player.
 * @return		True on success, false otherwise.
 */
native zp_force_buy_extra_item(id, itemid, ignorecost = 0)

/**
 * Overrides ZP player model with a different custom model.
 *
 * Note: This will last until player's next infection/humanization/respawn.
 *
 * Note: Don't call more often than absolutely needed.
 *
 * @param id		Player index.
 * @param newmodel	Model name.
 * @param modelindex	Modelindex (optional).
 */
native zp_override_user_model(id, const newmodel[], modelindex = 0)

/**
 * Returns whether the ZP round has started, i.e. first zombie
 * has been chosen or a game mode has begun.
 *
 * @return		0 - Round not started
 *			1 - Round started
 *			2 - Round starting
 */
native zp_has_round_started()

/**
 * Returns number of alive zombies.
 *
 * @return		Zombie count.
 */
native zp_get_zombie_count()

/**
 * Returns number of alive humans.
 *
 * @return		Human count.
 */
native zp_get_human_count()

/**
 * Registers a custom item which will be added to the extra items menu of ZP.
 *
 * Note: The returned extra item ID can be later used to catch item
 * purchase events for the zp_extra_item_selected() forward.
 *
 * @param name		Caption to display on the menu.
 * @param cost		Ammo packs to be deducted on purchase.
 * @param teams		Bitsum of teams it should be available for.
 * @return		An internal extra item ID, or -1 on failure.
 */
native zp_register_extra_item(const name[], cost, teams)

/**
 * Registers a custom class which will be added to the zombie classes menu of ZP.
 *
 * Note: The returned zombie class ID can be later used to identify
 * the class when calling the zp_get_user_zombie_class() natives.
 *
 * @param name		Caption to display on the menu.
 * @param model		Player model to be used.
 * @param clawmodel	Claws model to be used.
 * @param hp		Initial health points.
 * @param speed		Maximum speed.
 * @param gravity	Gravity multiplier.
 * @param knockback	Knockback multiplier.
 * @return		An internal zombie class ID, or -1 on failure.
 */
native zn_register_zombie_class(const name[], const model[], const clawmodel[], hp, speed, Float:gravity, Float:knockback, bool:vip = false, costAmmo = 0, costSouls = 0)

/**
 * Registers a custom gamemode which will be added to gamemode list.
 *
 * Note: The returned gamemode ID can be later used to identify
 * the mode when calling the zp_round_started() forward.
 *
 * @param name		Caption to display on the menu.
 * @param model		Player model to be used.
 * @param clawmodel	Claws model to be used.
 * @param hp		Initial health points.
 * @param speed		Maximum speed.
 * @param gravity	Gravity multiplier.
 * @param knockback	Knockback multiplier.
 * @return		An internal zombie class ID, or -1 on failure.
 */
native zn_register_gamemode(const name[], const lighting[])

/**
 * Returns an extra item's ID.
 *
 * @param name		Item name to look for.
 * @return		Internal extra item ID, or -1 if not found.
 */
native zp_get_extra_item_id(const name[])

/**
 * Returns a zombie class' ID.
 *
 * @param name		Class name to look for.
 * @return		Internal zombie class ID, or -1 if not found.
 */
native zp_get_zombie_class_id(const name[])

/**
 * Returns player's class.
 *
 * @param id		Player index.
 * @return name		String array in which we have to write player's class.
 * @param len		Maximum characters for your array.
 */
native zn_get_user_class(id, name[], len)

/**
 * Returns server prefix.
 *
 * @return name		String array in which we have to write server prefix.
 * @param len		Maximum characters for your array.
 */
native zp_get_server_prefix(name[], len)

/**
 * Sets amount of ammo given buy one "buyammo1"/"buyammo2" command.
 *
 * @param id		Player index.
 * @param value		Amount of ammo.
 */
native zp_set_ammo_value(id, value)

/**
 * Sets cost of ammo given buy one "buyammo1"/"buyammo2" command.
 *
 * @param id		Player index.
 * @param value		Ammo cost.
 */
native zp_set_ammo_cost(id, value)

/**
 * Sets maximum amount of ammo that can be bought.
 *
 * @param id		Player index.
 * @param value		Maximum amount of ammo.
 */
native zp_set_ammo_max(id, value)

/**
 * Enables ability to infect in 1 hit.
 *
 * @param id		Player index.
 * @param ii		True/False.
 */
native zp_set_user_instainf(id, ii)

/**
 * Defines player's knife weaponkey.
 *
 * @param id		Player index.
 * @param weaponkey	Weapon key (pev_impulse).
 */
native zp_set_user_knife_weaponkey(id, weaponkey)

/**
 * Called when the ZP round starts, i.e. first zombie
 * is chosen or a game mode begins.
 *
 * @param gamemode	Mode which has started.
 * @param id		Affected player's index (if applicable).
 */
forward zp_round_started(gamemode, id)

/**
 * Called when the round ends.
 *
 * @param winteam	Team which has won the round.
 */
forward zp_round_ended(winteam)

/**
 * Called when a player gets infected.
 *
 * @param id		Player index who was infected.
 * @param infector	Player index who infected him (if applicable).
 */
forward zn_user_infected_pre(id, infector)
forward zn_user_infected_post(id, infector)

/**
 * Called when a player turns back to human.
 *
 * @param id		Player index who was cured.
 * @param survivor	Whether the player was turned into a survivor.
 */
forward zn_user_humanized_pre(id)
forward zn_user_humanized_post(id)

/**
 * Called on a player infect/cure attempt. You can use this to block
 * an infection/humanization by returning ZP_PLUGIN_HANDLED in your plugin.
 *
 * Note: Right now this is only available after the ZP round starts, since some
 * situations (like blocking a first zombie's infection) are not yet handled.
 */
forward zp_user_infect_attempt(id, infector)
forward zp_user_humanize_attempt(id)

/**
 * Called when a player buys an extra item from the ZP menu.
 *
 * Note: You can now return ZP_PLUGIN_HANDLED in your plugin to block
 * the purchase and the player will be automatically refunded.
 *
 * @param id		Player index of purchaser.
 * @param itemid	Internal extra item ID.
 */
forward zp_extra_item_selected(id, itemid)

/**
 * Called when a player gets unfrozen (frostnades).
 *
 * @param id		Player index.
 */
forward zp_user_unfrozen(id)

/**
 * Called when a player becomes the last zombie.
 *
 * Note: This is called for the first zombie too.
 *
 * @param id		Player index.
 */
forward zp_user_last_zombie(id)

/**
 * Called when a player becomes the last human.
 *
 * @param id		Player index.
 */
forward zp_user_last_human(id)

/**
 * Called when a player buys primary weapon ammo. Is used to buy non-default weapon's ammo.
 *
 * @param id		Player index.
 */
forward zp_user_buy_primammo(id)

/**
 * Called when a player buys secondary weapon ammo. Is used to buy non-default weapon's ammo.
 *
 * @param id		Player index.
 */
forward zp_user_buy_secammo(id)

/**
 * @deprecated - Do not use!
 * For backwards compatibility only.
 */
#define ZP_TEAM_ANY 0
