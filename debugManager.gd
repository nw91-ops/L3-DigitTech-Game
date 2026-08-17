extends Node
class_name DebugManager

@export var player: Character
@export var inventory: Inventory

var current_enemy: Character


func set_current_enemy(enemy: Character):
	current_enemy = enemy


func heal_player():
	if player == null:
		return

	player.heal(9999)
	print("[DEBUG] Player fully healed")


func damage_player(amount: int = 10):
	if player == null:
		return

	player.take_damage(amount)
	print("[DEBUG] Player took " + str(amount) + " damage")


func add_exp(amount: int = 100):
	if player == null:
		return

	player.gain_experience(amount)
	print("[DEBUG] Added " + str(amount) + " EXP")


func force_level_up():
	if player == null:
		return

	player.level_up()
	print("[DEBUG] Forced level up")


func add_gold(amount: int = 100):
	if inventory == null:
		return

	inventory.gold += amount
	print("[DEBUG] Added " + str(amount) + " gold")


func add_potion(potion: Item, amount: int = 5):
	if inventory == null or potion == null:
		return

	inventory.add_item(potion, amount)
	print("[DEBUG] Added " + str(amount) + " " + potion.item_name)


func burn_player():
	if player == null:
		return

	player.apply_burn()
	print("[DEBUG] Player burned")


func kill_enemy():
	if current_enemy == null:
		print("[DEBUG] No enemy selected")
		return

	current_enemy.take_status_damage(current_enemy.hp)
	print("[DEBUG] Enemy defeated")


func kill_player():
	if player == null:
		return

	player.take_status_damage(player.hp)
	print("[DEBUG] Player defeated")
	
	func _unhandled_input(event):

	if !OS.is_debug_build():
		return

	if event is InputEventKey and event.pressed:

		if event.keycode == KEY_H:
			heal_player()

		elif event.keycode == KEY_J:
			damage_player(10)

		elif event.keycode == KEY_E:
			add_exp(50)

		elif event.keycode == KEY_L:
			force_level_up()

		elif event.keycode == KEY_G:
			add_gold(100)

		elif event.keycode == KEY_B:
			burn_player()

		elif event.keycode == KEY_K:
			kill_enemy()
