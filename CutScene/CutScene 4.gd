extends Node

export(PackedScene) var next_scene

func next_level():
	var change = get_tree().change_scene_to(next_scene)
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		next_level()
	pass
pass		

