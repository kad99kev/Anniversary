extends CanvasLayer

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()
	
func tutorial():
	show_message("Anniversary")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Use the left and right arrow keys to move.\nUse the up arrow key to jump."
	$MessageLabel.show()
	yield(get_tree().create_timer(3), "timeout")
	$MessageLabel.hide()
	
func show_anniversary():
	show_message("Happy Anniversary Mama and Dada!")
	yield(get_tree().create_timer(3), "timeout")	
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Anniversary\nPlay Again!"
	$MessageLabel.show()
	yield(get_tree().create_timer(3), "timeout")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/TitleScreen.tscn")

func _on_MessageTimer_timeout():
	$MessageLabel.hide()


