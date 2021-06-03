extends Area2D

func _on_Lava_body_entered(body):
	if body.name=="Player":
		body.die()
	pass
pass


