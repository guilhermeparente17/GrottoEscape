extends StaticBody2D

func _ready():
	$AnimationPlayer.play("run")


func dano():
	$AnimationPlayer.play("explosao")
	
func audio_morte():
	$morte.play()


func morte():
	queue_free()
	

func _on_Area2D_body_entered(body):
	if body.name == "Grotto":
		body.dano()
