class_name Player extends CharacterBody2D

@onready var playerSprite2D: Sprite2D = $Sprite2D
@onready var movementStateMachine: Node = $MovementStateMachine
@onready var playerMoveComponent = $PlayerMoveComponent

func _ready() -> void:
  movementStateMachine.init(self, playerSprite2D, playerMoveComponent)

func _unhandled_input(event: InputEvent) -> void:
  movementStateMachine.handleInput(event)

func _physics_process(delta: float) -> void:
  movementStateMachine.handlePhysics(delta)

func _process(delta: float) -> void:
  movementStateMachine.update(delta)
