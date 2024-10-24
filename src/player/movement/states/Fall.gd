class_name Fall extends State

@export var idleState: State
@export var runState: State

func handlePhysics(delta: float) -> State:
  parent.velocity.y += gravity * delta

  var movement = getMovementInput() * moveSpeed

  if (movement != 0):
    sprite2D.flip_h = (movement < 0)
  parent.velocity.x = movement
  parent.move_and_slide()

  if (parent.is_on_floor()):
    if (movement != 0):
      return runState
    return idleState

  return null
