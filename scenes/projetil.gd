extends Area2D

export(String) var type_anim

const SPEED := 300

var velocity := Vector2.ZERO
var direction := -1

func _ready():
	pass
	
func set_direction(dir):
	direction = dir
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true

func _physics_process(delta: float) -> void:
	velocity.x = SPEED * delta * direction
	translate(velocity)




func _on_projetil_body_entered(body):
	if body.name == "Grotto":
		body.dano()
