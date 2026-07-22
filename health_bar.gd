extends Control

@export var character : Character

@onready var health_bar : ProgressBar = $ProgressBar
@onready var hp_label : Label = $Label


func _ready():
	update_health()


func update_health():

	if character == null:
		return

	health_bar.max_value = character.max_hp
	health_bar.value = character.hp

	hp_label.text = str(character.hp) + " / " + str(character.max_hp)
