--Index Operating System is a storage network solution built in computercraft version 1.41.
--ios-terminal.lua is a script designed to be used in a wireless terminal.
--The script will interact with the master server, sending over any commands that require access to the index system itself.

Deque = require("Deque.lua")

function main()
  --iOS commands (only really used for displaying correct usage in case of errors)
  CmdUsage = {
    ["about"]     = "Usage: about\nDisplays OS information",
    ["help"]      = "Usage: help <command?>\nProvides help on OS or command usage.",
    ["request"]   = "Usage: request <item> <amount>\nSends an item request to the master server.",
    ["register"]  = "Usage: register" +
                    "\nBegins item registration process." +
                    "\nPlease ensure that no duplicates are introduced, and provide full stacks where possible." +
                    "\nSystem will be unavailable during this process.",
    ["search"]    = "Usage: search <item>",
  }
  --iOS configuration
  --lol there's nothing here yet.
  --Actual code begins
  io.write("Welcome to IndexOS!")
  io.write("Connection to master server established.")
  io.write("Type 'help' for commands")
  Input = ""
  repeat
    --User Interface
    io.write("iOS> ")
    Input = io.read()
    parseCommand(Input)
  until(Input == "quit")
end

function parseCommand(input)
  --Split command into seperate arguments in a table. 
  local args = {}
  for s in input:gmatch("%S+") do
      table.insert(args, s)
  end
  --Figure out what the command and parameters are.
  --Use pcall as try catch equivalent.
  
end

main()
