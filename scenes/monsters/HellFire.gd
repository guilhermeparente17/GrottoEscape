extends StaticBody2D

var vida = 2
onready var projetil = preload("res://scenes/projetil.tscn")
var imune = false

func _ready():
	$AnimationPlayer.play("idle")
	
func _process(delta):
	pass


func dano():
	$cooldown.start()
	$AnimationPlayer.play("hit")
	$transformation.play()
	vida -= 1
	
	if vida <= 0:
		$cooldown.stop()
		$AnimationPlayer.play("dead")
		
func morte():
	queue_free()

func reset_animation():
	$AnimationPlayer.play("new_idle")
	
func fireball():
	var p = projetil.instance()
	get_parent().add_child(p)
	p.global_position = $Position2D.global_position


func _on_cooldown_timeout():
	$AnimationPlayer.play("atack")
	
func audio_fireball():
	$shot.play()
	
