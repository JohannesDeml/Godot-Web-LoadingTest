extends SceneTree
# Saves the project settings with the running Godot version, which updates config/features to that version
# example usage
# godot --headless --path godot --script ../.github/scripts/save-project-settings.gd

func _init() -> void:
	var error := ProjectSettings.save()
	if error != OK:
		push_error("Failed to save project settings: %s" % error_string(error))
	quit(error)
