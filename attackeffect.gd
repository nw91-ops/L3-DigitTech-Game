extends Node2D


func play_effect():

	$GPUParticles2D.restart()
	$GPUParticles2D.emitting = true

	await $GPUParticles2D.finished

	queue_free()
	
	func attack_target(target: Character):

	if target == null:
		return

	var damage = attack

	if randf() < 0.10:

		damage *= 2

		print("Critical Hit!")

	# Create particle effect
	var effect = ATTACK_EFFECT.instantiate()

	get_tree().current_scene.add_child(effect)

	effect.global_position = target.global_position

	effect.play_effect()

	# Deal damage
	target.take_damage(damage)
