import 'package:facex_load/routes/routes_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('Home'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go(RoutesPath.download);
              },
              child: const Text('Go to Download'),
            ),
          ],
        ),
      ),
    );
  }
}
