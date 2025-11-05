import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        title: Text('Contact Name'),
        subtitle: Text('Contact Phone Number'),
      ),
    );
  }
}
