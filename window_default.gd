class_name Window_Default extends NinePatchRect

extends Node

@onready var player = $Player
@onready var enemy = $Enemy

enum{
	ATTACK,
	HEAL,
	DEFEND
}

var state

func _ready():

	start_battle()

func start_battle():

	state = BattleState.BattleState.PLAYER_TURN

	player_turn()

func player_turn():

	print("------------------")
	print("PLAYER TURN")
	print("------------------")

	# Eventually replace this with buttons
	player_choice(ATTACK)

func enemy_turn():

	print("------------------")
	print("ENEMY TURN")
	print("------------------")

	var move = randi_range(0,2)

	match move:

		ATTACK:
			print("Enemy attacks!")
			player.take_damage(enemy.attack)

		HEAL:
			enemy.heal(15)

		DEFEND:
			enemy.defend()

	check_end()

	state = BattleState.BattleState.PLAYER_TURN

	player_turn()

func player_choice(choice):

	match choice:

		ATTACK:

			print("Player attacks!")

			enemy.take_damage(player.attack)

		HEAL:

			player.heal(20)

		DEFEND:

			player.defend()

	check_end()

	state = BattleState.BattleState.ENEMY_TURN

	enemy_turn()

func check_end():

	if enemy.is_dead():

		state = BattleState.BattleState.VICTORY

		print("Victory!")

		get_tree().paused = true

	if player.is_dead():

		state = BattleState.BattleState.DEFEAT

		print("Defeat!")

		get_tree().paused = true
