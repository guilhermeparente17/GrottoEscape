extends StaticBody2D

	
var flip = true
var velocidade = 2
var status = false
var status_death = true


func _ready():
	$AnimationPlayer.play("flying")

func _process(delta):
	if status and status_death:
		desce()

func desce():
	position.y += velocidade
	
func dano():
	status_death = false
	$AnimationPlayer.play("dead_bat")
	
func audio_morte():
	$morte.play()
	
func morte_bat():
	position.y += 0
	queue_free()


func _on_Area2D_body_entered(body):
	print(body)
	if body.name == "Grotto":
		desce()
		status = true


func _on_Area2D_area_exited(area):
	queue_free()


func _on_areaDano_body_entered(body):
	if body.name == "Grotto":
		body.dano()
