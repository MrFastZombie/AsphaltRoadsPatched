local cost_lvl = settings.startup["AR-research-cost"].value
local useAdv = settings.startup["AR-require-adv-oil-processing"].value

local research_cost = {
	["level-0"] = {
		unit = {
			count = 250,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 30},
		prerequisites = {
			"concrete", 
			"oil-processing"
		}},
	["level-1"] = {
		unit = {
			count = 300,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 45},
		prerequisites = {
			"concrete", 
			"chemical-science-pack"
		}},
	["level-2"] = {
		unit = {
			count = 350,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"production-science-pack", 1}
			},
			time = 60},
		prerequisites = {
			"concrete", 
			"production-science-pack"
		}}
	}

	if useAdv then 
		research_cost["level-1"].prerequisites[2] = "advanced-oil-processing"
		research_cost["level-2"].prerequisites[3] = "advanced-oil-processing"
	end

data:extend(
{
    {
        type = "technology",
        name = "Arci-asphalt",
        icon = "__AsphaltRoadsPatched__/graphics/technology/tech-asphalt.png",
        icon_size = 128,
        prerequisites = research_cost[cost_lvl].prerequisites,
        unit = research_cost[cost_lvl].unit,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "Arci-asphalt"
            }
        },
        order = "c-c-d"	
    } 
}
)	

	  
	  