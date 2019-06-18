import 'package:flutter/material.dart';

import '../styles.dart';

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 200),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.LIGHT_MAIN,
          boxShadow: [
            BoxShadow(color: AppColors.PURPLE_MAIN, spreadRadius: 2, blurRadius: 8),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Login"),
            TextField()
          ],
        ),
      ),
    );
  }
}
