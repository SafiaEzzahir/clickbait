extends Node2D

var power = 1
var cookies = 0
var cookiespersec = 0

@onready var shopitems = [$ShopItem1]

const ShopItemScene = preload("res://shop_item_1.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for item in shopitems:
		item.purchased.connect(_on_item_purchased)

func _on_item_purchased(item) -> void:
	cookies -= item.cost
	cookiespersec += item.clickspersec


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if cookiespersec:
		cookies += delta*cookiespersec
	
	if cookies >= 10**power:
		generate_shop()
		power +=1
	
	$Label.cookies = cookies
	$Label.cookiespersec = cookiespersec
	
	for item in shopitems:
		if item:
			item.currenttospend = cookies


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	cookies +=1
	
func shop_button_pressed(persecadded):
	cookiespersec += persecadded
	
const SHOP_START = Vector2(735, -358)   # where ShopItem1 sits
const SHOP_SPACING = 120                # <-- vertical gap between items (this is the height control)

func generate_shop() -> void:
	var shopitem = ShopItemScene.instantiate()
	shopitem.cost = 10**(power-1)/2
	shopitem.clickspersec = 10**power - 3**power
	shopitem.position = SHOP_START + Vector2(0, SHOP_SPACING * shopitems.size())
	shopitem.purchased.connect(_on_item_purchased)
	add_child(shopitem)
	shopitems.append(shopitem)


func _on_shop_item_1_body_entered(body: Node2D) -> void:
	cookiespersec += $ShopItem1.clickspersec
