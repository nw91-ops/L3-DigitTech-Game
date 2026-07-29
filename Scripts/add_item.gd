func add_item(item : Item, amount := 1):

	# Look for existing stack

	for slot in slots:

		if slot.item == item:

			if slot.amount < item.max_stack:

				slot.amount += amount

				return

	# Empty slot

	for slot in slots:

		if slot.item == null:

			slot.item = item
			slot.amount = amount

			return

	print("Inventory Full!")
