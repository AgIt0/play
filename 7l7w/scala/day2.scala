// Use foldLeft to compute the total size of a list of strings.
val list =  List("some", "strings")

val charLength = list.foldLeft(0)((sum, string) => sum + string.length)
println("Length: " + charLength)


// Write a Censor trait with a method that will replace the curse words Shoot and Darn with 
// Pucky and Beans alternatives. Use a map to store the curse words and their alternatives.
trait Censor {
  var curseWords = Map("Shoot" -> "Pucky", "Darn" -> "Beans")

  def newCurseWords(newCurseWords: Map[String, String]) = {
    curseWords = newCurseWords
  }

  def purifyText(text: String): String = {
    curseWords.foldLeft(text)((str, filter) => str.replaceAll(filter._1, filter._2))
  }
}

class Purifier extends Censor
var purifier = new Purifier()

println(purifier.purifyText("Shoot me, Darn it!"))


// Load the curse words and alternatives from a file.
var fileLines = scala.io.Source.fromFile("words.txt").getLines()
var cursesFromFile = Map[String, String]()

fileLines.foreach { line =>
  val cursedWordPair = line.split(" ")
  cursesFromFile += cursedWordPair(0) -> cursedWordPair(1)
}

purifier.newCurseWords(cursesFromFile)
println(purifier.purifyText("Shoot me, Darn it!"))
