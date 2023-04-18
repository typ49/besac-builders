#Réinitialisation de la durée de vie des area_effect_cloud servant de portails
execute as @e[type=area_effect_cloud,tag=portail] run data modify entity @s Age set value 0

#Réinitialisation de la durée de vie des area_effect_cloud servant de transfert d'objets
execute as @e[type=area_effect_cloud,tag=transfert_besancon] at @s if block ~ ~ ~ hopper run data modify entity @s Age set value 0

#Réinitialisation de la durée de vie des area_effect_cloud servant de coffres personnels
execute as @e[type=area_effect_cloud,tag=coffre_personnel] at @s if block ~ ~ ~ ironchests:copper_chest run data modify entity @s Age set value 0

#Réinitialisation de la durée de vie des area_effect_cloud servant de récupérateur d'inventaire
execute as @e[type=area_effect_cloud,tag=coffre_personnel,tag=partie_A] at @s if block ~ ~ ~ chest if score @s besac-builders_id_joueur = @e[type=area_effect_cloud,tag=coffre_personnel,tag=partie_B,limit=1,sort=nearest] besac-builders_id_joueur run data modify entity @s Age set value 0
execute as @e[type=area_effect_cloud,tag=coffre_personnel,tag=partie_B] at @s if block ~ ~ ~ chest if score @s besac-builders_id_joueur = @e[type=area_effect_cloud,tag=coffre_personnel,tag=partie_A,limit=1,sort=nearest] besac-builders_id_joueur run data modify entity @s Age set value 0

#Actualisation du contenu des transferts d'objets
scoreboard players add @e[type=area_effect_cloud,tag=transfert_besancon] transfer_timer 1
execute as @e[type=area_effect_cloud,tag=transfert_besancon,scores={transfer_timer=1000..},limit=1,sort=random] at @s run function besac_builders:monde_survie/transfer_items

#Attribution d'un identifiant unique à chaque nouveau joueur
execute as @a unless score @s besac-builders_id_joueur matches 0.. run function besac_builders:give_new_id

#Téléportation des joueurs qui s'approchent d'un portail
execute as @a at @s if entity @e[type=area_effect_cloud,tag=vers_survie,distance=..0.6,limit=1,sort=nearest] run function besac_builders:monde_survie/travel_to_survival
execute as @a at @s if entity @e[type=area_effect_cloud,tag=vers_creatif,distance=..0.6,limit=1,sort=nearest] run function besac_builders:monde_creatif/travel_to_creative
execute as @a at @s if entity @e[type=area_effect_cloud,tag=vers_besancon,distance=..0.6,limit=1,sort=nearest] run function besac_builders:monde_besancon/travel_to_besancon

#Extensions de la fonction "tick" si au moins un joueur est présent dans les différents mondes
execute if entity @r[predicate=besac_builders:dans_monde_survie] run function besac_builders:monde_survie/tick_survival
execute if entity @r[predicate=besac_builders:dans_monde_creatif] run function besac_builders:monde_creatif/tick_creative
execute if entity @r[predicate=besac_builders:dans_monde_besancon] run function besac_builders:monde_besancon/tick_besancon