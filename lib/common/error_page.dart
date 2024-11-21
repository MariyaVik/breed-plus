import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation/route_name.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.error,
  });
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                context.goNamed(RouteName.home);
              },
              child: const Text('На главную'),
            ),
          ],
        ),
      ),
    );
  }
}
