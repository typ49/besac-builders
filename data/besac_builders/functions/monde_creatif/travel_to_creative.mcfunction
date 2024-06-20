tag @s add teleportation_en_cours
execute if predicate besac_builders:dans_monde_survie run scoreboard players operation #id_recuperateur besac-builders_id_joueur = @s besac-builders_id_joueur
execute if predicate besac_builders:dans_monde_survie as @e[type=area_effect_cloud,tag=coffre_recuperation] if score @s besac-builders_id_joueur = #id_recuperateur besac-builders_id_joueur as @a[tag=teleportation_en_cours] run tag @s add possede_un_coffre
#execute as @s[tag=possede_un_coffre] run function besac_builders:monde_survie/inventory_to_personnal_chest 
execute as @s[tag=possede_un_coffre] run saveinventory

tellraw @s[tag=!possede_un_coffre,tag=!besac_admin] {"text":"Pour pouvoir sortir du monde survie, fabrique puis place un téléporteur quelque-part.","color":"yellow"}
tp @s[tag=!possede_un_coffre,tag=!besac_admin] @e[type=area_effect_cloud,limit=1,sort=nearest]
execute as @s[tag=!possede_un_coffre,tag=!besac_admin] at @s run tp @s ^ ^ ^1.5
effect clear @s[tag=possede_un_coffre]

#execute if predicate besac_builders:dans_monde_besancon run data modify block 97 97 97 Items set from entity @s[tag=!besac_admin] Inventory
#execute if predicate besac_builders:dans_monde_besancon run item replace block 97 97 97 container.50 from entity @s[tag=!besac_admin] weapon.offhand
#execute if predicate besac_builders:dans_monde_besancon run clear @s[tag=!besac_admin]

tp @s[tag=possede_un_coffre,predicate=besac_builders:dans_monde_survie] @e[type=area_effect_cloud,tag=spawn_creative,limit=1]
tp @s[predicate=besac_builders:dans_monde_besancon] @e[type=area_effect_cloud,tag=spawn_creative,limit=1]
tp @s[tag=besac_admin] @e[type=area_effect_cloud,tag=spawn_creative,limit=1]
tag @s remove possede_un_coffre
tag @s remove teleportation_en_cours