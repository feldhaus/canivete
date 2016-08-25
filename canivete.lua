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
    assert( type( t ) == "table", "'shuffle' expected a table, got " .. type( t ) .. ")" )
    
    local rand = math.random
    local iterations = #t
    local j
    
    for i = iterations, 2, -1 do
        j = rand(i)
        t[i], t[j] = t[j], t[i]
    end
end

-- sorts the table in ascending order
function _M.orderAsc( t, key )
    assert( type( t ) == "table", "'orderAsc' expected a table, got " .. type( t ) .. ")" )
    
    if key then
        assert( type( key ) == "string", "'orderAsc' (expects a string, got " .. type( key ) .. ")" )
        table.sort( t, function(a,b) return a[key] < b[key] end )
    else
        table.sort( t, function(a,b) return a < b end )
    end
end

-- sort the table in a descending order
function _M.orderDesc( t, key )
    assert( type( t ) == "table", "'orderDsc' expected a table, got " .. type( t ) .. ")" )
    
    if key then
        assert( type( key ) == "string", "'orderDsc' (expects a string, got " .. type( key ) .. ")" )
        table.sort( t, function(a,b) return a[key] > b[key] end )
    else
        table.sort( t, function(a,b) return a > b end )
    end
end

-- converts a hexadecimal string color to rgb (0-1)
function _M.hex2rgb( hex )
    assert( type( hex ) == "string", "'hex2rgb' expected a string, got " .. type( hex ) .. ")" )
    
    local r = tonumber( "0x" .. hex:sub( 2, 3 ) ) / 255
    local g = tonumber( "0x" .. hex:sub( 4, 5 ) ) / 255
    local b = tonumber( "0x" .. hex:sub( 6, 7 ) ) / 255
    return r, g, b
end

return _M