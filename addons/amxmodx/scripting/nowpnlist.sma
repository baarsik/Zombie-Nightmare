#include <amxmodx>

public plugin_init() {
	register_plugin("No weapon list", "1.1", "BaRSiK")
	set_msg_block(get_user_msgid("WeapPickup"), BLOCK_SET)
	set_msg_block(get_user_msgid("AmmoPickup"), BLOCK_SET)
	set_msg_block(get_user_msgid("ItemPickup"), BLOCK_SET)
}