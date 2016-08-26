# Canivete

## Usage
Download file and load library.
```lua
local canivete = require "canivete"
```

## Reference

### shuffle(table)
Randomizes the order of the elements in the table.
```lua
local numbers = { 0, 1, 2, 3, 4, 5  }
canivete.shuffle( numbers )
for i=1, #numbers do print( numbers[i] ) end

local houses = { 'Tyrell', 'Stark', 'Lanniter', 'Targaryen', 'Greyjoy', 'Martell', 'Frey' }
canivete.shuffle( houses )
for i=1, #houses do print( houses[i] ) end
```

### orderAsc(table,[key])
Sorts the table in ascending order.
```lua
local starks = { 'Ned', 'Catelyn', 'Jon Snow', 'Robb', 'Sansa', 'Arya', 'Bran', 'Rickon' }
canivete.orderAsc( starks )
for i=1, #starks do print( starks[i] ) end
-- output:
--  Arya
--  Bran
--  Catelyn
--  Jon Snow
--  Ned
--  Rickon
--  Robb
--  Sansa
```

### orderDesc(table,[key])
Sort the table in a descending order.
```lua
local lannisters = { 
    { name='Tywin', score=430 },
    { name='Joanna', score=260 },
    { name='Cersei', score=840 },
    { name='Jaime', score=620 },
    { name='Tyrion', score=999 } }
canivete.orderDesc( lannisters, 'score' )
for i=1, #lannisters do print( lannisters[i].name, lannisters[i].score ) end
-- output:
--  Tyrion  999
--  Cersei  840
--  Jaime   620
--  Tywin   430
--  Joanna  260
```

### sum(table)
Returns the total sum of a table.
```lua
local numbers = { 0, 1, 2, 3, 4, 5  }
local sum = canivete.sum( numbers )
print( 'sum', sum )
-- output:
--  sum 15
```

### avg(table)
Returns the average value of a table.
```lua
local numbers = { 0, 1, 2, 3, 4, 5  }
local avg = canivete.avg( numbers )
print( 'avg', avg )
-- output:
--  avg 7.5
```

### clamp(value, min, max)
Clamps a value between a minimum number and maximum number value
```lua
local clamp = canivete.clamp( -20, -5, 10 )
print( 'clamp', clamp )
-- output:
--  clamp   -5

local clamp = canivete.clamp( 10, 0, 8 )
print( 'clamp', clamp )
-- output:
--  clamp   8
```

### lerp(start, end, interpolation)
Returns the interpolated number result between the two number values
```lua
local lerp = canivete.lerp( 5, 10, 0.5 )
print( 'lerp', lerp )
-- output:
--  lerp    7.5
```

### hex2rgb(string)
Converts a hexadecimal string color to rgb (0-1).
```lua
print( canivete.hex2rgb( '#ff0000' ) )
-- 1, 0, 0 (red)
print( canivete.hex2rgb( '#00ff00' ) )
-- 0, 1, 0 (green)
print( canivete.hex2rgb( '#0000ff' ) )
-- 0, 0, 1 (blue)
```
