class_name PlayerMovementComponent extends Node

func getMovementDirection() -> float:
  return Input.get_axis('left', 'right')

func getJumpAction() -> bool:
  return Input.is_action_just_pressed('jump')
