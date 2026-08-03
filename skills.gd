func check_for_new_skills():

	for learnable in learnable_skills:

		if level >= learnable.level_required:

			if !skills.has(learnable.skill):

				skills.append(learnable.skill)

				print(character_name + " learned " + learnable.skill.skill_name + "!")
				
				func level_up():

	level += 1

	base_max_hp += 20
	base_max_mp += 5

	base_attack += 3
	base_defense += 2
	base_speed += 1

	hp = base_max_hp
	mp = base_max_mp

	update_stats()

	check_for_new_skills()

	print(character_name + " reached Level " + str(level))
