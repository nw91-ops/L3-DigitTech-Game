extends CanvasLayer

signal continue_pressed

@onready var title = $Panel/TitleLabel
@onready var exp_label = $Panel/ExperienceLabel
@onready var gold_label = $Panel/GoldLabel
@onready var items_label = $Panel/ItemsLabel
@onready var continue_button = $Panel/ContinueButton


func show_victory(exp_gain:int, gold_gain:int, items:Array):

	visible = true

	title.text = "Victory!"
	exp_label.text = "Experience: +" + str(exp_gain)
	gold_label.text = "Gold: +" + str(gold_gain)

	if items.is_empty():
		items_label.text = "Items: None"
	else:
		items_label.text = "Items:\n"

		for item in items:
			items_label.text += "- " + item.item_name + "\n"

	continue_button.grab_focus()


func _on_continue_button_pressed():

	visible = false
	continue_pressed.emit()
