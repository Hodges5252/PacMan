extends CanvasGroup

var transferring = false

func transfer(body, to):
	if !transferring:
		transferring = true
		body.global_position = to.global_position
		print(str(body.name) + " transferred to: " + str(to.name))
		await get_tree().create_timer(0.04).timeout
		transferring = false

func _on_portal_left_body_entered(body):
	transfer(body, %PortalRight)
	if body.has_method("set_direction"):
		body.set_direction("right")

func _on_portal_right_body_entered(body):
	transfer(body, %PortalLeft)
	if body.has_method("set_direction"):
		body.set_direction("left")

func _on_portal_down_4_body_entered(body):
	transfer(body, %PortalUp6)
	if body.has_method("set_direction"):
		body.set_direction("up")

func _on_portal_down_3_body_entered(body):
	transfer(body, %PortalUp4)
	if body.has_method("set_direction"):
		body.set_direction("up")

func _on_portal_down_2_body_entered(body):
	transfer(body, %PortalUp3)
	if body.has_method("set_direction"):
		body.set_direction("up")

func _on_portal_down_1_body_entered(body):
	transfer(body, %PortalUp1)
	if body.has_method("set_direction"):
		body.set_direction("up")

func _on_portal_up_1_body_entered(body):
	transfer(body, %PortalDown1)
	if body.has_method("set_direction"):
		body.set_direction("down")

func _on_portal_up_2_body_entered(body):
	transfer(body, %PortalDown2)
	if body.has_method("set_direction"):
		body.set_direction("down")

func _on_portal_up_3_body_entered(body):
	transfer(body, %PortalDown2)
	if body.has_method("set_direction"):
		body.set_direction("down")

func _on_portal_up_4_body_entered(body):
	transfer(body, %PortalDown3)
	if body.has_method("set_direction"):
		body.set_direction("down")

func _on_portal_up_5_body_entered(body):
	transfer(body, %PortalDown3)
	if body.has_method("set_direction"):
		body.set_direction("down")

func _on_portal_up_6_body_entered(body):
	transfer(body, %PortalDown4)
	if body.has_method("set_direction"):
		body.set_direction("down")
