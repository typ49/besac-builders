tag @s add teleportation_en_cours
scoreboard players operation #id_destination besac-builders_id_joueur = @s besac-builders_id_joueur
#execute if predicate besac_builders:dans_monde_besancon run data modify block 97 97 97 Items set from entity @s[tag=!besac_admin] Inventory
#execute if predicate besac_builders:dans_monde_besancon run item replace block 97 97 97 container.50 from entity @s[tag=!besac_admin] weapon.offhand
clear @s
effect clear @s
scoreboard players set succes_commande donnees 0
execute store success score succes_commande donnees as @e[type=area_effect_cloud,tag=coffre_recuperation] if score @s besac-builders_id_joueur = #id_destination besac-builders_id_joueur run tp @a[tag=teleportation_en_cours] @s
execute if score succes_commande donnees matches 1.. run tp @s ~ ~1 ~
execute if score succes_commande donnees matches 0..0 run tp @s @e[type=area_effect_cloud,tag=spawn_survival,limit=1]
scoreboard players reset #id_destination besac-builders_id_joueur
tag @s remove teleportation_en_cours