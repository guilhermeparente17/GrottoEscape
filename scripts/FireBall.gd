extends Area2D

const SPEED := 300

var velocity := Vector2.ZERO
var direction := 1

func _ready():
	$AnimatedSprite.flip_h = true
	pass
	
func set_direction(dir):
	direction = dir
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true

func _physics_process(delta: float) -> void:
	velocity.x = -SPEED * delta * direction
	translate(velocity)



func _on_FireBall_body_entered(body):
	if body is TileMap:
		queue_free()
	elif body.name == "Grotto":
		body.dano()
		queue_free()


func _on_FireBall_area_exited(area) -> void:
	queue_free()
