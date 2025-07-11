from librelane.steps import Step
from librelane.state import State

initial_state = State()

Synthesis = Step.factory.get("Yosys.Synthesis")
Synthesis.display_help()
