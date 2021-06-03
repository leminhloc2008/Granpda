extends Area2D

export(PackedScene) var next_scene

func next_level():
	var change = get_tree().change_scene_to(next_scene)
	
	if change != OK:
		print("something failed in the door scene")
	pass
	
func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_overlapping_bodies().size() > 0:
			if !next_scene: 
				print("no scene in this door")
				return
			$DoorAnim.play("open")
			next_level()
			#$Farmer.play("move_up")
	pass
pass		

#thanks to Rafa Fiedo
#His youtube :https://www.youtube.com/channel/UCT09eC0fDd3a3Nx9X7QQ9Aw
