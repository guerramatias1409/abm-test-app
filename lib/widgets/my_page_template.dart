import 'package:flutter/material.dart';
import 'package:test_app/widgets/widgets.dart';

class MyPageTemplate extends StatelessWidget {
  const MyPageTemplate({
    required this.pageBody,
    this.pageBottomBar,
    super.key,
  });

  final Widget pageBody;
  final Widget? pageBottomBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PageBackground(),
          SafeArea(child: pageBody),
        ],
      ),
      bottomNavigationBar: pageBottomBar != null
          ? SafeArea(
              child: pageBottomBar!,
            )
          : null,
    );
  }
}
