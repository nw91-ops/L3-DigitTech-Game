func victory():

	var exp_reward = 50
	var gold_reward = 25

	var drops = []

	if randf() < 0.5:
		drops.append(potion)

	Inventory.gold += gold_reward

	for player in player_party:
		player.gain_experience(exp_reward)

	for item in drops:
		Inventory.add_item(item)

	victory_screen.show_victory(
		exp_reward,
		gold_reward,
		drops
	)
