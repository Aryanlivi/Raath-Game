extends Node2D

onready var sbody=get_node("S");
var Rope=preload("res://Rope.tscn");
var start_pos=Vector2.ZERO;
var end_pos=Vector2.ZERO;
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		start_pos=sbody.global_position
		if(end_pos==Vector2.ZERO):
			end_pos=get_global_mouse_position()
			var rope=Rope.instance()
			add_child(rope);
			rope.spawn(sbody,start_pos,end_pos);
			print("input")
	
