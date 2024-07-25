import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:racunalni_sah/home_page.dart';
import 'package:racunalni_sah/deflect.dart';
import 'package:racunalni_sah/legal.dart';
import 'package:racunalni_sah/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class Smother extends StatefulWidget {
  const Smother({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Tactics createState() => _Tactics();
}

class _Tactics extends State<Smother> {
  ChessBoardController controller = ChessBoardController();
  List<String> correctMoves = ['Qxf2+', 'Qg1+', 'Nf2#'];
  int moveIndex = 0;

  @override
  void initState() {
    super.initState();
    controller.game
        .load('r1b2rk1/pppp1ppp/8/2b1P3/2B3nq/5N2/PP3PPP/RNBQR1K1 b - - 0 11');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chessmasters'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const RootPage();
                },
              ),
            );
          },
        ),
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
                  boardOrientation: PlayerColor.black,
                  onMove: () {
                    String pgn = controller.game.pgn();
                    if (pgn.isNotEmpty) {
                      List<String> moves = pgn.split(' ');
                      String lastMove = moves.last;
                      if (lastMove != correctMoves[moveIndex]) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              duration: const Duration(days: 1),
                              content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Text('Pogrešno'),
                                    SnackBarAction(
                                      label: 'Pokušajte ponovno',
                                      onPressed: () {
                                        setState(() {
                                          if (moveIndex == 0) {
                                            controller.game.load(
                                                'r1b2rk1/pppp1ppp/8/2b1P3/2B3nq/5N2/PP3PPP/RNBQR1K1 b - - 0 11');
                                          } else if (moveIndex == 1) {
                                            controller.game.load(
                                                'r1b2rk1/pppp1ppp/8/2b1P3/2B3n1/5N2/PP3qPP/RNBQR2K b - - 0 11');
                                          } else if (moveIndex == 2) {
                                            controller.game.load(
                                                'r1b2rk1/pppp1ppp/8/2b1P3/2B3n1/5N2/PP4PP/RNBQ2RK b - - 0 11');
                                          }
                                        });
                                      },
                                    ),
                                  ])),
                        );
                      } else {
                        String message = moveIndex == correctMoves.length - 1
                            ? 'Bravo!'
                            : 'Točno....nastavite';
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            duration: const Duration(days: 1),
                          ),
                        );
                        moveIndex++;
                        if (moveIndex == 1) {
                          controller.game.move(('Kh1'));
                        } else if (moveIndex == 2) {
                          controller.game.move(('Rxg1'));
                        }
                      }
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Chess>(
              valueListenable: controller,
              builder: (BuildContext context, Chess game, Widget? child) {
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Legal();
                  }));
                },
                child: const Icon(Icons.keyboard_double_arrow_left),
              ),
            ),
            const SizedBox(width: 200),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Deflect();
                  }));
                },
                child: const Icon(Icons.keyboard_double_arrow_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
