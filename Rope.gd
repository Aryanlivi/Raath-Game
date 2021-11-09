extends Node2D 
var RopePiece=preload("res://RopePiece.tscn")
onready var sbody=get_parent().get_node("S")
onready var sbody2=get_parent().get_node("S2")
onready var sjoint2=sbody2.get_node("J")
var no_of_pieces=0
const offset=Vector2(8,0)
const piece_size=16
var pieces=[]
var joint=null
var sjoint1=null
var created_pieces=0
func spawn(body:PhysicsBody2D,startpos:Vector2,endpos:Vector2):
	if(created_pieces==0):
		sjoint1=body.get_node("J")
		sjoint1.node_a=body.get_path()
		joint=sjoint1
		
	#Calculate distance to find no of required pieces.
	#var distance=startpos.distance_to(endpos)
	#no_of_pieces=round(distance/piece_size)
	no_of_pieces+=35
	#var spawn_angle=(startpos-endpos).angle()-PI/2
	#starting_joint
	
	for i in range(created_pieces,no_of_pieces):
		init_rope_piece(joint)
		joint=pieces[i].get_node("J")
	for i in range(created_pieces,no_of_pieces):
		add_joint(i)
	created_pieces=no_of_pieces
	
	sjoint1.node_b=pieces[0].get_path()
	attach_rope(sbody2,sjoint2)
	
func init_rope_piece(joint:PinJoint2D):
	var rope_piece=RopePiece.instance()
	rope_piece.global_position=joint.global_position+offset
	add_child(rope_piece)
	pieces.append(rope_piece);

func add_joint(index:int):
	var joint=pieces[index].get_node("J")
	joint.node_a=pieces[index].get_path()
	if(index+1!=no_of_pieces):
		joint.node_b=pieces[index+1].get_path()

func follow_mouse(endpos:Vector2):
	var endpiece=pieces[pieces.size()-1]
	endpiece.global_position=lerp(endpiece.global_position,endpos,0.5)

func attach_rope(body:PhysicsBody2D,endjoint:PinJoint2D):
	var endpiece=pieces[pieces.size()-1]
	endpiece.global_position=sbody2.global_position-offset
	endjoint.node_a=body.get_path()
	endjoint.node_b=endpiece.get_path()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var endpos=get_global_mouse_position()
	var magnitude=pow(endpos.x,2)+pow(endpos.y,2)
	var unitvectorX=(endpos.x)/magnitude
	var unitvectorY=(endpos.y)/magnitude
	#var gotopos=Vector2(unitvectorX*100,unitvectorY*100);
	sbody2.global_position=lerp(sbody2.global_position,endpos,5*delta)
