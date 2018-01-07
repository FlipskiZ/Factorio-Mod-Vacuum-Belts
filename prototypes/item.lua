data:extend({
  {
    type = "item",
    name = "vacuum-transport-belt",
    icon = "__VacuumBelts__/graphics/icons/vacuum-transport-belt.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "vacuum-belt",
    order = "a[transport-belt]-d[vacuum-transport-belt]",
    place_result = "vacuum-transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "vacuum-underground-belt",
    icon = "__VacuumBelts__/graphics/icons/vacuum-transport-belt-to-ground.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "vacuum-belt",
    order = "b[underground-belt]-d[vacuum-underground-belt]",
    place_result = "vacuum-underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "vacuum-splitter",
    icon = "__VacuumBelts__/graphics/icons/vacuum-splitter.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "vacuum-belt",
    order = "c[splitter]-d[vacuum-splitter]",
    place_result = "vacuum-splitter",
    stack_size = 50
  },
})