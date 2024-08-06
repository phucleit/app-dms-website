import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:itv_manager_app/screens/welcome/welcome.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      title: 'ITV Manager Website',
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
            bodyLarge: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
            bodyMedium: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
            displayMedium: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Add your delayed future logic here
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const Welcome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo_scloud.png',
              height: 150,
            ),
            const SizedBox(height: 30),
            if (defaultTargetPlatform == TargetPlatform.iOS)
              const CupertinoActivityIndicator(
                color: Colors.white,
                radius: 20,
              )
            else
              const CircularProgressIndicator(
                color: Colors.white,
              )
          ],
        ),
      ),
    );
  }
}
