func level_up():

	level += 1

	print(character_name + " reached Level " + str(level) + "!")

	# Increase base stats
	base_max_hp += 20
	base_max_mp += 5

	base_attack += 3
	base_defense += 2
	base_speed += 1

	# Fully heal player
	hp = base_max_hp
	mp = base_max_mp

	# Increase EXP needed
	experience_needed = int(experience_needed * 1.25)

	update_stats()

	health_changed.emit(hp, base_max_hp)
	mana_changed.emit(mp, base_max_mp)
