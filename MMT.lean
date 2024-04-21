import Mathlib.Data.Fintype.Card

universe u v w x

-- A Mealy Machine with Timers
structure MMT (q : Type u) (i : Type v)
            (o : Type w) (t : Type x) where
    /-- Active timers per state -/
  active : q → Set t
    /-- A partial transition function, NOTE: we are really
        defining MMTs and not gMMTs, though that would
        be easy by taking t -> Nat instead of Option Nat
        for the update -/
    step : q → (Sum i t) → Option (o × q × Option Nat)
    /-- A single initial state -/
    start : q

-- Timer valuations
structure Tval (t : Type x) where



namespace MMT

variable {q : Type u} {i : Type v}
        {o : Type w} {t : Type x}
        (M : MMT q i o t)

instance [Inhabited q] : Inhabited (MMT q i o t) :=
    ⟨MMT.mk (fun _ => ∅) (fun _ _ => default) default⟩

end MMT
