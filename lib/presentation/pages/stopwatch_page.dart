import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>
    with TickerProviderStateMixin {
  final Stopwatch _stopwatch = Stopwatch();
  late Duration _elapsedTime;
  late String _elapsedTimeString;
  late Timer timer;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..repeat();
  late final Animation<double> _scaleAnimation =
      Tween<double>(begin: 0.6, end: 1.2).animate(_controller);
  late final Animation<double> _fadeAnimation =
      Tween<double>(begin: 1, end: 0.2).animate(_controller);

  @override
  void initState() {
    super.initState();

    _elapsedTime = Duration.zero;
    _elapsedTimeString = _formatElapsedTime(_elapsedTime);

    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        if (_stopwatch.isRunning) {
          _updateElapsedTime();
        }
      });
    });
  }

  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _updateElapsedTime();
    } else {
      _stopwatch.stop();
      _stopwatch.reset();
      _updateElapsedTime();
    }
  }

  void _updateElapsedTime() {
    setState(() {
      _elapsedTime = _stopwatch.elapsed;
      _elapsedTimeString = _formatElapsedTime(_elapsedTime);
    });
  }

  String _formatElapsedTime(Duration time) {
    return '${time.inHours.toString().padLeft(2, '0')}:${time.inMinutes.remainder(60).toString().padLeft(2, '0')}:${time.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              if (_stopwatch.isRunning)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: const BoxDecoration(color: Colors.white),
                    ),
                  ),
                ),
              Text(
                _elapsedTimeString,
                style: const TextStyle(color: Colors.black, fontSize: 40.0),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              _stopwatch.isRunning
                  ? Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.amber.shade300),
                    )
                  : FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber.shade300),
                        ),
                      ),
                    ),
              GestureDetector(
                onTap: _startStopwatch,
                child: Icon(
                  _stopwatch.isRunning ? Icons.pause : Icons.play_arrow,
                ),
              )
            ],
          )
        ],
      ))),
    );
  }
}
