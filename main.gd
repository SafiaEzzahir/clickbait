extends Node2D

var power = 1
var cookies = 0
var cookiespersec = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ShopItem1.pushed.connect(shop_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	cookies += delta/60*cookiespersec
	
	if cookies != 10**power:
		generate_shop()
	
	$Label.cookies = cookies
	$Label.cookiespersec = cookiespersec


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	cookies +=1
	
func shop_button_pressed(persecadded):
	cookiespersec += persecadded
	
func generate_shop():
	pass
