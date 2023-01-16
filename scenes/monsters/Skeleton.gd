extends StaticBody2D

var area_damage_player = false
var vida = 3
var posicao_inicial
var posicao_final
var velocidade = 0.6
var flip = true
var move = true


func _ready():
	if GlobalVar.atack_invoker:
		$AnimationPlayer.play("nascer")
	else:
		$AnimationPlayer.play("walk")
	$Sprite.flip_h = true
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 100
	
func _physics_process(delta):
	if $Sprite.flip_h == true:
		$CollisionShape2D.position.x = 6
		$Area_ataque/Colisao_ataque.position.x = -7
	else:
		$CollisionShape2D.position.x = -8
		$Area_ataque/Colisao_ataque.position.x = 21
		
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
		$AnimationPlayer.play("dead")

func morte():
	queue_free()

func Area_ataque_body_entered(body):
	if body.name == "Grotto":
		area_damage_player = true
		move = false
		$AnimationPlayer.play("atack")

func damage_player():
	if area_damage_player:
		GlobalVar.area_damage_player = true


func reset_animation():
	$AnimationPlayer.play("walk")
	move = true

func Area_ataque_body_exited(body):
	if body.name == "Grotto":
		area_damage_player = false
		
func movement():
	move = true
