# mt-rooster
QBCore simple rooster job.

# Preview:
- https://www.youtube.com/watch?v=0z0nJU8gQrw

# Installation:

Add to qb-core/shared/items.lua:
```
	-- mt-rooster
	["rooster_frango"]  	= {["name"] = "rooster_frango", 			["label"] = "Alive Chicken", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "rooster_frango.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["rooster_frango_morto"]  	= {["name"] = "rooster_frango_morto", 			["label"] = "Dead Chicken", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "rooster_frango_morto.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["rooster_frango_depenado"]  	= {["name"] = "rooster_frango_depenado", 			["label"] = "Plucked Chicken", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "rooster_frango_depenado.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["rooster_frango_carne"]  	= {["name"] = "rooster_frango_carne", 			["label"] = "Chicken Meat", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "rooster_frango_carne.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```

Add to qb-core/shared/jobs.lua
```
    ['rooster'] = {
		label = 'Rooster',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Rooster',
                payment = 50
            },
        },
	},
}
```

Add images to qb-inventory/html/images

# Dependicies:
- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target
