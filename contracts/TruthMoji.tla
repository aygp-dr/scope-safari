-------------------------------- MODULE TruthMoji --------------------------------
EXTENDS Naturals, Sequences, TLC

\* This is a TLA+ specification for the TruthMoji system.
\* It defines the formal behavior of the emoji conversion and usage count tracking.

VARIABLES 
    count,    \* Usage count
    output    \* Current emoji output

TypeOK == 
    /\ count \in Nat
    /\ output \in {"😊", "😔", ""}

Init ==
    /\ count = 0
    /\ output = ""

\* Emojify function for true value
EmojifyTrue ==
    /\ count' = count + 1
    /\ output' = "😊"

\* Emojify function for false value
EmojifyFalse ==
    /\ count' = count + 1
    /\ output' = "😔"

\* Get usage count operation
GetUsage ==
    /\ count' = count
    /\ output' = output

\* Defining all possible next states
Next ==
    \/ EmojifyTrue
    \/ EmojifyFalse
    \/ GetUsage

\* Temporal properties

\* The usage count never decreases
CountNeverDecreases ==
    [][\/ count' = count
       \/ count' = count + 1]_count

\* Output is always a valid emoji or empty
OutputAlwaysValid ==
    [](output \in {"😊", "😔", ""})

\* Usage count correctly reflects number of emoji conversions
\* This property is a bit more complex and would require additional
\* modeling of actions in a real specification

\* For model checking
Spec == Init /\ [][Next]_<<count, output>>

THEOREM Spec => [](TypeOK /\ CountNeverDecreases /\ OutputAlwaysValid)

=============================================================================