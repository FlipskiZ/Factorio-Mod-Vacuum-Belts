data:extend({
    {
        type = "double-setting",
        name = "vacuum-belt-speed",
        setting_type = "startup",
        minimum_value = 0,
        default_value = 120
    },
	{
		type = "bool-setting",
		name = "vacuum-remove-pump",
		setting_type = "startup",
		default_value = false,
    },
    {
		type = "bool-setting",
		name = "vacuum-remove-restriction",
		setting_type = "runtime-global",
		default_value = false,
    }
})