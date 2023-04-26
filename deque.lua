--Forked from FabricatorZayac's Queue implementation: https://github.com/Zayac-The-Engineer/ComputerCraft-tekkit/blob/main/queue.lua
--Intended for more generic use as either a queue or a stack.
Deque = {}

function Deque:push(value)
  local last = self.last + 1
  self.last = last
  self[last] = value
end

function Deque:popB()
  local first = self.first
  if first > self.last then error("queue is empty") end
  local value = self[first]
  self[first] = nil        -- to allow garbage collection
  self.first = first + 1
  return value
end

function Deque:popE()
  local last = self.last
  if last < self.last then error("queue is empty") end
  local value = self[last]
  self[last] = nil        --something something garbage collection
  self.last = last - 1
  return value
end


function Deque:isEmpty()
  return self.first > self.last
end

function Deque.new()
  local self = {
    first = 0,
    last = -1,
    push = Deque.push,
    pop = Deque.pop,
    isEmpty = Deque.isEmpty,
  }
  return self
end

return Deque
