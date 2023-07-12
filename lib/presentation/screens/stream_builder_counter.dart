import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/defult_text.dart';

class StreamBuilderCounter extends StatefulWidget {
  const StreamBuilderCounter({Key? key}) : super(key: key);

  @override
  State<StreamBuilderCounter> createState() => _StreamBuilderCounterState();
}

class _StreamBuilderCounterState extends State<StreamBuilderCounter> {
  int counter = 0;
  late StreamController streamController;
  late Stream stream;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    streamController = StreamController();
    stream = streamController.stream;
    super.initState();
  }

  void _incrementCounter() {
    streamController.sink.add(counter++);
  }

  void _decrementCounter() {
    streamController.sink.add(counter--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  backgroundColor: Colors.cyan,
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                StreamBuilder(
                    stream: stream,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: DefaultText(
                          text: snapshot.data == null
                              ? '0'
                              : snapshot.data.toString(),
                          weight: FontWeight.bold,
                          textSize: 25.sp,
                        ),
                      );
                    }),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  backgroundColor: Colors.cyan,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
