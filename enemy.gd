func _ready():

	match enemy_type:

		EnemyType.SLIME:
			character_name = "Slime"

			base_max_hp = 30
			base_attack = 6
			base_defense = 1
			base_speed = 5

		EnemyType.GOBLIN:
			character_name = "Goblin"

			base_max_hp = 55
			base_attack = 12
			base_defense = 4
			base_speed = 8

	update_stats()

	hp = base_max_hp
	mp = base_max_mp

Character Name: Slime

Max HP: 30
Attack: 8
Defense: 2
Speed: 6

EXP Reward: 10
Gold Reward: 5
