public class LabChallenge {
  public static void main(String args[]) {
    
    String[][] chessboard = new String[8][8];
    
    //add code below this line

    for (int row = 0; row < chessboard.length; row++) {
      for (int col = 0; col < chessboard[0].length; col++) {
        if ((row + col)%2 == 0) {
          chessboard[row][col] = "O";
        }
        else {
          chessboard[row][col] = "X";
        }
      }
    }

    //add code above this line
    
    for (int row = 0; row < chessboard.length; row++) {
      for (int col = 0; col < chessboard[0].length; col++) {
        if (col == chessboard[0].length - 1) {
          System.out.println(chessboard[row][col]);
        }
        else {
          System.out.print(chessboard[row][col]);
        }
      }
    }
  }
}
