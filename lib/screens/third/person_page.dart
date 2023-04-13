import 'package:flutter/material.dart';
import 'package:zk_weather/generated/l10n.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.current.person),
    );
  }
}
