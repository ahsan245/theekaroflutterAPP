import 'package:flutter/material.dart';

class Problem {
  final String title;
  final String description;
  final double price;

  Problem(
      {required this.title, required this.description, required this.price});
}

class MenuPage extends StatelessWidget {
  final List<Problem> softwareProblems = [
    Problem(
      title: 'App Crashes',
      description: 'Apps unexpectedly shutting down',
      price: 10.0,
    ),
    Problem(
      title: 'Slow Performance',
      description: 'Apps or device running sluggishly',
      price: 15.0,
    ),
    Problem(
      title: 'Compatibility Issues',
      description: 'Apps not working with certain devices',
      price: 20.0,
    ),
    Problem(
      title: 'Data Loss',
      description: 'Loss of important data or files',
      price: 30.0,
    ),
    Problem(
      title: 'Virus or Malware',
      description: 'Presence of harmful software on the device',
      price: 25.0,
    ),
  ];

  final List<Problem> hardwareProblems = [
    Problem(
      title: 'Screen Damage',
      description: 'Cracked or broken device screen',
      price: 50.0,
    ),
    Problem(
      title: 'Battery Drain',
      description: 'Quick battery discharge or power issues',
      price: 35.0,
    ),
    Problem(
      title: 'Device Overheating',
      description: 'Device getting excessively hot during use',
      price: 30.0,
    ),
    Problem(
      title: 'Speaker or Microphone Issues',
      description: 'Audio problems during calls or media playback',
      price: 20.0,
    ),
    Problem(
      title: 'Button Failure',
      description: 'Non-functional or stuck buttons on the device',
      price: 25.0,
    ),
  ];

  final List<Problem> connectivityProblems = [
    Problem(
      title: 'Wi-Fi Connection Failure',
      description: 'Inability to connect to a Wi-Fi network',
      price: 10.0,
    ),
    Problem(
      title: 'Bluetooth Pairing Issues',
      description: 'Problems connecting devices via Bluetooth',
      price: 15.0,
    ),
    Problem(
      title: 'No Cellular Network',
      description: 'Lack of network signal on the device',
      price: 20.0,
    ),
    Problem(
      title: 'GPS Inaccuracy',
      description: 'Location services not functioning correctly',
      price: 15.0,
    ),
    Problem(
      title: 'Intermittent Network Drops',
      description: 'Network connections dropping frequently',
      price: 10.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problems Menu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCategory('Software Problems', softwareProblems),
            _buildCategory('Hardware Problems', hardwareProblems),
            _buildCategory('Connectivity Problems', connectivityProblems),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String categoryName, List<Problem> problems) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: problems.length,
            itemBuilder: (context, index) {
              final problem = problems[index];
              return ListTile(
                title: Text(problem.title),
                subtitle: Text(problem.description),
                trailing: Text('\$${problem.price.toStringAsFixed(2)}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
