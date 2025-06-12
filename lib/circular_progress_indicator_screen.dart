import 'package:flutter/material.dart';

class CircularProgressIndicatorPresentation extends StatefulWidget {
  const CircularProgressIndicatorPresentation({super.key});

  @override
  State<CircularProgressIndicatorPresentation> createState() =>
      _CircularProgressIndicatorPresentationState();
}

class _CircularProgressIndicatorPresentationState
    extends State<CircularProgressIndicatorPresentation> {
  double _progress = 0.0;
  final double progress2 = 0.5;

  @override
  void initState() {
    super.initState();
    _simulateProgress();
  }

  void _simulateProgress() async {
    while (_progress < 1.0) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _progress += 0.05;
      });
    }
  }

  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data Loaded!';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic CircularProgressIndicator')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Basic CircularProgressIndicator'),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Determinate CircularProgressIndicator'),
                  CircularProgressIndicator(
                    value: 0.7,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Custom Color CircularProgressIndicator'),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      value: 0.7,
                      color: Colors.orange,
                      backgroundColor: Colors.grey[300],
                      strokeWidth: 8,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Indeterminate CircularProgressIndicator'),
                  Center(
                    child: CircularProgressIndicator(value: _progress),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CircularProgressIndicator with Text'),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: progress2,
                              strokeWidth: 8,
                              color: Colors.green,
                            ),
                            Text('${(progress2 * 100).round()}%'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      'FutureBuilder with CircularProgressIndicator',
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  FutureBuilder<String>(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      } else {
                        return Text(snapshot.data!);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
