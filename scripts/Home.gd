extends Node2D

func _ready():
	$HUD.tutorial()

func _on_Goal_body_entered(_body):
	$HUD.show_anniversary()

func _on_ChecksHello_body_exited(_body):
	$HUD.show_message("Hello Mama and Dada.\nYou might be wondering why I am making you play this game.")

func _on_ChecksReason_body_exited(_body):
	$HUD.show_message("I wanted to express my love and  appreciation.\nYou have played a very important role in my life.\nYou are the reason, I could make this small game.")

func _on_ChecksBackground_body_exited(_body):
	$HUD.show_message("I've had to walk a lot in my life.\nBut you were there every step of the way.")

func _on_ChecksLeap1_body_exited(_body):
	$HUD.show_message("You helped me through my difficulties.\nNo matter how small...")

func _on_ChecksLeap2_body_exited(_body):
	$HUD.show_message("... or big.")

func _on_ChecksFamily_body_exited(_body):
	$HUD.show_message("But I always know that my family is there for me.")

func _on_ChecksUp1_body_exited(_body):
	$HUD.show_message("Every step of the way.")	

func _on_ChecksUp2_body_exited(_body):
	$HUD.show_message("And  when I feel low,\nyour words of encouragement push me further up.")

func _on_ChecksBoost1_body_exited(_body):
	$HUD.show_message("I know I could always rely on a power up from you.")	

func _on_ChecksBoost2_body_exited(_body):
	$HUD.show_message("Thank you for being my parents.")	

func _on_CheckFall_body_exited(_body):
	$HUD.show_message("And sometimes I fall")	

func _on_CheckRestart_body_exited(body):
	get_tree().reload_current_scene()
