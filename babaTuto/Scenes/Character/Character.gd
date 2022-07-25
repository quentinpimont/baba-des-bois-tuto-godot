extends KinematicBody2D

onready var animated_sprite: AnimatedSprite = $Sprite

var direction = Vector2.ZERO
var speed = 300.0

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	var __ = move_and_slide(direction * speed)

func _input(_event: InputEvent) -> void:
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	direction = direction.normalized()
	
	match(direction):
		Vector2.ZERO: 
			animated_sprite.stop()
			animated_sprite.frame = 0
		Vector2.RIGHT: animated_sprite.play("MoveRight")
		Vector2.LEFT: animated_sprite.play("MoveLeft")
		Vector2.DOWN: animated_sprite.play("MoveDown")
		Vector2.UP: animated_sprite.play("MoveUp")
