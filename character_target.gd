func attack_target(target: Character):

	if target == null:
		return

	var damage = attack
	var critical = false

	if is_critical_hit():

		critical = true
		damage = int(damage * critical_multiplier)

		print("CRITICAL HIT!")

	else:

		print("Normal Hit!")

	target.take_damage(damage, critical)
