func process_status_effects():

	if is_burned:

		var burn_damage = int(max_hp * burn_damage_percent)

		burn_damage = max(burn_damage, 1)

		print(character_name + " takes " + str(burn_damage) + " burn damage!")

		take_status_damage(burn_damage)

		burn_turns -= 1

		if burn_turns <= 0:

			is_burned = false

			print(character_name + " is no longer burned!")
