extends Control

@export var inventory : Inventory

@export var potion : Item
@export var hi_potion : Item
@export var ether : Item

@onready var gold_label = $GoldLabel


func _ready():
	update_gold()


func update_gold():

	gold_label.text = "Gold: " + str(inventory.gold)
	
	extends Control

@export var inventory : Inventory

@export var potion : Item
@export var hi_potion : Item
@export var ether : Item

@onready var gold_label = $GoldLabel


func _ready():
	update_gold()


func update_gold():

	gold_label.text = "Gold: " + str(inventory.gold)
