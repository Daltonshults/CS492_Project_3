import 'package:call_me_maybe/Predictor/predictor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BusinessCard/business_card.dart';
import 'Resume/resume.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 79, 117, 139)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Call Me Maybe'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appNavBar(context),
      body: TabBarView(
          // USE THE CHILDREN HERE TO LOAD UP THE SEPARATE VEIWS
          // NEED ONE THAT DISPLAYS PERSONAL INFO/BUSINESS CARD
          // SECOND ONE IS RESUME LISTING, AND LISTVIEW
          // THIRD ONE IS THE RANDOM GENERATOR/PREDICTOR
          children: [
            const BusinessCard(
              name: "Jane Smith",
              title: "Developer Extraordinaire",
              phoneNumber: "555 555 55555",
              github: "github.com/jsmith",
              email: "jsmith@example.com",
            ),
            const ResumeCard(),
            Predictor(),
          ]),
    );
  }

  AppBar appNavBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 108, 145, 167),
      title: Center(
          child: Text(
        widget.title,
        style: const TextStyle(color: Colors.white),
      )),
      bottom: const TabBar(tabs: [
        Tab(child: Icon(Icons.person_sharp)),
        Tab(child: Icon(Icons.document_scanner)),
        Tab(child: Icon(Icons.question_mark_outlined))
      ]),
    );
  }
}
