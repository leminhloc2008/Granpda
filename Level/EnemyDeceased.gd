extends Area2D
export var speed:int=60
export var move:int=70
var is_dead=false
onready var startx:float=position.x
onready var targetx:float=position.x+move
const DROP_THRU_BIT=1

func _physics_process(delta):
	if is_dead==false:
		position.x=move_to(position.x,targetx,speed*delta)
		if position.x==targetx:
			if position.x==startx:
				targetx=position.x+move
			else:
				targetx=startx
			$Deceased.play("move")
	pass
	
func move_to(current,to,step):
	if is_dead==false:
		var moi=current
		if moi<to:
			moi+=step;
			$Deceased.flip_h=true
			if moi>to:
				moi=to
		else:
			moi-=step
			$Deceased.flip_h=false
			if moi<to:
				moi=to
		return moi
	pass

func _on_EnemyDeceased_body_entered(body):
	if body.name=="Player":
		is_dead==true
		body.die()
	pass
