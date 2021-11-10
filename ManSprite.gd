extends AnimatedSprite

onready var pathfollow=get_parent().get_parent().get_parent()

func _process(delta):
	if(pathfollow.unit_offset==1):
		self.frame=0
		self.playing=false
