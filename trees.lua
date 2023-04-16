--Global configuration settings
FarmPadding = 4 --Amount of blocks between tree positions.
FarmSize = 4 -- Actual size of each row measured in tree slots
sleepTime = 20

local function harvest()
  turtle.dig()
  turtle.forward()
  turtle.digDown()
  while(turtle.compareUp()) do
    turtle.digUp() 
    turtle.up() 
    if(turtle.getItemCount(2) < 63) then
      turtle.select(2)
      turtle.drop()
    end
  end
  os.sleep(5)
  while(turtle.down()) do end
  turtle.back()
end

local function reset(size)
  for pos = 0, FarmPadding*(size-1)-1 do
    turtle.back()
  end
end

while(true) do
  --Begin cycle
  for pos = 0, FarmSize-1 do
    if(turtle.compare()) then
      turtle.turnLeft()
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
  os.sleep(sleepTime)
end
