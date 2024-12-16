extends PathFollow2D

var target_ratio: float = 0.0  # The desired progress_ratio
var smooth_speed: float = 1.0  # Speed of interpolation (tweak as needed)

func _input(event):
	# Check if the event is a key press event and the key is pressed
	if event is InputEventKey and event.pressed:
		# Check if the keycode corresponds to numbers 0-9
		if event.keycode >= KEY_0 and event.keycode <= KEY_9:
			var number_pressed = event.keycode - KEY_0  # Convert keycode to actual number
			print("Number pressed:", number_pressed)
			
			# Set the target progress_ratio (0.x based on number pressed)
			target_ratio = number_pressed / 10.0
			print("Target progress_ratio:", target_ratio)

func _process(delta: float) -> void:
	# Smoothly interpolate progress_ratio toward the target value
	progress_ratio = lerp(progress_ratio, target_ratio, smooth_speed * delta)
