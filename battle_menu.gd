extends Node

var gold := 0

var items = {}

func add_item(item_name:String, amount:=1):

	if items.has(item_name):
		items[item_name] += amount
	else:
		items[item_name] = amount

func remove_item(item_name:String):

	if !items.has(item_name):
		return

	items[item_name] -= 1

	if items[item_name] <= 0:
		items.erase(item_name)

func has_item(item_name:String):

	return items.has(item_name)
