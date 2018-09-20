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
 ## CLASSES VS STRUCTURES

 Imagine you're writing a movie-viewing application in Swift. Users can create lists of movies and share those lists with other users.
 
 Create a `User` and a `List` class that uses reference semantics to help maintain lists between users.
 
 - `User` - Has a method `addList(_:)` which adds the given list to a dictionary of `List` objects (using the `name` as a key), and `list(forName:) -> List?` which will return the `List` for the provided name.
 - `List` - Contains a name and an array of movie titles. A `print` method will print all the movies in the list.
 - Create `jane` and `john` users and have them create and share lists. Have both `jane` and `john` modify the same list and call `print` from both users. Are all the changes reflected?
*/

// TODO: Write solution here
class User {
  var lists : [String:List] = [:]
  
  func addList(_ list: List) {
    lists[list.name] = list
  }
  
  func list(forName name: String) -> List? {
    return lists[name]
  }
  
}

class List {
  let name: String
  var movies: [String] = []
  
  init(name: String) {
    self.name = name
  }
  
  func printMovies() {
    print("Movie List: \(name)")
    for movie in movies {
      print(movie)
    }
    
  }
}

// my approach to the challenge
var janesList = List(name: "Jane")
janesList.movies = ["Thor: Ragnarok", "Spiderman: Homecoming", "Avengers Age of Ultron", "Wonder Woman"]
janesList.printMovies()
print("===")
var johnsList = List(name: "John")
johnsList.movies = ["Jurassic Park", "Jurassic Park 2", "Jurassic Park 3", "The Land Before Time"]
johnsList.printMovies()
print("===")
var jane = User()
jane.addList(janesList)
jane.addList(johnsList)
var john = User()
john.addList(janesList)
john.addList(johnsList)

janesList.movies.append("Justice League")
janesList.printMovies()
print("===")
john.list(forName: "Jane")?.movies.append("LOTR")
janesList.printMovies()
print("===")

// shown solution from video instructor (but my choice of names)
let jangguk = User()
let junsu = User()
var marvelList = List(name: "Marvel")
jangguk.addList(marvelList)
junsu.addList(marvelList)

jangguk.lists["Marvel"]?.movies.append("Thor: Rangarok")
jangguk.lists["Marvel"]?.movies.append("Avengers Age of Ultron")
junsu.lists["Marvel"]?.movies.append("Spiderman")

jangguk.lists["Marvel"]?.printMovies()
junsu.lists["Marvel"]?.printMovies()
/*:
 
 What happens when you implement the same with structs and what problems do you run into?
 */

 // TODO: Modify code above

/*:

 Your challenge here is to imagine a set of objects to support a t-shirt store. Decide if each object should be a class or a struct, and why. You don't need to write any code; just decide whether to use a class or a struct for each.
 
 - `TShirt` - Represents a shirt style you can buy. Each `TShirt` has a size, color, price, and an optional image on the front.
 - `User` - A registered user of the t-shirt store app. A user has a name, email, and a `ShoppingCart` (below).
 - `Address` - Represents a shipping address, containing the name, street, city, and zip code.
 - `ShoppingCart` - Holds a current order, which is composed of an array of `TShirt` that the `User` wants to buy, as well as a method to calculate the total cost. Additionally, there is an `Address` that represents where the order will be shipped.

 */

/*
 Solution:

 - TShirt: A TShirt can be thought of as a value, because it doesn't represent a real shirt, only a description of a shirt. For instance, a TShirt would represent "a large green shirt order" and not "an actual large green shirt". For this reason, TShirt can be a struct instead of a class.
 - User: A User represents a real person. This means every user is unique so User is best implemented as a class.
 - Address: Addresses group multiple values together and two addresses can be considered equal if they hold the same values. This means Address works best as a value type (struct).
 - ShoppingCart: The ShoppingCart is a bit tricker. While it could be argued that it could be done as a value type, it's best to think of the real world semantics you are modeling. If you add an item to a shopping cart, would you expect to get a new shopping cart? Or put the new item in your existing cart? By using a class, the reference semantics help model real world behaviors. Using a class also makes it easier to share a single ShoppingCart object between multiple components of your application (shopping, ordering, invoicing, ...).
 */
