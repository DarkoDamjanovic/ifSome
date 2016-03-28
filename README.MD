# ifSome

ifSome is an attempt to create a functional shorthand syntax of optional binding (`if let`) in Swift. Use it like this:

    let text: String? = "Some text"
    text.ifSome { print($0) }

If the String is `nil` the closure will not be called.

Most of the time `guard` or `if let` is used in Swift to check for `nil`, which can be an overhead sometimes. Consider this simple add method which add's to optional Int's and returns nil if one of them is nil:

    func add(a: Int?, b: Int?) -> Int?

Usually used like this:

    if let result = add(nil, b: 5) {
	    print(result)
    }

With ifSome:

    add(nil, b: 5).ifSome { print($0) }

ifSome is similar but different to `map` on the Swift `Optional` enum:

- map returns a result. ifSome does not return anything, it just calls the closure if the Optional is not `nil`.
- map is currently declared as `@warn_unused_result`. If the result of map is not used the warning `"Result of call to map is unused"` is issued by the compiler so map cannot be used as a clean replacement of ifSome.

## Installation

ifSome is an extension of the Swift `Optional` enum. Just add the file "Optional+ifSome.swift" to your project.

