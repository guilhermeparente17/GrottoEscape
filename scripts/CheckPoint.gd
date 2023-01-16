extends Area2D

var checkpoint = true

func _on_CheckPoint_body_entered(body):
	if body.name == "Grotto":
		if checkpoint:
			$checkpoint.play()
			checkpoint = false
		body.novo_checkpoint(1066, 349)
#		queue_free()
