--BCController: A script designed to allow for the easy automation of either a botania alter or petal apothecary, depending on the launch args.
--Launch with argument "minecraft:water_bucket" for petal apothecary, "botania:livingrock" for an altar.
--This script also assumes the use of vanilla chests. Sorry, iron chest users.
--Launch a crafting cycle by inputing a redstone signal into the turtle.
--Once a crafting cycle is ongoing, do not add or remove items from the input chest. It could mess things up.
--System does not account for invalid recipes. If you mess up a recipe, you will have to fix it yourself.

local args = {...}
SearchItem = args[1]

local function main()
  while(true) do
    --Await on redstone input from left side (Resting position is facing the bucket chest.)
    os.PullEvent("redstone")
    craft()
  end
end

local function craft()
  --TODO: change this to use modems instead of just using peripheral wrap.
  local invFront = peripheral.wrap("front") --Wrap around the seeding chest.
  local invBack = peripheral.wrap("back") --Wrap around the input chest.
  if(searchInv(SearchItem, invFront) == nil) then
    --Chest does not have items, throw error.
    print("ERROR: Seeding item not found. Please refill the seeding chest.")
    print("Current seeding setting: " + SearchItem)
    return 0
  else --If the chest has items, pull and continue.
    turtle.suck(1)
    --find the first row that has items.
    --if at least one run is found that has items, loop again.
    repeat
      local itemsFound = false
      for beginSlot = 1, invBack.size(), 9 do
        if(invBack.getItemDetail(beginSlot) ~= nil) then
          --begin cycling through this row if items are found.
          itemsFound = true
          for slot = beginSlot, beginSlot+9, 1 do
            
          end
        end
      end
    until(not itemsFound)
    
  end
end

local function searchInv(item, inventory)
  local size = inventory.size()
  for i = 1, size, 1 do
    slot = inventory.getItemDetail(i)
    if(slot.name == item) then
      return i
    end
  end
  return nil
end
