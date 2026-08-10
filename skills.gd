func check_for_new_skills():

	for learnable in learnable_skills:

		if level >= learnable.level_required:

			if !skills.has(learnable.skill):

				skills.append(learnable.skill)

				print(character_name + " learned " + learnable.skill.skill_name + "!")
				
				func level_up():

	level += 1

	base_max_hp += 20
	base_max_mp += 5

	base_attack += 3
	base_defense += 2
	base_speed += 1

	hp = base_max_hp
	mp = base_max_mp

	update_stats()

	check_for_new_skills()

	print(character_name + " reached Level " + str(level))
	
	extends Resource
class_name Skill

@export var skill_name : String
@export_multiline var description : String

@export var power := 20
@export var mp_cost := 5

@export var attack_effect : PackedScene

enum TargetType:
	ENEMY
	ALLY
	SELF

@export var target : TargetType = TargetType.ENEMY

enum SkillType:
	DAMAGE
	HEAL
	BUFF

@export var type : SkillType = SkillType.DAMAGE
