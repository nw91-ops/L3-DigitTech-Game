extends Node
class_name Character

signal health_changed(current_hp, max_hp)
signal mana_changed(current_mp, max_mp)
signal died

@export var character_name : String = "Hero"

# Stats
@export var level : int = 1
@export var max_hp : int = 100
@export var max_mp : int = 20

@export var attack : int = 15
@export var defense : int = 5
@export var speed : int = 10

# Experience
@export var experience : int = 0
@export var experience_to_next : int = 100

# Skills
@export var skills : Array[Skill]

# Current stats
var hp : int
var mp : int
var defending : bool = false


func _ready():
	hp = max_hp
	mp = max_mp

	health_changed.emit(hp, max_hp)
	mana_changed.emit(mp, max_mp)


func attack_target(target: Character):

	if target == null:
		return

	var damage = attack

	# 10% critical chance
	if randf() < 0.10:
		damage *= 2
		print("Critical Hit!")

	target.take_damage(damage)


func take_damage(amount: int):

	var damage = max(amount - defense, 1)

	if defending:
		damage = int(damage / 2)

	hp -= damage
	hp = max(hp, 0)

	defending = false

	print(character_name + " took " + str(damage) + " damage!")

	health_changed.emit(hp, max_hp)

	if hp <= 0:
		died.emit()


func heal(amount: int):

	hp += amount
	hp = min(hp, max_hp)

	print(character_name + " recovered " + str(amount) + " HP!")

	health_changed.emit(hp, max_hp)


func restore_mp(amount: int):

	mp += amount
	mp = min(mp, max_mp)

	mana_changed.emit(mp, max_mp)


func defend():

	defending = true

	print(character_name + " is defending!")


func use_skill(skill: Skill, target: Character):

	if skill == null:
		return

	if mp < skill.mp_cost:
		print("Not enough MP!")
		return

	mp -= skill.mp_cost

	mana_changed.emit(mp, max_mp)

	match skill.type:

		Skill.SkillType.DAMAGE:
			target.take_damage(skill.power + attack)

		Skill.SkillType.HEAL:
			target.heal(skill.power)

		Skill.SkillType.BUFF:
			attack += 5

	print(character_name + " used " + skill.skill_name)


func use_item(item: Item) -> bool:

	if hp >= max_hp and item.heal_hp > 0:
		print(character_name + " is already at full HP.")
		return false

	heal(item.heal_hp)

	restore_mp(item.heal_mp)

	print(character_name + " used " + item.item_name)

	return true


func gain_experience(amount: int):

	experience += amount

	while experience >= experience_to_next:

		experience -= experience_to_next
		level_up()


func level_up():

	level += 1

	max_hp += 20
	max_mp += 5

	attack += 3
	defense += 2
	speed += 1

	hp = max_hp
	mp = max_mp

	experience_to_next += 50

	print(character_name + " reached Level " + str(level) + "!")

	health_changed.emit(hp, max_hp)
	mana_changed.emit(mp, max_mp)


func is_dead() -> bool:
	return hp <= 0
