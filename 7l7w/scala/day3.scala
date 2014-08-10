import scala.io._ 
import scala.actors._ 
import Actor._

val aHrefRegex = "(?i)<a([^>]+)>(.+?)</a>".r
object PageLoader {
  def getPageContent(url: String) = Source.fromURL(url, "ISO-8859-1").mkString

  def getPageSize(url: String) = getPageContent(url).length
  
  def getLinkCount(url: String) = aHrefRegex.findAllIn(getPageContent(url)).size

  def getPageSizeAndLinks(url: String) = {
    val page = getPageContent(url)
    val linksCount = aHrefRegex.findAllIn(page).size
    (page.length, linksCount)
  }
}

val urls = List(
  "http://www.amazon.com/",
  "http://www.twitter.com/",
  "http://www.google.com/",
  "http://www.cnn.com/" 
)

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start)/1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = { 
  for(url <- urls) {
    val sizeAndLinks = PageLoader.getPageSizeAndLinks(url)
    println("Size for " + url + ": " + sizeAndLinks._1) 
    println("Links in " + url + ": " + sizeAndLinks._2) 
  }
}

def getPageSizeConcurrently() = {
  val caller = self

  for(url <- urls) {
    actor { caller ! (url, PageLoader.getPageSizeAndLinks(url)) }
  }
  for(i <- 1 to urls.size) { 
    receive {
      case (url, sizeAndLinks: (Int, Int)) =>
        println("Size for " + url + ": " + sizeAndLinks._1) 
        println("Links in " + url + ": " + sizeAndLinks._2) 
    }
  }
}
println("Sequential run:")
timeMethod { getPageSizeSequentially }
println("Concurrent run")
timeMethod { getPageSizeConcurrently }
