extends KinematicBody2D

const GRAVITY = 20
const SPEED = 110
const JUMP = -370
var motion = Vector2()

var tempo_recarga = true

var checkpointX = 136
var checkPointY = 381
var movement = true

onready var TIRO = preload("res://scenes/laser.tscn")
onready var atackTimer = $Timer

func disparar():
	GlobalVar.municao -= 1
	var t = TIRO.instance()
	get_parent().add_child(t)
	t.global_position = $Position2D.global_position
	
	if sign($Position2D.position.x) == 1:
		t.set_direction(1)
	else:
		t.set_direction(-1)
		
	atackTimer.start()
	$laser.play()

func _physics_process(delta) -> void:
	
	motion.y += GRAVITY
	
	if movement:
		if Input.is_action_pressed("atack") and atackTimer.is_stopped():
			motion.x = 0
			tempo_recarga = false
			if GlobalVar.municao >= 1:
				$AnimationPlayer.play("tiro")
		elif Input.is_action_pressed("ui_left"):
			motion.x = -SPEED
			$AnimationPlayer.play("run")
			$Sprite.flip_h = true
			reload()
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_right"):
			motion.x = SPEED
			$AnimationPlayer.play("run")
			reload()
			$Sprite.flip_h = false
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_up") and GlobalVar.status_escada:
			print("subindo")
			$CollisionShape2D.scale.x = 0.3
			motion.y = -SPEED
			$AnimationPlayer.play("escada")
		else:
			motion.x = 0
			if tempo_recarga: 
				$AnimationPlayer.play("idle")

		if is_on_floor():
			if Input.is_action_pressed("pular"):
				motion.y = JUMP
				$Jump.play()
		else:
			if !GlobalVar.status_escada:
				$AnimationPlayer.play("jump")
	
		motion = move_and_slide(motion, Vector2.UP)
		
	if GlobalVar.area_damage_player:
		dano()

func dano():
	GlobalVar.vida -= 1
	movement = false
	$Dano.play()
	$AnimationPlayer.play("fall")
	GlobalVar.area_damage_player = false
	if GlobalVar.vida <= 0:
		morrer()


func morrer():
	get_tree().change_scene("res://scenes/Menu.tscn")

func movement_player():
	movement = true

func reload():
	tempo_recarga = true

func renascer():
	$".".position.x = checkpointX
	$".".position.y = checkPointY
	
func ganha_vida():
	$consumiveis.play()
	GlobalVar.vida += 1
	
func ganha_municao():
	$consumiveis.play()
	GlobalVar.municao += 1
	
func novo_checkpoint(x,y):
	GlobalVar.vida = GlobalVar.vida
	checkpointX = x
	checkPointY = y
	


