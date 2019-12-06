import 'package:flutter/material.dart';
import '../routers/appliction.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Text('点我'),
          onTap: () {
            Application.router.navigateTo(context, '/detail?id=jksdlfj');
          },
        ),
      ),
    );
  }
}
