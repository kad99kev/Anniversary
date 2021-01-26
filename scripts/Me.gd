extends KinematicBody2D

const MOVE_SPEED = 500
const JUMP_FORCE = 1000
const GRAVITY = 50
const MAX_FALL_SPEED = 1000

var y_velo = 0
var facing_right = false
var game_started = false
var power_up = false

func start_game():
	game_started = true

func _physics_process(_delta):
	var move_dir = 0
	if Input.is_action_pressed("ui_left"):
		move_dir -= 1
	if Input.is_action_pressed("ui_right"):
		move_dir += 1
	
# warning-ignore:return_value_discarded
	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0, -1))
	
	var grounded = is_on_floor()
	y_velo += GRAVITY
	if grounded and Input.is_action_just_pressed("ui_up"):
		if power_up:
			y_velo -= JUMP_FORCE * 2
		else:
			y_velo -= JUMP_FORCE
	if grounded and y_velo >= 5:
		y_velo = 5
	if y_velo >= MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
		
	if facing_right and move_dir < 0:
		flip()
	if !facing_right and move_dir > 0:
		flip()
		
	if grounded:
		if move_dir == 0:
			play_anim("idle")
		else:
			play_anim("walk")
	else:
		play_anim("jump")
	
func flip():
	facing_right = !facing_right
	
func play_anim(anim_name):
	if $AnimatedSprite.is_playing() and $AnimatedSprite.animation == anim_name:
		return
	$AnimatedSprite.animation = anim_name
	$AnimatedSprite.flip_h = facing_right
	$AnimatedSprite.play()

func _on_Boost_body_entered(_body):
	power_up = true
