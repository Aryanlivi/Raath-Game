extends Node2D
var SBody=preload("res://S.tscn")
var RBody=preload("res://R.tscn")
var RopePiece=preload("res://RopePiece.tscn")
var no_of_pieces=0;
const offset=Vector2(8,0)
const piece_size=16;
var pieces=[]
var endpos=0
var rbody=RBody.instance()
var rjoint=rbody.get_node("J")
var joint=null
# Called when the node enters the scene tree for the first time.
func _ready():
	var sbody1=SBody.instance()
	sbody1.global_position=Vector2(200,100)
	var sjoint1=sbody1.get_node("J")
	add_child(sbody1)
	""""
	var sbody2=SBody.instance()
	sbody2.global_position=Vector2(800,500)
	var sjoint2=sbody2.get_node("J")
	add_child(sbody2)
	"""
	rbody.global_position=Vector2(800,500)
	
	add_child(rbody)
	
	var distance=sbody1.global_position.distance_to(rbody.global_position)
	no_of_pieces=round(distance/piece_size)
	
	joint=sjoint1;
	for i in range(0,no_of_pieces):
		init_rope(joint)
		joint=pieces[i].get_node("J")
		
	for i in range(0,no_of_pieces):
		add_joint(i)
		
	var startpiece=pieces[0]
	sjoint1.node_a=sbody1.get_path()
	sjoint1.node_b=startpiece.get_path()
	rjoint.node_a=rbody.get_path()
	var endpiece=pieces[pieces.size()-1];
	endpiece.global_position=rbody.global_position-offset
	rjoint.node_b=endpiece.get_path()
	rbody.mode=RigidBody2D.MODE_STATIC

func init_rope(joint:PinJoint2D):
	var rope_piece=RopePiece.instance()
	rope_piece.global_position=joint.global_position+offset
	add_child(rope_piece)
	pieces.append(rope_piece);
		
func add_joint(index:int):
	var joint=pieces[index].get_node("J")
	joint.node_a=pieces[index].get_path()
	if(index+1!=no_of_pieces):
		joint.node_b=pieces[index+1].get_path()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var endpos=get_global_mouse_position()
	rbody.global_position=lerp(rbody.global_position,endpos,50*delta)
	
