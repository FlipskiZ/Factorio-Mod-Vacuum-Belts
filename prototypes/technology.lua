data:extend({
  {
  type = "technology",
  name = "vacuum-logistics-4",
  icon_size = 128,
  icon = "__base__/graphics/technology/logistics.png",
  effects =
  {
	{
		type = "unlock-recipe",
		recipe = "vacuum-transport-belt"
	},
	{
		type = "unlock-recipe",
		recipe = "vacuum-underground-belt"
	},
	{
		type = "unlock-recipe",
		recipe = "vacuum-splitter"
	}
  },
  prerequisites = {"logistics-3"},
  unit =
  {
	count = 600,
	ingredients =
	{
	  {"science-pack-1", 1},
	  {"science-pack-2", 1},
	  {"science-pack-3", 1},
	  {"production-science-pack", 1}
	},
	time = 30
  },
  order = "a-f-d"
  }
})