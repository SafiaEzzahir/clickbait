extends Area2D

signal purchased(item)

var clickspersec = 0.1
var cost = 3
var currenttospend = 0

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	$Button.text = "+" + str(clickspersec) + " clicks per second \n(" + str(cost) + " cookies)"
	$Button.disabled = currenttospend < cost   # <-- fixed (see note)

func _on_body_entered(body: Node2D) -> void:
	if currenttospend >= cost:
		purchased.emit(self)
		print(currenttospend)
