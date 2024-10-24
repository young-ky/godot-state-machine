class_name Dash extends Run

@export var runState: State

@export var timeToDash: float = 0.3
@export var dashTimer: float = 0.0
@export var direction: float = 1.0

func enter() -> void:
  super()
  dashTimer = timeToDash

  if (sprite2D.flip_h):
    direction = -1
  else:
    direction = 1

func handleInput(_event: InputEvent) -> State:
  return null

func handlePhysics(delta: float) -> State:
  dashTimer -= delta
  if (dashTimer <= 0.0):
    if (super.getMovementInput() != 0.0):
      return runState
    return idleState

  return super(delta)
  

func getMovementInput() -> float:
  return direction

func getJump() -> bool:
  return false

