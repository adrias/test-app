import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parentive/Bloc/auth/authBloc.dart';
import 'package:parentive/Bloc/login/loginBloc.dart';
import 'package:parentive/Bloc/reg/regBloc.dart';
import 'package:parentive/screens/splashScreen.dart';
import 'package:parentive/utils/routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegBloc(RegInitial())),
        BlocProvider(
          create: (context) => AuthBloc()
            ..add(
              UserCheck(),
            ),
        ),
        BlocProvider(
          create: (context) =>
              LoginBloc(authBloc: BlocProvider.of<AuthBloc>(context)),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Color(0xffFFFFFF),
          iconTheme: IconThemeData(
            color: Color(0xff000000),
          ),
          // textTheme: TextTheme(),
        ),
      ),
      initialRoute: 'splash',
      onGenerateRoute: Routers.generateRoute,
      home: SplashScreen(),
    );
  }
}
