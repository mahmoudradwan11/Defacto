import 'package:defacto/core/controllers/payment/payment_cubit.dart';
import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/core/network/local/cache.dart';
import 'package:defacto/core/network/remote/payment_helper.dart';
import 'package:defacto/core/network/remote/store_helper.dart';
import 'package:defacto/core/themes/light.dart';
import 'package:defacto/modules/screens/onboarding.dart';
import 'package:defacto/modules/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/controllers/observer.dart';
import 'core/network/remote/constants.dart';
import 'modules/screens/home.dart';
import 'modules/screens/login.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelperStore.init();
  await CacheHelper.init();
  var onboarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  sumPrice = CacheHelper.getData(key: 'Sum');
  sumPrice ??= 0;
  print('SumPrice =$sumPrice');
  print(token);
  print(onboarding);
  DioHelperPayment.initDio();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  Bloc.observer = MyBlocObserver();
  Widget startWidget;
  if (onboarding != null) {
    if (token != null) {
      startWidget = const Home();
    } else {
      startWidget = Login();
    }
  } else {
    startWidget = const OnBoarding();
  }
  runApp(MyApp(
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({super.key, this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DefactoCubit()
            ..getHomeData()
            ..getNotification()
            ..getUserData()
            ..getCategory()
            ..createDatabase()
            ..getOrders()
          ,
        ),
        BlocProvider(create: (context) => PaymentCubit()..getAuthToken()),
      ],
      child: BlocConsumer<DefactoCubit, DefactoStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Defacto',
                theme: lightTheme,
                home: SplashScreen(nextScreen: startWidget!));
          }),
    );
  }
}
