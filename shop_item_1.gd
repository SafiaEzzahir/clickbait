extends Node

var clickspersec = 0.1
var cost = 40
var currenttospend = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Button.text = "+" + str(clickspersec) + " clicks per second \n(" + str(cost) + " cookies)"
	
	if currenttospend < cost:
		$Button.disabled
	else:
		$Button.disabled = false
