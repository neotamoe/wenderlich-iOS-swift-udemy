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

//: ### PROPERTIES
//: Create a struct named `Temperature` that contains a stored property `degreesF` that is a `Double`, which will store the degrees in Fahrenheit. Then add a computed property called `degreesC` that is a `Double`, that calculates the degrees in Celsius. Hint: `degreesC` should be equal to `(degreesF - 32) / 1.8`.

// TODO: Write solution here
struct Temperature {
  var degreesF: Double {
    didSet {
      if degreesF > 100 {
        print("Too hot!")
      }
    }
  }
  var degreesC: Double {
    get {
      return (degreesF - 32) / 1.8
    }
    set {
      return degreesF = (newValue * 1.8) + 32
    }
  }
}

var temp = Temperature(degreesF: 32)
temp.degreesC
temp.degreesC = 10
temp.degreesF
temp.degreesF = 50
temp.degreesF = 101


//: Modify the `degreesC` computed property to add a setter, so that by setting the degrees in Celsius, it actually updates the degrees in Fahrenheit.

// TODO: Modify code above

//: Modify the `degreesF` stored property to print out "Too hot!" if it is set to above 100 degrees Fahrenheit.

// TODO: Modify code above

