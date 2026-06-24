extends Control


func _on_gym_dsp_bench_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/gym/dsp_bench.tscn")
