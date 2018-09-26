import Foundation

let mysteryDataURL = URL(
  fileURLWithPath: "mystery",
  relativeTo: FileManager.documentDirectoryURL
)
//: ## String
let stringURL =
  FileManager.documentDirectoryURL
  .appendingPathComponent("string")
  .appendingPathExtension("txt")
//: ## Challenge
let challengeString: String = "diablo"
let challengeStringURL: URL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")
challengeStringURL.path
challengeStringURL.lastPathComponent
