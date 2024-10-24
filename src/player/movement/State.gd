class_name State extends Node

var parent: CharacterBody2D
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var sprite2D: Sprite2D
var moveComponent

@export var moveSpeed: float = 250.0

func enter() -> void:
  pass

func handleInput(_event: InputEvent) -> State:
  return null

func handlePhysics(_delta: float) -> State:
  return null

func update(_delta: float) -> State:
  return null

func getMovementInput() -> float:
  return moveComponent.getMovementDirection()

func getJump() -> bool:
  return moveComponent.getJumpAction()

func exit() -> void:
  pass
