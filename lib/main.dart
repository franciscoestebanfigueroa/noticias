import 'package:flutter/material.dart';
import 'package:noticias/providers/provider_custom_botton_bar.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyAppProvider());
}

class MyAppProvider extends StatelessWidget {
  const MyAppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ProviderCustomBottonBar(),
      )
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.orange,
      )),
      home: const SafeArea(child: Home()),
    );
  }
}
