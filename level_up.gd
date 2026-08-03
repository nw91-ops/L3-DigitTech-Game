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
	
	func level_up():

	level += 1

	# Award 5 stat points
	stat_points += 5

	# Restore HP and MP
	hp = base_max_hp
	mp = base_max_mp

	experience_needed = int(experience_needed * 1.25)

	check_for_new_skills()

	print(character_name + " reached Level " + str(level) + "!")
	print("You have " + str(stat_points) + " stat points to spend.")

	health_changed.emit(hp, base_max_hp)
	mana_changed.emit(mp, base_max_mp)
	
	func increase_hp():

	if stat_points <= 0:
		return

	base_max_hp += 10
	stat_points -= 1

	hp = min(hp + 10, base_max_hp)

	health_changed.emit(hp, base_max_hp)
