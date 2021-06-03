extends Area2D
export var speed:int=60
export var move:int=60
var is_dead=false
onready var startx:float=position.y
onready var targetx:float=position.y+move
const DROP_THRU_BIT=1

func _physics_process(delta):
	if is_dead==false:
		position.y=move_to(position.y,targetx,speed*delta)
		if position.y==targetx:
			if position.y==startx:
				targetx=position.y+move
			else:
				targetx=startx
			$Mummy.play("move")
	pass
	
func move_to(current,to,step):
	if is_dead==false:
		var moi=current
		if moi<to:
			moi+=step;
			$Mummy.flip_h=true
			if moi>to:
				moi=to
		else:
			moi-=step
			$Mummy.flip_h=false
			if moi<to:
				moi=to
		return moi
	pass

func _on_EnemyMummy_body_entered(body):
	if body.name=="Player":
		is_dead==true
		body.die()
	pass
pass
	


