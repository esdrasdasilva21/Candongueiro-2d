extends CharacterBody2D

@export var vel_max := 600.0
@export var aceleracao := 800.0
@export var atrito := 600.0
@export var y_faixa_cima := 800.0   # troca pelo Y da FaixaCima
@export var y_faixa_baixo := 950.0  # troca pelo Y da FaixaBaixo
@export var tempo_troca := 0.25     # duração da mudança de faixa (segundos)
@export var x_limite_direito := 5000.0  # fim da rua (ajusta)

var pode_mudar_faixa := true
var mudando := false
var faixa := 1              # 1 = cima (perto dos prédios), 2 = baixo
var controle_ativo := true  # false durante a curva

func _ready():
	add_to_group("carro")
	position.y = y_faixa_cima

func _physics_process(delta):
	# Durante a curva o jogador perde o controlo e o carro trava
	if not controle_ativo:
		velocity.x = move_toward(velocity.x, 0.0, atrito * delta)
		velocity.y = 0.0
		move_and_slide()
		return

	# Frente e trás, com aceleração e travagem suaves
	var dir := Input.get_axis("ui_left", "ui_right")
	if dir != 0:
		velocity.x = move_toward(velocity.x, dir * vel_max, aceleracao * delta)
		$Sprite2D.flip_h = dir < 0
	else:
		velocity.x = move_toward(velocity.x, 0.0, atrito * delta)
	velocity.y = 0.0
	move_and_slide()

	# Limites da rua (esquerda e direita)
	position.x = clamp(position.x, 100.0, x_limite_direito)

	# Mudança de faixa
	if pode_mudar_faixa and not mudando:
		if Input.is_action_just_pressed("ui_up"):
			_ir_para(y_faixa_cima, 1)
		elif Input.is_action_just_pressed("ui_down"):
			_ir_para(y_faixa_baixo, 2)

func _ir_para(y: float, nova_faixa: int):
	if is_equal_approx(position.y, y):
		return
	faixa = nova_faixa
	mudando = true
	var t := create_tween()
	t.tween_property(self, "position:y", y, tempo_troca)
	t.finished.connect(_fim_troca)

func _fim_troca():
	mudando = false

# --- Curva ---
func pode_curvar() -> bool:
	return faixa == 1 and not mudando and controle_ativo

func iniciar_curva():
	controle_ativo = false
