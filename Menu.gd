extends Control

@onready var options: Window_Default = $Options
@onready var _options_menu: Menu = $Options/Options

func _ready() -> void:
	_options_menu.connect_to_buttons()
	_options_menu.button_focus(0)


