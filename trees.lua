--Global configuration settings
FarmPadding = 4 --Amount of blocks between tree positions.
FarmSize = 4 -- Actual size of each row measured in tree slots
SleepTime = 20

local function harvest()
  turtle.dig()
  turtle.forward()
  turtle.digDown()
  repeat
    turtle.digUp() 
    turtle.up() 
    turtle.select(2)
    turtle.drop()
    turtle.select(1)
  until(not turtle.compareUp())

  os.sleep(5)
  repeat until(not turtle.down())
  turtle.back()
end

local function reset(size)
  turtle.turnLeft()
  turtle.turnLeft()
  for pos = 0, FarmPadding*(size-1)-1 do
    turtle.forward()
    turtle.dig()
  end
  turtle.turnLeft()
  turtle.turnLeft()
end

while(true) do
  --Begin cycle
  for pos = 0, FarmSize-1 do
    turtle.turnLeft()
    if(turtle.compare()) then 
      harvest()
    end
    turtle.turnRight()
    if(pos ~= FarmSize-1) then
      for i = 0, FarmPadding-1 do
        turtle.dig()
        turtle.forward()
      end
    end
  end
  reset(FarmSize)
  os.sleep(SleepTime)
end
