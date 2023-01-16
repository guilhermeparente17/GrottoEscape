extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.3
var area_damage_player = false
var move = true
var vida = 3

func _ready():
	$AnimationPlayer.play("nascer")
	posicao_inicial = 486
	posicao_final = posicao_inicial + 120
	
func _process(delta):
	if $Sprite.flip_h == true:
		$area_atack/CollisionShape2D.position.x = -20
	else:
		$area_atack/CollisionShape2D.position.x = 20
	if move:
		if posicao_inicial <= posicao_final and flip:
			$".".position.x += velocidade
			
			$Sprite.flip_h = false
			if $".".position.x >= posicao_final:
				flip = false
		if $".".position.x >= posicao_inicial and !flip:
			$".".position.x -= velocidade
			$Sprite.flip_h = true
			if $".".position.x <= posicao_inicial:
				flip = true


func dano():
	vida -= 1
	$AnimationPlayer.play("hit")
	move = false
	
	if vida <= 0:
		GlobalVar.show_necro = true
		$AnimationPlayer.play("dead")
	
func morte():
	queue_free()
	
func damage_player():
	if area_damage_player:
		GlobalVar.area_damage_player = true


func _on_area_atack_body_entered(body):
	if body.name == "Grotto":
		area_damage_player = true
		move = false
		$AnimationPlayer.play("atack")

func reset_animation():
	$AnimationPlayer.play("walk")
	move = true
	
func movement():
	$AnimationPlayer.play("walk")


func _on_area_atack_body_exited(body):
	if body.name == "Grotto":
		area_damage_player = false
