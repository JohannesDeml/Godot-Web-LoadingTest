extends Node

@export var show_info_panel_by_default: bool = true
@export var track_awake_time: bool = true

@export_group("FPS Tracking")
@export var track_fps: bool = true
@export var update_interval: float = 0.5

var _time_since_last_update: float = 0.0
var _last_frame_count: int = 0

func _ready():
	# Set global variables that are shown in the info panel
	WebToolPlugins.set_variable("godotVersion", "%s.%s.%s" % [Engine.get_version_info()["major"], Engine.get_version_info()["minor"], Engine.get_version_info()["patch"]])
	WebToolPlugins.set_variable("applicationVersion", ProjectSettings.get_setting("application/config/version"))
	WebToolPlugins.set_variable("webGlVersion", _get_graphics_api())

	if show_info_panel_by_default:
		WebToolPlugins.show_info_panel()
	else:
		WebToolPlugins.hide_info_panel()

	if track_awake_time:
		WebToolPlugins.add_time_tracking_event("Ready")

func _process(delta: float):
	if not track_fps:
		set_process(false)
		return

	_time_since_last_update += delta
	if _time_since_last_update >= update_interval:
		var current_frame = Engine.get_frames_drawn()
		var frame_count = current_frame - _last_frame_count
		var fps = frame_count / _time_since_last_update

		WebToolPlugins.add_fps_tracking_event(fps)
		_time_since_last_update = 0
		_last_frame_count = current_frame

func _get_graphics_api() -> String:
	var graphics_api = "Unknown"
	if OS.has_feature("web"):
		graphics_api = "WebGL"
		# WebGL version can be determined by checking WebGL2 support
		if OS.has_feature("webgl2"):
			graphics_api += " 2"
		else:
			graphics_api += " 1"
	else:
		graphics_api = RenderingServer.get_video_adapter_api_version()
	return graphics_api
