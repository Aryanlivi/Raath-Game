extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var curve=$Path.curve
	var polygon=curve.get_baked_points()
	$CPoly.polygon=polygon
	$Poly.polygon=polygon
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
