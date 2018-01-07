if not settings.startup["vacuum-remove-pump"].value then
	data:extend({
	  {
		type = "recipe",
		name = "vacuum-transport-belt",
		enabled = "false",
		ingredients =
		{
		  {"express-transport-belt", 4},
		  {"pump", 1},
		  {"plastic-bar", 4},
		  {"iron-gear-wheel", 40},
		},
		result_count = 4,
		result = "vacuum-transport-belt"
	  },
	  {
		type = "recipe",
		name = "vacuum-underground-belt",
		enabled = "false",
		energy_required = 2,
		ingredients =
		{
		  {"express-underground-belt", 2},
		  {"pump", 1},
		  {"plastic-bar", 5},
		  {"iron-gear-wheel", 80},
		},
		result_count = 2,
		result = "vacuum-underground-belt"
	  },
	  {
		type = "recipe",
		name = "vacuum-splitter",
		enabled = "false",
		energy_required = 2,
		ingredients =
		{
		  {"express-splitter", 1},
		  {"processing-unit", 2},
		  {"pump", 1},
		  {"plastic-bar", 5},
		  {"iron-gear-wheel", 20},
		},
		result = "vacuum-splitter"
	  },
	})
else
	data:extend({
	  {
		type = "recipe",
		name = "vacuum-transport-belt",
		enabled = "false",
		ingredients =
		{
		  {"express-transport-belt", 1},
		  {"plastic-bar", 1},
		  {"iron-gear-wheel", 10},
		},
		result = "vacuum-transport-belt"
	  },
	  {
		type = "recipe",
		name = "vacuum-underground-belt",
		enabled = "false",
		energy_required = 2,
		ingredients =
		{
		  {"express-underground-belt", 2},
		  {"plastic-bar", 5},
		  {"iron-gear-wheel", 80},
		},
		result_count = 2,
		result = "vacuum-underground-belt"
	  },
	  {
		type = "recipe",
		name = "vacuum-splitter",
		enabled = "false",
		energy_required = 2,
		ingredients =
		{
		  {"express-splitter", 1},
		  {"processing-unit", 2},
		  {"plastic-bar", 5},
		  {"iron-gear-wheel", 20},
		},
		result = "vacuum-splitter"
	  },
	})
end