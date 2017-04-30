---
layout: post
title:  "A constant Swift interview question -> Struct vs Class"
date:   2017-04-30 11:21:01 
categories: Swift
---

This is a question you must prepare, and I almost screw it up every time. So today, I decide to write a blog about it and to figure it out


## what's in common 
* Define properties to store values
* Define methods to provide functionality
* Define Subscripts to provide access to their values using subscript syntax
* Define initializers to set up their initial state 
* Be extended to expand their functionality beyond a default implementation 
* Conform to protocols to provide standard functionality of a certain kind

## What's different
Classes have more capabilities that Struct do not 
* Inheritance enables one class to inherit the characteristics of another
* Type casting enables you to check and interpret the type of a class instance at runtime
* Deinitializers enable an instance of a class to free up any resources it has assigned
* Reference counting allows more than one reference to a class instance  

Above list is from [Apple Developer Doc](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html) 
That's very useful information, it give us the basic idea of structure vs class. But why structure in Swift is a **big deal**?

##Why Struct in Swift is a big deal
StackOverflow can be our best friend. This [link](http://stackoverflow.com/questions/24232799/why-choose-struct-over-class/24232845) has a good explanation:
When passing instances of a Struct, you are passing a **copy** of the instance, while passing instances of a Class, you are passing a **reference** of the instance.
What does that mean and how does this help me when I'm programming?

Let's take a look an example 


```swift
class CatClass {
    var name: String
    var color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}

struct CatStruct {
    var name: String
    var color: String
}

var oreo = CatClass(name: "Oreo", color: "BlackWhite")
var coco = CatStruct(name: "Coco", color: "BlackWhiteRed")

print("\(coco.name)'s color is \(coco.color)")
print("\(oreo.name)'s color is \(oreo.color)")

var anotherOreo = oreo
var anotherCoco = coco
anotherCoco.color = "Red"
anotherOreo.color = "Black"

print("\(coco.name)'s color is \(coco.color)")
print("\(oreo.name)'s color is \(oreo.color)")

```
Print is 

```
Coco's color is BlackWhiteRed
Oreo's color is BlackWhite
Coco's color is BlackWhiteRed
Oreo's color is Black
```

Looks like anotherCoco's color change can't change original Coco's color 
But Oreo's color changed by the change of anotherOreo's color 
As [this Swift Blog](https://developer.apple.com/swift/blog/?id=10) describes, 
`struct` in Swift is value type, so anotherCoco is an independent **new** cat 
`class` in Swift is reference type, anotherOreo shares a single copy of data with 
original Oreo, so anotherOreo is basically the **same** cat with Oreo 

Now the question is really become when to use value types and when to use reference types

Use a value type when:
* Comparing instance data with `==` makes sense 
* You want copies to have independent state
* The data will be used in code across multiple threads

Use a reference type when:
* Comparing instance identity with `===` makes sense
* You want to create shared, mutable state

In addition to `struct`, `Array`, `String`, `Dictionary` are all value types

## What else?
The ability to extend a `struct` makes Swift a Protocol Oriented Programming ready language. This is an interesting topic to talk about in the next blogs 


 



