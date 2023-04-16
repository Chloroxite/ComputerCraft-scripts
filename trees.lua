--Global configuration settings
FarmPadding = 4 --Amount of blocks between tree positions.
FarmSize = 4 -- Actual size of each row measured in tree slots

local function harvest()
  turtle.dig()
  turtle.forward()
  turtle.drop(1)
  turtle.digDown()
  turtle.drop(1)
  while(turtle.compareUp()) do
    turtle.digUp()
    turtle.drop(1)
    turtle.up()
  end
  os.sleep(5)
  while(turtle.down()) do end
  turtle.back()
end

local function reset(size)
  for pos = 0, (FarmPadding-1)*size do
    turtle.back()
  end
end

while(true) do
  --Begin cycle
  for pos = 0, FarmSize-1 do
    turtle.turnLeft()
    if(turtle.compare()) then
      harvest()
    end
    turtle.turnRight()
    for i = 0, FarmPadding-1 do
      turtle.forward()
    end
  end
  reset(FarmSize)
end
