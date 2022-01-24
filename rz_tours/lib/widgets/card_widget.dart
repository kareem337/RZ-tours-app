import 'package:flutter/material.dart';

class Card_widgets extends StatelessWidget {
  const Card_widgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  Card_widget() {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('View Peoduct'),
          ),
        ),
      ),
    );
  }
}
