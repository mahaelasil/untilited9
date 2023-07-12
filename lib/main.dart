import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled9/presentation/router/app_router.dart';
import 'business_login/colors_cubit/colors_cubit.dart';
import 'business_login/counter_cubit/counter_cubit.dart';
import 'business_login/provider/counter_provider.dart';
import 'business_login/provider/provider_counter.dart';
import 'core/my_bloc_observer.dart';
import 'data/data_source/local/my_cache.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.initCache();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => CounterProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => OnBoardingProvider(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CounterCubit(),
              ),
              BlocProvider(
                create: (context) => ColorsCubit(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter App',
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
              ),
              onGenerateRoute: appRouter.onGenerateRoute,
            ),
          ),
        );
      },
    );
  }
}