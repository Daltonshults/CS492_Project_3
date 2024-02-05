import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(86, 112, 127, 172)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Call Me Maybe'),
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
    // get screen size
    Size screenSize = MediaQuery.of(context).size;

    double imageSize = screenSize.width * 0.5;

    Container image = Container(
        width: imageSize,
        height: imageSize,
        margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 12.0),
        child: Image.asset(
            "assets\\images\\rick-and-morty-image-1662104014.jpg",
            fit: BoxFit.cover));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                HighlightableIconButton(iconData: Icons.person_sharp),
                HighlightableIconButton(iconData: Icons.document_scanner),
                HighlightableIconButton(iconData: Icons.question_mark),
              ]),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            image,
            Container(
              margin: const EdgeInsets.all(3.0),
              child: const Text(
                'John Doe',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              child: const Text(
                'Developer Extraordinare',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 12.0),
                child: const Text(
                  "555-555-5555",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Text("github.com/ricksanchez",
                        style: TextStyle(fontSize: 12))),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Text("ricksanches@gmail.com",
                        style: TextStyle(fontSize: 12))),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HighlightableIconButton extends StatefulWidget {
  const HighlightableIconButton({Key? key, required this.iconData})
      : super(key: key);

  final IconData iconData;

  @override
  HighlightableIconButtonState createState() => HighlightableIconButtonState();
}

class HighlightableIconButtonState extends State<HighlightableIconButton> {
  bool _isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: _isHighlighted
          ? const BoxDecoration(color: Colors.blue, shape: BoxShape.rectangle)
          : null,
      child: IconButton(
        icon: Icon(widget.iconData),
        onPressed: () {
          setState(() {
            _isHighlighted = !_isHighlighted;
          });
        },
        splashColor: Colors.black,
      ),
    );
  }
}
