extends Button

export var reference_path=""
export(bool) var start_focused=false

func _ready():
	if(start_focused):
		grab_focus()
		
	connect("mouse_entered",self,"_on_Button_mouse_entered")
	connect("pressed",self,"_on_Button_Pressed")
	pass

func _on_Button_mouse_entered():
	grab_focus()
	pass
	
func _on_Button_Pressed():
	OS.shell_open("https://lml-studio.itch.io/")
	pass
pass
