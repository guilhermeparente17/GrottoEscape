extends Area2D



func _on_municao_body_entered(body):
	if body.name == "Grotto":
		if GlobalVar.ataque_boss:
			GlobalVar.status_ataque_boss_gosma = true
		$reload.play()
		body.ganha_municao()
		queue_free()
