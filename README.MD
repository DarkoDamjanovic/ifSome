# ifSome

`ifSome` is an attempt to create an alternative functional shorthand syntax of optional binding (`if let`) in Swift. Use it like this:

    let text: String? = "txet emoS"  
    
    text.ifSome{ print($0) } 
     
    text.ifSome {
        let reversed = String($0.characters.reverse())
        print(reversed) // "Some text"
    }

If the String is not `nil` the closure will be called and the Optional will be automatically unwrapped inside the closure. `ifSome` is not intended as an replacement for `if let` but an alternative in some cases.

Alternatively also this syntax is possible: 

    let optional: Int? = 5
    optional.ifSome{ unwrapped in print(unwrapped) }

Most of the time `if let` (or `guard`) is used in Swift to check for `nil`, which is not always the best solution. 

Another solution is:

    if text != nil {
        print(text!) // forced unwrapping needed
    }

But this needs forced unwrapping, which generally should be avoided if possible. Better would be:

    text.ifSome{ print($0) }
    
Another way to check for `nil` is optional chaining:

    let text: String? = "Some text"
    text?.removeAll()
    
But optional chaining only allows calling functionality _on_ the object, it is not possible to _use_ the object like with `if let` or `ifSome`.    
    
### Comparison with map    
    
ifSome is similar but different to `map` on the Swift `Optional` enum:

- `map` returns a result. `ifSome` does not return anything, it just calls the closure if the Optional is not `nil`.
- `map` is currently declared as `@warn_unused_result`. If the result of `map` is not used the warning `"Result of call to map is unused"` is issued by the compiler so `map` cannot be used as a clean replacement of `ifSome`.
- `map` is not intended as a `nil` check. As the name suggests it should be used for mapping one type to another type.

## ifNone

Just for the sake of completness also an `ifNone` method is included.

    let someText: String? = nil
    someText.ifNone { print("someText is really nil") }
    
The trailing `ifNone` closure is only called if the value is `nil`.

## Disadvantages of ifSome

- only possible to use on one Optional, `if let` allows unwrapping multiple at a time
- access to the unwrapped Optional over `$0` syntax
- not possible to unwrap the Optional as mutable var (at least I didn't found out how to do it)

## Installation

`ifSome` is an extension of the Swift `Optional` enum. Just add the file "Optional+ifSome.swift" to your project.




















