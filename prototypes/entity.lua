ending_patch_prototype =
  {
    sheet = 
    {
      filename = "__VacuumBelts__/graphics/entity/transport-belt/start-end-integration-patches.png",
      width = 40,
      height = 40,
      priority = "extra-high"
    }
  }

vacuum_belt_horizontal =
  {
    filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32
  }
vacuum_belt_vertical =
  {
    filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 40
  }
vacuum_belt_ending_top =
  {
    filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 80
  }
vacuum_belt_ending_bottom =
  {
    filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 120
  }
vacuum_belt_ending_side =
  {
    filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 160
  }
vacuum_belt_starting_top =
  {
    filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 200
  }
vacuum_belt_starting_bottom =
  {
    filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 240
  }
vacuum_belt_starting_side =
  {
    filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 32,
    y = 280
  }

data:extend({
  {
    type = "transport-belt",
    name = "vacuum-transport-belt",
    icon = "__VacuumBelts__/graphics/icons/vacuum-transport-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "vacuum-transport-belt"},
    max_health = 100,
    corpse = "small-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/express-transport-belt.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 3
    },
    animation_speed_coefficient = 32,
    animations =
    {
      filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 32,
      direction_count = 12
    },
    belt_horizontal = vacuum_belt_horizontal,
    belt_vertical = vacuum_belt_vertical,
    ending_top = vacuum_belt_ending_top,
    ending_bottom = vacuum_belt_ending_bottom,
    ending_side = vacuum_belt_ending_side,
    starting_top = vacuum_belt_starting_top,
    starting_bottom = vacuum_belt_starting_bottom,
    starting_side = vacuum_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = settings.startup["vacuum-belt-speed"].value * 3 / 1280,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector_sprites = transport_belt_circuit_connector_sprites,
    circuit_wire_connection_point = transport_belt_circuit_wire_connection_point,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },

  {
    type = "underground-belt",
    name = "vacuum-underground-belt",
    icon = "__VacuumBelts__/graphics/icons/vacuum-transport-belt-to-ground.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "vacuum-underground-belt"},
    max_health = 120,
    corpse = "small-remnants",
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    underground_remove_belts_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances = 
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.15}, {0.4, 0.1}},
    selection_box = {{-0.5, -0.25}, {0.5, 0.75}},
    distance_to_enter = 0.5,
    animation_speed_coefficient = 32,
    belt_horizontal = vacuum_belt_horizontal,
    belt_vertical = vacuum_belt_vertical,
    ending_top = vacuum_belt_ending_top,
    ending_bottom = vacuum_belt_ending_bottom,
    ending_side = vacuum_belt_ending_side,
    starting_top = vacuum_belt_starting_top,
    starting_bottom = vacuum_belt_starting_bottom,
    starting_side = vacuum_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = settings.startup["vacuum-belt-speed"].value * 3 / 1280,
    max_distance = 20,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt-to-ground-structure.png",
          priority = "extra-high",
          shift = {0.26, 0},
          width = 57,
          height = 43,
          y = 43
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-transport-belt-to-ground-structure.png",
          priority = "extra-high",
          shift = {0.26, 0},
          width = 57,
          height = 43
        }
      }
    },
  },

  {
    type = "splitter",
    name = "vacuum-splitter",
    icon = "__VacuumBelts__/graphics/icons/vacuum-splitter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "vacuum-splitter"},
    max_health = 160,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.9, -0.1}, {0.9, 0.1}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    belt_horizontal = vacuum_belt_horizontal,
    belt_vertical = vacuum_belt_vertical,
    ending_top = vacuum_belt_ending_top,
    ending_bottom = vacuum_belt_ending_bottom,
    ending_side = vacuum_belt_ending_side,
    starting_top = vacuum_belt_starting_top,
    starting_bottom = vacuum_belt_starting_bottom,
    starting_side = vacuum_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = settings.startup["vacuum-belt-speed"].value * 3 / 1280,
    structure =
    {
      north =
      {
        filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 80,
        height = 35,
        shift = {0.225, 0}
      },
      east =
      {
        filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 46,
        height = 81,
        shift = {0.075, 0}
      },
      south =
      {
        filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 82,
        height = 36,
        shift = {0.075, 0}
      },
      west =
      {
        filename = "__VacuumBelts__/graphics/entity/transport-belt/vacuum-splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 47,
        height = 79,
        shift = {0.25, 0.05}
      },
    },
  },
})