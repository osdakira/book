"Hi ho, Io" print
Vehicle := Object clone
Vehicle description := "Something to take you places"
Vehicle description = "Something to take you far away" # raise error
Vehicle nonexistingSlot = "This won’t work."
Vehicle description
Vehicle slotNames
Io> Vehicle type
==> Vehicle
Io> Object type
==> Object
Car := Vehicle clone
Car slotNames
Car type
Car description
ferrari := Car clone
ferrari slotNames
Io> ferrari type
==> Car

Ferrari := Car clone
Ferrari type
Ferrari slotNames
ferrari slotNames
method("So, you’ve come for an argument." println)
method() type
Car drive := method("Vroom" println)
ferrari drive
ferrari getSlot("drive")
ferrari getSlot("type")
ferrari proto
Car proto
Lobby

toDos := list("find my car", "find Continuum Transfunctioner")
toDos size
==> 2
Io> toDos append("Find a present")

list(1, 2, 3, 4)
list(1, 2, 3, 4) average
list(1, 2, 3, 4) sum
list(1, 2, 3) at(1)
list(1, 2, 3) append(4)
Io> list(1, 2, 3) pop
==> 3
Io> list(1, 2, 3) prepend(0)
==> list(0, 1, 2, 3)
Io> list() isEmpty
==> true

Io> elvis := Map clone
==> Map_0x115f580:
  Io> elvis atPut("home", "Graceland")
==> Map_0x115f580:
  Io> elvis at("home")
==> Graceland
Io> elvis atPut("style", "rock and roll")
==> Map_0x115f580:
Io> elvis asObject

Io> elvis asList
==> list(list("style", "rock and roll"), list("home", "Graceland"))
Io> elvis keys
==> list("style", "home")
Io> elvis size
==> 2


true proto

Io> Highlander := Object clone
==> Highlander_0x378920:
    type = "Highlander"
Io> Highlander clone := Highlander
==> Highlander_0x378920:
    clone = Highlander_0x378920
    type = "Highlander"

loop("getting dizzy..." println)

i:=0
while(i <= 11, i println; i = i + 1); "This one goes up to 11" println

for(i, 1, 11, i println); "This one goes up to 11" println

for(i, 1, 11, 2, i println); "This one goes up to 11" println


Io> if(true, "It is true.", "It is false.")
==> It is true.
Io> if(false) then("It is true") else("It is false")
==> nil
Io> if(false) then("It is true." println) else("It is false." println) It is false.
==> nil

OperatorTable

OperatorTable addOperator("xor", 11)


Io> true xor := method(bool, if(bool, false, true))
 ==> method(bool,
if(bool, false, true) )
Io> false xor := method(bool, if(bool, true, false))
 ==> method(bool,
if(bool, true, false) )
