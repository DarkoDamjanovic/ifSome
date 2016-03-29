# ifSome

`ifSome` is an attempt to create an alternative functional shorthand syntax of optional binding (`if let`) in Swift. Use it like this:

    let text: String? = "txet emoS"  
    
    text.ifSome{ print($0) } // clean and intuitive
     
    text.ifSome {
        let reversed = String($0.characters.reverse())
        print(reversed)
    }

If the String is `nil` the closure will not be called.

Another use case is in conjunction with flatMap:

    let number: Int? = 5
    number.flatMap({ Double($0) }).ifSome{ print($0) }

Most of the time `if let` (or `guard`) is used in Swift to check for `nil`, which is not always the best solution. `if let` and `if var` create one additional constant or variable which costs performance. `ifSome` does not create them so most of the time it is (slightly) faster then `if let` and `if var`. (see Benchmarks below)

Another solution is:

    if text != nil {
        print(text!) // forced unwrapping needed
    }

But this needs forced unwrapping, which generally should be avoided if possible.  
    
Another way to check for `nil` is optional chaining:

    let text: String? = "Some text"
    text?.removeAll()
    
But this only allows calling functionality _on_ the object, it is not possible to _use_ the object like with `if let` or `ifSome`.    
    
### Comparison with map    
    
ifSome is similar but different to `map` on the Swift `Optional` enum:

- `map` returns a result. `ifSome` does not return anything, it just calls the closure if the Optional is not `nil`.
- `map` is currently declared as `@warn_unused_result`. If the result of `map` is not used the warning `"Result of call to map is unused"` is issued by the compiler so `map` cannot be used as a clean replacement of `ifSome`.

## ifNone

Additionally, just for the sake of completness also an `ifNone` method is included.

    let someText: String? = nil
    someText.ifNone { print("someText is really nil") }
    
The trailing `ifNone` closure is only called if the value is `nil`.

## Benchmarks

`ifSome` is benchmarked against `if let` and `if var`. Most of the time it is slightly faster then both. (see Benchmark.swift)

Test-Run 1:
**Duration ifSome: 0.121964991092682** 
Duration if let: 0.131994009017944 
Duration if var: 0.140098989009857 

Test-Run 2:
**Duration ifSome: 0.119361042976379**
Duration if let: 0.129860997200012 
Duration if var: 0.119897961616516 

Test-Run 3:
**Duration ifSome: 0.120971977710724**
Duration if let: 0.127260982990265
Duration if var: 0.124355018138885

Test-Run 4:
Duration ifSome: 0.125229001045227
Duration if let: 0.125775992870331
**Duration if var: 0.122102022171021**

Test-Run 5:
**Duration ifSome: 0.117992997169495**
Duration if let: 0.121351957321167
Duration if var: 0.124639987945557

## Installation

`ifSome` is an extension of the Swift `Optional` enum. Just add the file "Optional+ifSome.swift" to your project.

