extends Node2D 

var RopePiece=preload("res://ropepiecetry.tscn")
var SBody=preload("res://S.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var no=0;
var pieces=[]
# Called when the node enters the scene tree for the first time.
func _ready():
	var sbody1=SBody.instance()
	sbody1.global_position=Vector2(500,100)
	var sjoint1=sbody1.get_node("J")
	add_child(sbody1)
	sjoint1.node_a=sbody1.get_path()
	
	var sbody2=SBody.instance()
	sbody2.global_position=Vector2(1000,100)
	var sjoint2=sbody2.get_node("J")
	add_child(sbody2)
	var piece_size=10;
	var distance=sbody1.global_position.distance_to(sbody2.global_position)
	no=round(distance/piece_size)
	var joint=sjoint1;
	for i in range(0,no):
		init_rope(joint)
		joint=pieces[i].get_node("J")
		
	for i in range(0,no):
		add_joint(i)
			
	sjoint1.node_b=pieces[0].get_path()
	var lastpiece=pieces.size()-1;
	sjoint2.node_a=sbody2.get_path()
	sjoint2.node_b=pieces[lastpiece].get_path()
	
func init_rope(joint:PinJoint2D):
	var rope_piece=RopePiece.instance()
	var offset=Vector2((rope_piece.scale.x/2)*10,0)
	rope_piece.global_position=joint.global_position+offset
	add_child(rope_piece)
	pieces.append(rope_piece);

func add_joint(index:int):
	var joint=pieces[index].get_node("J")
	joint.node_a=pieces[index].get_path()
	if(index+1!=no):
		joint.node_b=pieces[index+1].get_path()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
