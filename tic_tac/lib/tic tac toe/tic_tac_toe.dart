// import 'package:flutter/material.dart';

// void main() {
//   runApp(TicTacToeApp());
// }

// class TicTacToeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'Montserrat',
//       ),
//       home: TicTacToeGame(),
//     );
//   }
// }

// class TicTacToeGame extends StatefulWidget {
//   @override
//   _TicTacToeGameState createState() => _TicTacToeGameState();
// }

// class _TicTacToeGameState extends State<TicTacToeGame> {
//   List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
//   bool isPlayerX = true;
//   bool showDrawMessage = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tic-Tac-Toe'),
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.blue, Colors.teal],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               for (int i = 0; i < 3; i++)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     for (int j = 0; j < 3; j++)
//                       GestureDetector(
//                         onTap: () {
//                           if (board[i][j] == '') {
//                             setState(() {
//                               board[i][j] = isPlayerX ? 'X' : 'O';
//                               isPlayerX = !isPlayerX;
//                             });
//                             if (checkForWinner(i, j)) {
//                               showWinnerDialog(isPlayerX ? 'O' : 'X');
//                             } else if (isBoardFull()) {
//                               showDrawMessage = true;
//                               Future.delayed(Duration(seconds: 3), () {
//                                 setState(() {
//                                   showDrawMessage = false;
//                                   resetGame();
//                                 });
//                               });
//                             }
//                           }
//                         },
//                         child: AnimatedContainer(
//                           duration: Duration(seconds: 1),
//                           curve: Curves.easeInOut,
//                           width: 80,
//                           height: 80,
//                           margin: EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.3),
//                                 spreadRadius: 2,
//                                 blurRadius: 5,
//                                 offset: Offset(0, 2),
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Text(
//                               board[i][j],
//                               style: TextStyle(
//                                   fontSize: 32,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.blue),
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   resetGame();
//                 },
//                 child: Text(
//                   'Restart Game',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.teal,
//                   onPrimary: Colors.white,
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 ),
//               ),
//               if (showDrawMessage) ...[
//                 SizedBox(height: 20),
//                 AnimatedOpacity(
//                   opacity: showDrawMessage ? 1.0 : 0.0,
//                   duration: Duration(seconds: 1),
//                   curve: Curves.easeInOut,
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.teal,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.3),
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Text(
//                       'It\'s a draw!',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   bool checkForWinner(int row, int col) {
//     // Check row
//     if (board[row][0] == board[row][1] && board[row][1] == board[row][2]) {
//       return true;
//     }
//     // Check column
//     if (board[0][col] == board[1][col] && board[1][col] == board[2][col]) {
//       return true;
//     }
//     // Check diagonals
//     if (row == col &&
//         board[0][0] == board[1][1] &&
//         board[1][1] == board[2][2]) {
//       return true;
//     }
//     if (row + col == 2 &&
//         board[0][2] == board[1][1] &&
//         board[1][1] == board[2][0]) {
//       return true;
//     }
//     return false;
//   }

//   bool isBoardFull() {
//     for (int i = 0; i < 3; i++) {
//       for (int j = 0; j < 3; j++) {
//         if (board[i][j] == '') {
//           return false; // If there's an empty cell, the board is not full
//         }
//       }
//     }
//     return true; // All cells are filled
//   }

//   void showWinnerDialog(String winner) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             'Game Over',
//             style: TextStyle(color: Colors.blue),
//           ),
//           content: Text('Player $winner wins!', style: TextStyle(fontSize: 20)),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 resetGame();
//               },
//               child: Text(
//                 'Restart',
//                 style: TextStyle(fontSize: 18),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.teal,
//                 onPrimary: Colors.white,
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void resetGame() {
//     setState(() {
//       board = List.generate(3, (_) => List.filled(3, ''));
//       isPlayerX = true;
//     });
//   }
// }
