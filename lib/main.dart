import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:weatherforecast/data/repository/local/application_local_repository.dart';
import 'package:weatherforecast/data/repository/local/fake_location_provider.dart';
import 'package:weatherforecast/data/repository/local/location_manager.dart';
import 'package:weatherforecast/data/repository/local/location_provider.dart';
import 'package:weatherforecast/data/repository/local/storage_manager.dart';
import 'package:weatherforecast/data/repository/local/storage_provider.dart';
import 'package:weatherforecast/data/repository/local/weather_local_repository.dart';
import 'package:weatherforecast/data/repository/remote/weather_api_provider.dart';
import 'package:weatherforecast/data/repository/remote/weather_remote_repository.dart';
import 'package:weatherforecast/ui/app/app_bloc.dart';
import 'package:weatherforecast/ui/main/bloc/main_screen_bloc.dart';
import 'package:weatherforecast/ui/navigation/bloc/navigation_bloc.dart';
import 'package:weatherforecast/ui/navigation/navigation_provider.dart';

void main() {
  runApp(const FeatherApp());
}

class FeatherApp extends StatefulWidget {
  const FeatherApp({Key? key}) : super(key: key);

  @override
  _FeatherAppState createState() => _FeatherAppState();
}

class _FeatherAppState extends State<FeatherApp> {
  final NavigationProvider _navigation = NavigationProvider();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final LocationManager _locationManager = LocationManager(
      Platform.isMacOS ? FakeLocationProvider() : LocationProvider());
  final StorageManager _storageManager = StorageManager(StorageProvider());
  late WeatherLocalRepository _weatherLocalRepository;
  final WeatherRemoteRepository _weatherRemoteRepository =
      WeatherRemoteRepository(WeatherApiProvider());
  late ApplicationLocalRepository _applicationLocalRepository;

  @override
  void initState() {
    super.initState();
    _weatherLocalRepository = WeatherLocalRepository(_storageManager);
    _applicationLocalRepository = ApplicationLocalRepository(_storageManager);
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _navigation.defineRoutes();
    _configureTimeago();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc(
            _applicationLocalRepository,
          ),
        ),
        BlocProvider<MainScreenBloc>(
          create: (context) => MainScreenBloc(
              _locationManager,
              _weatherLocalRepository,
              _weatherRemoteRepository,
              _applicationLocalRepository),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(_navigation, _navigatorKey),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        theme: _configureThemeData(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("en"),
          Locale("pl"),
        ],
        onGenerateRoute: _navigation.router.generator,
      ),
    );
  }

  ThemeData _configureThemeData() {
    return ThemeData(
      textTheme: const TextTheme(
        headline5: TextStyle(fontSize: 60.0, color: Colors.white),
        headline6: TextStyle(fontSize: 35, color: Colors.white),
        subtitle2: TextStyle(fontSize: 20, color: Colors.white),
        bodyText2: TextStyle(fontSize: 15, color: Colors.white),
        bodyText1: TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }

  void _configureTimeago() {
    timeago.setLocaleMessages("en", timeago.EnMessages());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
