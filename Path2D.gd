extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var pathfollow=get_node("PathFollow2D")
var t=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	t+=delta
	pathfollow.offset=t*20


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
