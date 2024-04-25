scoreboard players reset @s forge_attempt
execute at @s[nbt={SelectedItem:{id:"ironchest:copper_chest"}}] run playsound minecraft:block.anvil.land block @s ~ ~ ~ 1 1
item replace entity @s[nbt={SelectedItem:{id:"ironchest:copper_chest"}}] weapon with ironchest:copper_chest{display:{Name:'{"text":"Coffre de récupération"}'}} 1
execute at @s[nbt={SelectedItem:{id:"minecraft:hopper"}}] run playsound minecraft:block.anvil.land block @s ~ ~ ~ 1 1
item replace entity @s[nbt={SelectedItem:{id:"minecraft:hopper"}}] weapon with hopper{display:{Name:'{"text":"Transfert vers Besançon"}'}} 1
