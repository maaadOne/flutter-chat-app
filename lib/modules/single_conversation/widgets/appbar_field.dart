import 'package:flutter/material.dart';

class AppBarField extends StatelessWidget {
  const AppBarField({super.key, required this.name, required this.status});

  final String name;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(
        left: 12,
        top: 20,
      ),
      // width: 375.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFEDF2F6),
            width: 1.0,
          ),
        ),
        // color: Colors.green,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/icons/arrow_left.png',
            ),
          ),
          Container(
            // width: 251,
            // color: Colors.amber,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              // horizontal: 17,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 34.0,
                  child: Text(
                    '${name.characters.first.toUpperCase()} ${name.characters.last.toUpperCase()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        status ? 'В сети' : 'Не в сети',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
