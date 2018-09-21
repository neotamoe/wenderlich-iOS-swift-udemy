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

/*:
 ## INITIALIZERS

 Create a class named `Animal` that has a single stored property named `name`, that is a `String`. It should have a required initializer that takes `name` as a parameter, and a function `speak()` that does nothing.
*/

// TODO: Write solution here
class Animal {
  var name: String
  
  required init(name: String) {
    self.name = name
  }
  
  func speak() {
    
  }
}

/*:
 Create a class named `Dog` that inherits from `Animal`. It should have a single stored property named `numTricksLearned`, that is an `Int`. It should implement the required initializer, defaulting `numTricksLearned` to `0`, and it should call `speak()` at the end of the initializer. Finally, it should override the function `speak()` to say `Bow Wow`.
*/

// TODO: Write solution here
class Dog: Animal {
  var numTricksLearned: Int
  
  required init(name: String) {
    numTricksLearned = 0
    super.init(name: name)
    speak()
  }
  
  override func speak() {
    print("Bow Wow")
  }
  
  init(name: String, numTricksLearned: Int) {
    self.numTricksLearned = numTricksLearned
    super.init(name: name)
    speak()
  }
  
}
/*:
 Add a second (non-required) initializer to `Dog` that takes both the `name` and `numTricksLearned` as parameters.
*/

// TODO: Modify solution above
var dog = Dog(name: "Christopher Nuisance")
/*:
 In an extension, add a convenience initializer to `Dog` that defaults the dog's name to your favorite dog's name, with however many tricks the dog has learned.
*/

// TODO: Write solution here
extension Dog {
  convenience init() {
    self.init(name: "Tugger", numTricksLearned: 1)
  }
}

let dog2 = Dog()



