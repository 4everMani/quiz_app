import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final String error;
  const ErrorDisplay(this.error);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.all(20),
          height: 90,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Oh snap!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                error,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
    );
  }
}
