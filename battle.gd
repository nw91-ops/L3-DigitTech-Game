extends Control

@onready var options: Window_Default = $Options
@onready var _options_menu: Menu = $Options/Options

func _ready() -> void:
	_options_menu.connect_to_buttons(self)
	_options_menu.button_focus(0)

extends Node

@onready var player = $Player
@onready var enemy = $Enemy

var turn_order = []
var current_turn = 0

func _ready():
	start_battle()

func start_battle():
	turn_order = [player, enemy]

	# Highest speed goes first
	turn_order.sort_custom(
		func(a, b):
			return a.speed > b.speed
	)

	start_turn()

func start_turn():
	var current_character = turn_order[current_turn]

	if current_character.is_dead():
		next_turn()
		return

	print(current_character.character_name + "'s turn")

	if current_character == player:
		player_attack()
	else:
		enemy_attack()

func player_attack():
	print("Player attacks!")

	enemy.take_damage(player.attack)

	print(enemy.character_name + " HP: " + str(enemy.current_hp))

	check_battle_end()
	next_turn()

func enemy_attack():
	print("Enemy attacks!")

	player.take_damage(enemy.attack)

	print(player.character_name + " HP: " + str(player.current_hp))

	check_battle_end()
	next_turn()

func next_turn():
	current_turn += 1

	if current_turn >= turn_order.size():
		current_turn = 0

	start_turn()

func check_battle_end():
	if player.is_dead():
		print("Game Over")
		set_process(false)

	if enemy.is_dead():
		print("Victory!")
		set_process(false)
