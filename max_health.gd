func take_damage(amount:int):

	var damage = max(amount - defense, 1)

	if defending:
		damage /= 2

	hp -= damage
	hp = max(hp,0)

	defending = false

	health_changed.emit(hp, max_hp)
