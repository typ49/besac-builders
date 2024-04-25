scoreboard players reset @s placed_copper_chest
tag @s add place_un_coffre
scoreboard players operation #id_coffre_redondant besac-builders_id_joueur = @s besac-builders_id_joueur
execute if block ~ ~ ~ ironchest:copper_chest{CustomName:'{"text":"Coffre de récupération"}'} align xyz unless entity @e[type=area_effect_cloud,tag=coffre_recuperation,distance=..1] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Duration:10,Tags:["coffre_recuperation","nouveau"]}
scoreboard players operation @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau] besac-builders_id_joueur = @s besac-builders_id_joueur

#Empêcher la pose si un coffre existe déjà ou si le joueur est dans le Nether ou l'End, puis avertir ce dernier
execute as @e[type=area_effect_cloud,tag=coffre_recuperation,tag=!nouveau,predicate=!besac_builders:dans_nether_ou_end] if score @s besac-builders_id_joueur = #id_coffre_redondant besac-builders_id_joueur run tag @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau] add redondant
execute as @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,predicate=besac_builders:dans_nether_ou_end] run tag @s add redondant
execute as @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,predicate=!besac_builders:dans_nether_ou_end,tag=redondant] if score @s besac-builders_id_joueur = #id_coffre_redondant besac-builders_id_joueur as @a[tag=place_un_coffre] run tellraw @s [{"text":"Tu possèdes déjà un coffre de récupération en ","color":"yellow"},{"score":{"name":"@s","objective":"coordonnees_recuperateur_X"},"color":"red"},"/",{"score":{"name":"@s","objective":"coordonnees_recuperateur_Y"},"color":"green"},"/",{"score":{"name":"@s","objective":"coordonnees_recuperateur_Z"},"color":"blue"},{"text":"\nDétruis-le si tu veux en poser un autre.","color":"yellow"}]
execute if entity @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,predicate=besac_builders:dans_nether_ou_end] run tellraw @s [{"text":"Tu ne peux pas poser de coffre de récupération\ndans le ","color":"yellow"},{"text":"Nether","color":"dark_red"},{"text":" ou l'","color":"yellow"},{"text":"End","color":"dark_blue"}]

execute if entity @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,tag=!redondant] store result score @s coordonnees_recuperateur_X run data get entity @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,tag=!redondant,limit=1] Pos[0]
execute if entity @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,tag=!redondant] store result score @s coordonnees_recuperateur_Y run data get entity @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,tag=!redondant,limit=1] Pos[1]
execute if entity @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,tag=!redondant] store result score @s coordonnees_recuperateur_Z run data get entity @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,tag=!redondant,limit=1] Pos[2]
execute if entity @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,tag=!redondant] run tellraw @s [{"text":"Coffre de récupération placé en ","color":"yellow"},{"score":{"name":"@s","objective":"coordonnees_recuperateur_X"},"color":"red"},"/",{"score":{"name":"@s","objective":"coordonnees_recuperateur_Y"},"color":"green"},"/",{"score":{"name":"@s","objective":"coordonnees_recuperateur_Z"},"color":"blue"}]

execute at @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau,tag=!redondant] run forceload add ~ ~
tag @e[type=area_effect_cloud,tag=coffre_recuperation,tag=nouveau] remove nouveau
tag @s remove place_un_coffre
execute if entity @p[distance=..10] unless block ~ ~ ~ ironchest:copper_chest positioned ^ ^ ^0.05 run function besac_builders:monde_survie/raycast_copper_chest
execute at @e[type=area_effect_cloud,tag=coffre_recuperation,tag=redondant] run setblock ~ ~ ~ air destroy
