extends Node2D 

onready var sbody2=get_parent().get_node("S2");
var RopePiece=preload("res://RopePiece.tscn")
var no_of_pieces=0;
const offset=Vector2(8,0)
const piece_size=16;
var pieces=[]
func spawn(body:PhysicsBody2D,startpos:Vector2,endpos:Vector2):
	var sjoint1=body.get_node("J")
	sjoint1.node_a=body.get_path()
	
	var sjoint2=sbody2.get_node("J")
	add_child(sbody2)
	
	#Calculate distance to find no of required pieces.
	var distance=startpos.distance_to(endpos)
	no_of_pieces=round(distance/piece_size)
	
	#starting_joint
	var joint=sjoint1;
	for i in range(0,no_of_pieces):
		init_rope(joint)
		joint=pieces[i].get_node("J")
		
	for i in range(0,no_of_pieces):
		add_joint(i)
		
	var startpiece=pieces[0]
	sjoint1.node_b=startpiece.get_path()
	var endpiece=pieces[pieces.size()-1];
	sjoint2.node_a=sbody2.get_path()
	endpiece.global_position=sjoint2.global_position-offset
	sjoint2.node_b=endpiece.get_path()
	
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
#func _process(delta):
#	pass
