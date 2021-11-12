extends AnimatedSprite

onready var pathfollow=get_parent().get_parent().get_parent()

func _process(delta):
	if(pathfollow.unit_offset==1 or Game.gamestate!=Game.state.PULL):
		self.animation="idle"
		self.playing=false
	if(Game.gamestate==Game.state.PULL):
		self.animation="pull"
		self.playing=true
