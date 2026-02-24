import 'package:flutter/material.dart';
import 'colorService.dart';

ColorService colorService = ColorService(); //global instance

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

enum CardType {
  red(Colors.red),
  blue(Colors.blue),
  green(Colors.green),
  yellow(Colors.yellow);

  final Color color;

  const CardType(this.color);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Taps')),
      body: ListenableBuilder(
        listenable: colorService,
        builder: (context, child) {
          return ListView.builder(
            itemCount: CardType.values.length,
            itemBuilder: (context, index) {
              final type = CardType.values[index];
              return ColorTap(type: type);
            },
          );
        },
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;

  const ColorTap({super.key, required this.type});

  Color get backgroundColor => type.color;
  int get tapCount => colorService.tapCounts[type]!;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => colorService.incrementTap(type),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: ListenableBuilder(
        listenable: colorService,
        builder: (context, child) {
          return Center(
            child: ListView.builder(
              itemCount: CardType.values.length,
              itemBuilder: (context, index) {
                final type = CardType.values[index];
                return Text(
                  '${type.name}Tap: ${colorService.tapCounts[type]}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
