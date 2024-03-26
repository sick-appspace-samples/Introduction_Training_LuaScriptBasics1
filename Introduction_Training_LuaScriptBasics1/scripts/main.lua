-- -----------------------------------------------------------------------------
print( "----- Find out the Lua version used on your device" )
-- -----------------------------------------------------------------------------

print( _VERSION )                       -- console output: "Lua 5.3"

-- -----------------------------------------------------------------------------
print( "----- Work with comments" )
-- -----------------------------------------------------------------------------

-- Two dashes start a comment till the end of the line.
--[[
     Adding two open brackets '[' and two closed brackets ']' makes it a multi-
     line comment.
--]]

-- -----------------------------------------------------------------------------
print( "----- Print something" )
-- -----------------------------------------------------------------------------

print( "SICK AppSpace is my new world of solutions!" )
                                        -- console output: "SICK AppSpace is my new world of solutions!"

-- -----------------------------------------------------------------------------
print( "----- Duck-Typing" )
-- -----------------------------------------------------------------------------

-- Check out the "Duck-Typing" of Lua:
local a = 42         -- this includes integers as well as floating point numbers!
print( type( a ) )   -- console output: "number"
a = true
print( type( a ) )   -- console output: "boolean"
a = "Hello"          -- single (') or double (") quotes are possible
print( type( a ) )   -- console output: "string"
a = nil
print( type( a ) )   -- console output: "nil"
a = { 1, 2, 3 }      -- index counter starts with 1, not 0!
print( type( a ) )   -- console output: "table"
a = function() end
print( type( a ) )   -- console output: "function"

-- -----------------------------------------------------------------------------
print( "----- Mathematical operators" )
-- -----------------------------------------------------------------------------

print( 1 + 2 * 2 )                      -- console output: "5"
print( 2 ^ 3 )                          -- console output: "8"
print( 2 < 1 )                          -- console output: "false"
print( true or false and true )         -- console output: "true"

-- -----------------------------------------------------------------------------
print( "----- Concatenate strings" )
-- -----------------------------------------------------------------------------

-- Concatenate strings using two dots '..':
print( "This is " .. 42 )               -- console output: "This is 42"
-- The number is automatically casted to a string.

-- -----------------------------------------------------------------------------
print( "----- Length of variable / table" )
-- -----------------------------------------------------------------------------

-- Getting length/size of variable/table via prepending hash, i.e. '#':
--print( #a )                           -- console output: "Runtime error: attempt to get length of a function value (local 'a')"
local b = {}
print( #b )                             -- console output: "0"
local c = 5
--print( #c )                           -- console output: "Runtime error: attempt to get length of a number value (local 'c')"
print( #"Hello number " .. c )          -- console output: "135"
print( #'This is a sentence.' )         -- console output: "19"

-- -----------------------------------------------------------------------------
print( "----- Local and global context of variables" )
-- -----------------------------------------------------------------------------

-- Take care about local and global context of variables:
-- Default is global!
local function myFunction()   -- define the assignment function
  local myPrivateText = "This is private"
  myPublicText = "This is public"
  print( "From function context:" )     -- console output: "From function context:"
  print( myPrivateText )                -- console output: "This is private"
  print( myPublicText )                 -- console output: "This is public"
end
myFunction()   -- call the assignment function
print( "From global context:" )         -- console output: "From global context:"
print( myPrivateText )                  -- console output: "nil"
print( myPublicText )                   -- console output: "This is public"

-- -----------------------------------------------------------------------------
print( "----- Single and multiple assignments" )
-- -----------------------------------------------------------------------------

-- You can do single and multiple assignments:
a = 42
local d = false
b, c, d = 1, "Hello", true
print( a, b, c, d )                     -- console output: "42    1    Hello    true"

-- -----------------------------------------------------------------------------
print( "----- Return values" )
-- -----------------------------------------------------------------------------

-- Return values can be multiple as well:
local function returnMultiple()   -- define a function

  return "Hello", "World"
end
print( returnMultiple() )               -- console output: "Hello    World"

-- -----------------------------------------------------------------------------
print( "----- Return values, function calls, and parameters work also with mismatch" )
-- -----------------------------------------------------------------------------

local x, y, z = 1, 2, 3, 4   -- 4 is thrown away as it misses a variable to be assigned to
local function bar( a, b, c )
  print( a, b, c )                      -- console output: "zaphod    nil    nil"

  return 4, 8, 15, 16, 23, 42
end
x, y = bar( "zaphod" )
print( x, y, z )                        -- console output: "4    8    3"
-- Now, x = 4, y = 8, z remains unchanged and values 15, 16, 23, and 42 are discarded.

-- -----------------------------------------------------------------------------
print( "----- Functions are also variables" )
-- -----------------------------------------------------------------------------

local function doSomething()
  print( "SICK Sensor Intelligence." )
end
doSomething()   -- execute the function, console output: "SICK Sensor Intelligence."

-- is the same as:
local doSomething = function () print( "SICK Sensor Intelligence." ) end
doSomething()   -- execute the function, console output: "SICK Sensor Intelligence."

-- -----------------------------------------------------------------------------
print( "----- Functions can be closures and anonymous" )
-- -----------------------------------------------------------------------------

local function adder( x )
  -- The returned function is created when adder is called and
  -- remembers the value of x:

  return function ( y ) return x + y end
end
local a1 = adder( 9 )
print( a1( 16 ) )                       -- console output: "25"
