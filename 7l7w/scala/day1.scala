class Cell(cellVal:String) {
  var value = cellVal;

  def ==(another: Cell):Boolean = {
    return(this.value == another.value);
  }

  def validVal(value: String):Boolean = {
    return value == "X" || value == "O";
  }

  def setVal(newVal: String):Unit = {
    if(newVal != " " && this.validVal(newVal)) {
      this.value = newVal;
    }
  }
}

class Board(boardList:List[String]) {
  val board = boardList.map(cellVal => new Cell(cellVal));

  val winningLists = List(
    List(0, 1, 2),
    List(3, 4, 5),
    List(6, 7, 8),
    List(0, 3, 6),
    List(1, 4, 7),
    List(2, 5, 8),
    List(0, 4, 8),
    List(2, 4, 6)
  );

  def winner: String = {
    if(this.hasWinner) {
      this.winningLists.foreach( list  =>
        if(this.isWinningList(list)) {
          return(this.board(list(0)).value);
        }
      )
    }
    return " ";
  }

  def hasWinner: Boolean = {
    this.winningLists.foreach( list =>
      if(this.isWinningList(list)) {
        return(true);
      }
    );
    return(false);
  }

  def isWinningList(list: List[Int]):Boolean = {
    val firstCell = this.board(list(0));
    val secondCell = this.board(list(1));
    val thirdCell = this.board(list(2));

    return((firstCell == secondCell) &&
           (firstCell == thirdCell))
  }
}

var board = new Board(List("X", "X", "O",
                           "X", "O", "O",
                           "O", "O", "X"));
println(board.winner);
