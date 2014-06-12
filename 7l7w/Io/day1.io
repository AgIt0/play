# Is io strongly or weakly typed
1 + "one" # Throws and Exception so it's strongly typed.

# Is 0 true or false? What about the empty string? Is nil true or false?
if(0) println # true
if("") println # true
if(nil) println # false

# How can you tell what slots a prototype supports
  Object slotNames # returns a list of slots, or add println in the end to print them

# What is the difference between =(equals), :=(colon equals), and ::=(colon colon equals)?
# =(equals) assigns value to slot if exists, otherwise raises exception
# :=(colon equals) creates slot, assigned value
# ::=(color colon equals) crates slot, creates setter, assigns valu

# to run from a file either add a shebang and run the file or call io's interpreter with the file as an argument

# Execute the code in a slot given its name
Vehicle := Object clone
Vehicle executer := method(name, perform(name))
Vehicle executer("type")
