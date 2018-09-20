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
//: ### STRUCTURES
//: Write a struct that represents a pizza order. Include toppings, size and any other option you’d want for a pizza.

// TODO: Write solution here
struct PizzaOrder {
  let size: Int
  let crustType: String
  let toppings: [String]
}

let pizza = PizzaOrder(size: 18, crustType: "thin", toppings: ["pepperoni", "green olives", "sausage", "mushrooms"])

//: Change `distance(from:to:)` to use `Location`s as parameters instead of x-y tuples.
struct Location {
  let x: Int
  let y: Int
}

// TODO: Modify this
func distance(from source: Location, to target: Location) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return sqrt(distanceX * distanceX + distanceY * distanceY)
}

//: Change `contains(_:)` to call the new `distance(from:to:)` with `Location`s.

struct DeliveryArea {
  let center: Location
  var radius: Double

  func contains(_ location: Location) -> Bool {
    // TODO: Modify this
    let distanceFromCenter =
      distance(from: center,
               to: location)

    return distanceFromCenter < radius
  }

  func overlaps(with otherDeliveryArea: DeliveryArea) -> Bool {
    return distance(from: center, to: otherDeliveryArea.center) <= (radius + otherDeliveryArea.radius)
  }
  
}

//: Add a method `overlaps(with:)` on `DeliveryArea` that can tell you if the area overlaps with another area.

let area1 = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)
let area2 = DeliveryArea(center: Location(x: 5, y: 9), radius: 2.5)
// TODO: Test if areas 1 and 2 overlap (should be false)
area1.overlaps(with: area2)

let area3 = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)
let area4 = DeliveryArea(center: Location(x: 3, y: 5), radius: 2.5)
// TODO: Test if areas 3 and 4 overlap (should be true)
area3.overlaps(with: area4)
