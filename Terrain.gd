extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var curve=$Path.curve
	var polygon=curve.get_baked_points()
	var p1=curve.get_point_in(2)
	var p2=curve.get_point_in(4)
	$CPoly.polygon=polygon
	$Poly.polygon=polygon
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
