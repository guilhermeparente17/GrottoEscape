extends Area2D

const SPEED := 300

var velocity := Vector2.ZERO
var direction := 1

func _ready():
	pass
	
func set_direction(dir):
	direction = dir
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true

func _physics_process(delta: float) -> void:
	velocity.x = SPEED * delta * direction
	translate(velocity)


func _on_laser_area_exited(area):
	queue_free()


func _on_laser_body_entered(body):
	if body is StaticBody2D:
		body.dano()
		queue_free()
	elif body is TileMap:
		queue_free()
