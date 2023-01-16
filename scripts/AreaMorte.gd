extends Area2D



func _on_AreaMorte_body_entered(body):
	if body.name == "Grotto":
		body.renascer()
