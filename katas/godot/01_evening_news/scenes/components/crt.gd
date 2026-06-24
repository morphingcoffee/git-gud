extends Node3D

const RANGES := {
	"bandpass_hz": Vector2(200.0, 8000.0),
	"amp_db": Vector2(-20.0, 10.0),
	"pan": Vector2(-1.0, 1.0),
}

@onready var amplify: AudioEffectAmplify = AudioServer.get_bus_effect(
	AudioServer.get_bus_index("Bench"),
	0
)

@onready var bandpass: AudioEffectBandPassFilter = AudioServer.get_bus_effect(
	AudioServer.get_bus_index("Bench"),
	1
)

@onready var panner: AudioEffectPanner = AudioServer.get_bus_effect(
	AudioServer.get_bus_index("Bench"),
	2
)

func _on_bandpass_value_changed(value: float) -> void:
	bandpass.cutoff_hz = _map_range(RANGES["bandpass_hz"], value)

func _on_amplify_value_changed(value: float) -> void:
	amplify.volume_db = _map_range(RANGES["amp_db"], value)

func _on_panner_value_changed(value: float) -> void:
	panner.pan = _map_range(RANGES["pan"], value)

func _map_range(range: Vector2, fraction: float) -> float:
	var f = clamp(fraction, 0.0, 1.0)
	if not is_equal_approx(f, fraction):
		print("Warning: clamp applied")
	return lerpf(range.x, range.y, f)
