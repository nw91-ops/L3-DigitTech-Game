extends Resource
class_name Item

@export var item_name : String
@export var description : String
@export var icon : Texture2D

@export var max_stack := 99

enum ItemType{
	CONSUMABLE,
	WEAPON,
	ARMOR,
	KEY_ITEM
}

@export var type : ItemType

@export var heal_hp := 0
@export var heal_mp := 0
@export var sell_price := 10
