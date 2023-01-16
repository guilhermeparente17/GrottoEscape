extends Area2D	

func _on_municao_body_entered(body):
	if body.name == "Grotto":
		body.ganha_vida()
		queue_free()
	elif body is KinematicBody2D:
		$AudioVida.play()
