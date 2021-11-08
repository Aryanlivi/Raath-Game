extends MeshInstance2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var node=get_parent().get_node("mymesh");
	pass
	 # Replace with function body.
""""
func check(node):
	if node!=null:
		print(node.name);
		return;
	else:
		check(node);
"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
