extends StaticBody2D

onready var projetil = preload("res://scenes/FireBall.tscn")
onready var atackTimer = $Timer

func _ready():
	if atackTimer.is_stopped():
		$AnimationPlayer.play("shot")

	
func fireball():
	var fb = projetil.instance()
	get_tree().current_scene.add_child(fb)
	fb.global_position = $Position2D.global_position
	
	atackTimer.start()

func dano():
	$AnimationPlayer.play("dano")
	
func audio_morte():
	$morte.play()
	
func morte():
	queue_free()


func _on_Timer_timeout():
	fireball()
