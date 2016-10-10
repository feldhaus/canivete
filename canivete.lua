--[[
MIT License

Copyright (c) 2016 Maicon Feldhaus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]--

local _M = {}

-- shuffle a table
function _M.shuffle( t )
    assert( type( t ) == "table", "bad argument #1 to 'shuffle' (table expected, got " .. type( t ) .. ")" )
    
    local rand = math.random
    local iterations = #t
    local j
    
    for i = iterations, 2, -1 do
        j = rand(i)
        t[i], t[j] = t[j], t[i]
    end
end

-- returns a number between min and max values
function _M.randomBetween( min, max )
    -- bad argument #1 to 'function' (table expected, got string)
    assert( type( min ) == "number", "bad argument #1 to 'randomBetween' (number expected, got " .. type( min ) .. ")" )
    assert( type( max ) == "number", "bad argument #2 to 'randomBetween' (number expected, got " .. type( max ) .. ")" )
    assert( min < max, "bad argument #1 to 'randomBetween' (min is greater than max)" )
    
    return min + math.random() * ( max - min )
end

-- sorts the table in ascending order
function _M.orderAsc( t, key )
    assert( type( t ) == "table", "bad argument #1 to 'orderAsc' (table expected, got " .. type( t ) .. ")" )
    
    if key then
        assert( type( key ) == "string", "bad argument #2 to 'orderAsc' (string expected, got " .. type( key ) .. ")" )
        table.sort( t, function( a,b ) return a[key] < b[key] end )
    else
        table.sort( t, function( a,b ) return a < b end )
    end
end

-- sort the table in a descending order
function _M.orderDesc( t, key )
    assert( type( t ) == "table", "bad argument #1 to 'orderDsc' (table expected, got " .. type( t ) .. ")" )
    
    if key then
        assert( type( key ) == "string", "bad argument #2 to 'orderDsc' (string expected, got " .. type( key ) .. ")" )
        table.sort( t, function(a,b) return a[key] > b[key] end )
    else
        table.sort( t, function(a,b) return a > b end )
    end
end

-- returns a copy of the object original
function _M.clone( orig )
    local copy = orig -- number, string, boolean, etc
    if type( orig ) == 'table' then -- if table
        copy = {}
        for k, v in next, orig, nil do
            copy[_M.clone( k )] = _M.clone( v )
        end
        setmetatable( copy, _M.clone( getmetatable( orig ) ) )
    end
    return copy
end

-- returns the sum table values
function _M.sum( t )
    assert( type( t ) == "table", "bad argument #1 to 'sum' (table expected, got " .. type( t ) .. ")" )
    
    local sum = 0
    for i=1, #t do sum = sum + t[i] end
    return sum
end

-- returns the average of table values
function _M.avg( t )
    assert( type( t ) == "table", "bad argument #1 to 'avg' (table expected, got " .. type( t ) .. ")" )
    
    return _M.sum( t ) / #t
end

-- clamps a value between a minimum number and maximum number value
function _M.clamp( value, min, max )
    assert( type( value ) == "number", "bad argument #1 to 'clamp' (number expected, got " .. type( value ) .. ")" )
    assert( type( min ) == "number", "bad argument #2 to 'clamp' (number expected, got " .. type( min ) .. ")" )
    assert( type( max ) == "number", "bad argument #3 to 'clamp' (number expected, got " .. type( max ) .. ")" )
    
    return ( value < min ) and min or ( value > max ) and max or value
end

-- returns the interpolated number result between the two number values
function _M.lerp( a, b, t )
    assert( type( a ) == "number", "bad argument #1 to 'lerp' (number expected, got " .. type( a ) .. ")" )
    assert( type( b ) == "number", "bad argument #2 to 'lerp' (number expected, got " .. type( b ) .. ")" )
    assert( type( t ) == "number", "bad argument #3 to 'lerp' (number expected, got " .. type( t ) .. ")" )
    
    return a + ( b - a ) * t
end

-- converts a hexadecimal string color to rgb (0-1)
function _M.hex2rgb( hex )
    assert( type( hex ) == "string", "bad argument #1 to 'hex2rgb' (string expected, got " .. type( hex ) .. ")" )
    
    local r = tonumber( "0x" .. hex:sub( 2, 3 ) ) / 255
    local g = tonumber( "0x" .. hex:sub( 4, 5 ) ) / 255
    local b = tonumber( "0x" .. hex:sub( 6, 7 ) ) / 255
    
    return r, g, b
end

return _M
