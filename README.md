# pdType

Common data types for data visualization. Types are named in "pdXXXX" style, e.g., "pdString", "pdNumber"


## Basic Type Structure

All types are designed as a JavaScript object with proper constructor, with following interface:

 * name: string. name of type
 * default: default value
 * test: (v) ->   # return true or false
   - test if v is compatible with this type.
 * parse: (v) ->
   - parse v into internal format of this type.
 * order:
 * sort: (a, b) -> # comparator function for sorting.


## Common Types

 * string
 * numstring
 * number
 * order
 * boolean
 * date


### Advanced Types

 * strings with constraint
   - choice

 * orderable
   * weekday
   * month


## Type Polymorphism

Value in one type could be also in another type.



## pdType common function.

pdType, as an object, exposes following interface:

 * identify: (input)
   - input either a value or an array.


## LICENSE

MIT
