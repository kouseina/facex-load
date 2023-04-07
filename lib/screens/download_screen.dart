import 'package:facex_load/routes/routes_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DownloadedScreen extends StatelessWidget {
  const DownloadedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('download'),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go(RoutesPath.home);
              },
              child: Text('go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
