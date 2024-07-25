import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:chess/chess.dart' as chess;

class Friend extends StatefulWidget {
  const Friend({super.key});
  @override
  State<Friend> createState() => _FriendPageState();
}

class _FriendPageState extends State<Friend> {
  ChessBoardController controller = ChessBoardController();
  chess.Chess game = chess.Chess();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chessmasters'),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: ChessBoard(
                  controller: controller,
                  boardColor: BoardColor.brown,
                  boardOrientation: PlayerColor.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Chess>(
              valueListenable: controller,
              builder: (context, game, _) {
                return Text(
                  controller.getSan().fold(
                        '',
                        (previousValue, element) =>
                            '$previousValue\n${element ?? ''}',
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
