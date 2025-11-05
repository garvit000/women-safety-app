import 'package:flutter/material.dart';

class SafetyToolsScreen extends StatelessWidget {
  const SafetyToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Safety Tools',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildToolCard(
            context,
            icon: Icons.flashlight_on,
            title: 'Flashlight',
            description: 'Quick access to flashlight',
            color: Colors.yellow[700]!,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Flashlight toggled')),
              );
            },
          ),
          _buildToolCard(
            context,
            icon: Icons.volume_up,
            title: 'Loud Alarm',
            description: 'Sound a loud siren alarm',
            color: Colors.red,
            onTap: () {
              _showAlarmDialog(context);
            },
          ),
          _buildToolCard(
            context,
            icon: Icons.videocam,
            title: 'Video Recording',
            description: 'Start recording video evidence',
            color: Colors.purple,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Video recording started')),
              );
            },
          ),
          _buildToolCard(
            context,
            icon: Icons.mic,
            title: 'Audio Recording',
            description: 'Record audio as evidence',
            color: Colors.blue,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Audio recording started')),
              );
            },
          ),
          _buildToolCard(
            context,
            icon: Icons.phone,
            title: 'Quick Dial',
            description: 'Call emergency services',
            color: Colors.green,
            onTap: () {
              _showQuickDialDialog(context);
            },
          ),
          _buildToolCard(
            context,
            icon: Icons.shield,
            title: 'Fake Call',
            description: 'Simulate an incoming call',
            color: Colors.teal,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fake call initiated')),
              );
            },
          ),
          _buildToolCard(
            context,
            icon: Icons.share_location,
            title: 'Share Location',
            description: 'Share your real-time location',
            color: Colors.indigo,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Location shared with contacts')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildToolCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAlarmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Loud Alarm'),
        content: const Text('This will sound a loud siren. Continue?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Alarm sounding!'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Start Alarm'),
          ),
        ],
      ),
    );
  }

  void _showQuickDialDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Emergency Services'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.local_police, color: Colors.blue),
              title: const Text('Police'),
              subtitle: const Text('100'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.local_hospital, color: Colors.red),
              title: const Text('Ambulance'),
              subtitle: const Text('102'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.local_fire_department, color: Colors.orange),
              title: const Text('Fire'),
              subtitle: const Text('101'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.support_agent, color: Colors.purple),
              title: const Text('Women Helpline'),
              subtitle: const Text('1091'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
