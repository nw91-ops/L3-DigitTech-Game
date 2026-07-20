extends Character

class_name Enemy

@export var heal_skill : Skill
@export var attack_skill : Skill
@export var special_skill : Skill

@export var heal_threshold := 0.30
@export var special_chance := 0.25

func take_turn(players:Array[Character]):

	if is_dead():
		return

	# Heal if low health
	if float(hp) / max_hp <= heal_threshold:

		if heal_skill != null and mp >= heal_skill.mp_cost:

			use_skill(heal_skill, self)
			return

	# Chance to use a special attack
	if randf() <= special_chance:

		if special_skill != null and mp >= special_skill.mp_cost:

			var target = choose_target(players)

			if target:
				use_skill(special_skill, target)
				return

	# Default attack
	var target = choose_target(players)

	if target:

		if attack_skill != null and mp >= attack_skill.mp_cost:
			use_skill(attack_skill, target)
		else:
			attack_target(target)
			
			func take_turn(players:Array[Character]):

	var hp_percent = float(hp) / max_hp

	if hp_percent < 0.20:

		print(character_name + " has become enraged!")

		attack += 5

		var target = choose_weakest_target(players)
		use_skill(special_skill, target)

	elif hp_percent < 0.50:

		if randf() < 0.5:
			use_skill(special_skill, choose_target(players))
		else:
			attack_target(choose_target(players))

	else:

		attack_target(choose_target(players))
