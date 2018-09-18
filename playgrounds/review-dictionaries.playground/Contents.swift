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
 ### DICTIONARIES

 Create a dictionary with the following keys: name, profession, country, state, and city. For the values, put your own name, profession, country, state, and city.
 */

// TODO: Write solution here
var myInfo = ["name": "Neota", "profession": "Software Engineer", "country": "USA", "state": "Minnesota", "city": "Minneapolis"]
print(myInfo)
/*:
 You suddenly decide to move to Albuquerque. Update your city to Albuquerque, your state to New Mexico, and your country to USA.
 */

// TODO: Write solution here
myInfo["city"] = "Albuquerque"
myInfo["state"] = "New Mexico"
print(myInfo)
/*:
 Given a dictionary in the above format, write a function that prints a given person's city and state.
 */

// TODO: Write solution here
func printCityandState(myInfoDictionary: [String : String]){
  guard let city = myInfoDictionary["city"],
    let state = myInfoDictionary["state"] else {
    print("error, no values for city and/or state")
    return
  }
  print("\(city), \(state)")
}

printCityandState(myInfoDictionary: myInfo)


