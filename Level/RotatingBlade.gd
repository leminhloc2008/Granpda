extends Area2D


func _on_RotatingBlade_body_entered(body):
	if body.name=="Player":
		body.die()
	pass
pass


