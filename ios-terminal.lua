function main()
  --iOS configuration
  --lol nothing's here yet.
  --Actual code begins
  io.write("Welcome to IndexOS!")
  io.write("Connection to master server established.")
  io.write("Type 'help' for commands")
  Input = ""
  repeat
    io.write("iOS> ")
    Input = io.read()
  until(Input == "quit")
end

function parseCommand(input)
  --Read input one word at a time and insert each word into a token, maybe use a stack?
  local cmdStack = {}
  
end

main()
