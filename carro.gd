extends CharacterBody2D

@export var vel_max := 600.0
@export var aceleracao := 800.0
@export var atrito := 600.0
@export var y_faixa_cima := 800.0   # troca pelo Y da FaixaCima
@export var y_faixa_baixo := 950.0  # troca pelo Y da FaixaBaixo
@export var tempo_troca := 0.25     # duração da mudança de faixa (segundos)

var pode_mudar_faixa := true
var mudando := false

func _ready():
	add_to_group("carro")
	position.y = y_faixa_cima
	print("Carro em: ", global_position, " | textura: ", $Sprite2D.texture, " | escala: ", $Sprite2D.scale)
	

func _physics_process(delta):
	print(get_viewport().get_camera_2d(), " | x do carro: ", int(position.x))
	# Frente e trás, com aceleração e travagem suaves
	var dir := Input.get_axis("ui_left", "ui_right")
	if dir != 0:
		velocity.x = move_toward(velocity.x, dir * vel_max, aceleracao * delta)
		$Sprite2D.flip_h = dir < 0
	else:
		velocity.x = move_toward(velocity.x, 0.0, atrito * delta)
	velocity.y = 0.0
	move_and_slide()

	# Não deixa o carro sair da rua pelo lado esquerdo
	position.x = max(position.x, 100.0)

	# Mudança de faixa
	if pode_mudar_faixa and not mudando:
		if Input.is_action_just_pressed("ui_up"):
			_ir_para(y_faixa_cima)
		elif Input.is_action_just_pressed("ui_down"):
			_ir_para(y_faixa_baixo)

func _ir_para(y: float):
	if is_equal_approx(position.y, y):
		return
	mudando = true
	var t := create_tween()
	t.tween_property(self, "position:y", y, tempo_troca)
	t.finished.connect(_fim_troca)

func _fim_troca():
	mudando = false
