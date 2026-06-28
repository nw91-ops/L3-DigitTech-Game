extends Control

@onready var options: Window_Default = $Options
@onready var _options_menu: Menu = $Options/Options

func _ready() -> void:
	_options_menu.connect_to_buttons()
	_options_menu.button_focus(0)

extends Node

class_name Character

@export var character_name : String
@export var max_hp := 100
@export var max_mp := 25
@export var attack := 15
@export var defense := 5
@export var speed := 10

var hp : int
var mp : int
var defending := false

func _ready():
	hp = max_hp
	mp = max_mp

func take_damage(amount:int):

	var damage = max(amount - defense, 1)

	if defending:
		damage /= 2

	hp -= damage
	hp = max(hp,0)

	print(character_name + " took " + str(damage) + " damage!")

	defending = false

func heal(amount:int):

	hp += amount
	hp = min(hp,max_hp)

	print(character_name + " healed " + str(amount))

func defend():

	defending = true

	print(character_name + " is defending!")

func is_dead():

	return hp <= 0
