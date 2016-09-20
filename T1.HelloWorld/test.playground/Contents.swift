//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var x:Int = 1

x = 2

var y = 1
y = 0

if x==1{
    print("x==1")
} else {
    print("x!=1")
}

var t:Int? = nil
t = 1

let numString = "22"
var n = Int(numString)

let badString = "bad"
var z:Int? = Int(badString)

n!+1

if n != nil {
    print(n! + 1)
}

var j:Int
var k:Double
for i in 1...100{
    j = i
    k = sin(Double(i))
}


func hello(personName: String) -> String {
    let greeting = "Hello, " + personName
    return greeting
}

hello("xiang")


