/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

/*:
 ### SWITCH STATEMENTS
 
 Write a switch statement that takes an age as an integer and prints out the life stage related to that age. You can make up the life stages, or use my categorization as follows: 0-2 years, Infant; 3-12 years, Child; 13-19 years, Teenager; 20-39, Adult;40-60, Middle aged; 61+, Elderly.
 */

// TODO: Write solution here
var age = 65
switch age {
case 0,1:
  print("Infant")
case 2..<4:
  print("Toddler")
case 4..<13:
  print("Child")
case 13..<20:
  print("Teenager")
case 20..<40:
  print("Adult")
case 40..<65:
  print("Middle Age")
case 65..<100:
  print("Retirement")
default:
  print("I don't know about that age!")
}



/*:
 Write a switch statement that takes a tuple containing a string and an integer.  The string is a name, and the integer is an age. Use the same cases that you used in the previous exercise and let syntax to print out the name followed by the life stage. For example, for the author of thee challenges, it would print out "Matt is an adult.".
 */

// TODO: Write solution here
let myTuple: (name: String, age: Int) = ("Neota", 41)
switch myTuple.age {
case 0,1:
  print(myTuple.name + " is an infant.")
case 2..<4:
  print(myTuple.name + " is a toddler.")
case 4..<13:
  print(myTuple.name + " is a child.")
case 13..<20:
  print(myTuple.name + " is a teenager.")
case 20..<40:
  print(myTuple.name + " is an adult.")
case 40..<65:
  print(myTuple.name + " is a middle aged adult.")
case 65..<100:
  print(myTuple.name + " is a retirement aged adult.")
default:
  print("I don't know about the age of " + myTuple.name + ".")
}
