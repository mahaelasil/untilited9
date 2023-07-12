import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../business_login/provider/counter_provider.dart';
import '../widgets/defult_text.dart';

class ProviderCounter extends StatefulWidget {
  const ProviderCounter({Key? key}) : super(key: key);

  @override
  State<ProviderCounter> createState() => _ProviderCounterState();
}

class _ProviderCounterState extends State<ProviderCounter> {

  late CounterProvider providerForData;
  late CounterProvider providerForMethods;

  @override
  void didChangeDependencies() {
    providerForMethods = Provider.of<CounterProvider>(context, listen: false);
    providerForData = Provider.of<CounterProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: context.read<CounterProvider>().decrementCounter,
                  backgroundColor: Colors.cyan,
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: DefaultText(
                    text: '${providerForMethods.counter}',
                    weight: FontWeight.bold,
                    textSize: 25.sp,
                  ),
                ),
                FloatingActionButton(
                  onPressed: providerForData.incrementCounter,
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