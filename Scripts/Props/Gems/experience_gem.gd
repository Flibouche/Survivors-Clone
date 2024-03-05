extends Area2D

@export var experience = 1

var spr_1 = preload("res://Textures/Items/Gems/gem_1.png")
var spr_2 = preload("res://Textures/Items/Gems/gem_2.png")
var spr_3 = preload("res://Textures/Items/Gems/gem_3.png")

var target = null
var speed = -1

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var sound = $snd_collected

func _ready():
	if experience < 5:
		return
	elif experience < 25:
		sprite.texture = spr_1
	else:
		sprite.texture = spr_3

func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position,speed)
		speed += 2*delta

func collect():
	sound.play()
	collision.call_deferred("set","disabled",true)
	sprite.visible = false
	return experience

func _on_snd_collected_finished():
	queue_free()
