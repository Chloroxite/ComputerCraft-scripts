local cmd = read()
--Computer ID whitelist
local computers = {24, 25}

if(cmd == "exit" or type(cmd) == "number") then
  rednet.open()
  while(true) do
    for id in computers do
     rednet.send(computers[id], cmd)
    end
    os.sleep(1)
  end
else
  print("Invalid value")
end
