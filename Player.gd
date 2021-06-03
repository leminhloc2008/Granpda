extends KinematicBody2D

var move = Vector2()
var facing_direction=Vector2()
var speed=1
var current_hp:int=10
var max_hp:int=10
var move_speed:int=150
var damage:int=1

var gold:int=0

var interact_dist:int=70

onready var raycast=$RayCast2D
onready var anim=$Farmer

func play_animation(anim_name):
	if anim.animation!=anim.name:
		anim.play(anim_name)
	pass
	
func manage_animation():
	if move.x>0:
		play_animation("move_right")
	elif move.x<0:
		play_animation("move_left")
	elif move.y<0:
		play_animation("move_up")
	elif move.y>0:
		play_animation("move_down")
	elif facing_direction.x==1:
		play_animation("idle_right")
	elif facing_direction.x==-1:
		play_animation("idle_left")
	elif facing_direction.y==1:
		play_animation("idle_down")
	elif facing_direction.y==-1:
		play_animation("idle_up")
	pass
	
func give_gold(amount):
	gold+=amount
	pass
	
func die():
	get_tree().reload_current_scene()
	pass
	
func _physics_process(delta):
	move=Vector2()
	if Input.is_action_pressed("ui_right"):
		move.x +=speed
		facing_direction=Vector2(1,0)
	if Input.is_action_pressed("ui_left"):
		move.x-=speed
		facing_direction=Vector2(-1,0)
	if Input.is_action_pressed("ui_up"):
		move.y-=speed
		facing_direction=Vector2(0,-1)
	if Input.is_action_pressed("ui_down"):
		move.y+=speed
		facing_direction=Vector2(0,1)
	move=move.normalized()
	move_and_slide(move*move_speed, Vector2.ZERO)
	manage_animation()
	pass
pass
