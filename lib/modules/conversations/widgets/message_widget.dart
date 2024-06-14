import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 34,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              child: const Text(
                "ВВ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: SizedBox(
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Виктор Власов',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Вы: Уже сделал?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Text(
            "Вчера",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
