extends StaticBody3D

@onready var bottom_detector = $BottomDetector
@onready var mesh = $Mesh
@onready var particles = $Particles

var exploded = false

func _ready():
	# Obtain the original particle mesh from the native GLB import.
	var particle_model = preload("res://models/brick-particle.glb").instantiate()
	var particle_mesh = particle_model as MeshInstance3D
	if particle_mesh == null:
		for child in particle_model.find_children("*", "MeshInstance3D", true, false):
			particle_mesh = child
			break
	if particle_mesh != null:
		particles.draw_pass_1 = particle_mesh.mesh
	particle_model.free()
	bottom_detector.body_entered.connect(_on_bottom_hit)

func _on_bottom_hit(body: Node3D) -> void:
	if body.is_in_group("player"):
		explode()

func explode():
	
	if exploded:
		return
		
	exploded = true
	
	Audio.play("res://sounds/break.ogg") # Play sound
	
	particles.restart()
	
	mesh.hide()
	$CollisionShape3D.set_deferred("disabled", true)
	bottom_detector.set_deferred("monitoring", false)
	
	await get_tree().create_timer(1).timeout
	queue_free()
