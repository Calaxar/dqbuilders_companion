import 'package:flutter/material.dart';
import 'package:dqbuilders_companion/chapterSelect.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DQBulders Companion',
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
        primarySwatch: Colors.red,
			textTheme: TextTheme(
				title: TextStyle(
					color: Colors.white,
					fontSize: 23.0,
					fontWeight: FontWeight.w600
				),
				subhead: TextStyle(
					color: Colors.white,
					fontSize: 50.0,
					fontWeight: FontWeight.bold,
					shadows: <Shadow>[
						Shadow(
							offset: Offset(1.0, 1.0),
							blurRadius: 4.0,
							color: Colors.black
						)
					],
				),
				subtitle: TextStyle(
					color: Colors.white,
					fontSize: 30.0,
					shadows: <Shadow>[
						Shadow(
							offset: Offset(1.0, 1.0),
							blurRadius: 6.0,
							color: Colors.black
						)
					],

				),
				body1: TextStyle(
					color: Colors.white,
					fontSize: 18.0,
				),
				body2: TextStyle(
					color: Colors.white,
					fontSize: 18.0,
					fontWeight: FontWeight.w800
				)
			)
      ),
      home: ChapterSelect(),
    );
  }
}
