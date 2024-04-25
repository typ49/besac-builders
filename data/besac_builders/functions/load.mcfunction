scoreboard objectives add besac-builders_id_joueur dummy
execute unless score #prochain_id besac-builders_id_joueur matches 0.. run scoreboard players set #prochain_id besac-builders_id_joueur 1
scoreboard objectives add placed_hopper minecraft.used:minecraft.hopper
scoreboard objectives add placed_copper_chest minecraft.used:ironchest.copper_chest
scoreboard objectives add forge_attempt minecraft.custom:minecraft.interact_with_anvil
scoreboard objectives add transfer_timer dummy
scoreboard objectives add coordonnees_recuperateur_X dummy
scoreboard objectives add coordonnees_recuperateur_Y dummy
scoreboard objectives add coordonnees_recuperateur_Z dummy
scoreboard objectives add donnees dummy
