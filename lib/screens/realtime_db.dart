import 'package:flexi_sense_companion/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

class RealtimeDBScreen extends StatefulWidget {
  const RealtimeDBScreen({Key? key}) : super(key: key);

  @override
  _RealtimeDataState createState() => _RealtimeDataState();
}

class _RealtimeDataState extends State<RealtimeDBScreen> {
  final ref = FirebaseDatabase.instance.ref('data');
  String? _status = "loading..";
  bool _isOnline = true;

  @override
  void initState() {
    super.initState();

    // Listen for changes in the data
    ref.onValue.listen((event) {
      if (event.snapshot.value != null) {
        // Data exists
        String newStatus = event.snapshot.value.toString();
        setState(() {
          _status = newStatus;
          _isOnline = true;
        });
      } else {
        // No data
        setState(() {
          _status = null;
          _isOnline = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Real Time Database",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: _status == null
                    ? Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "User is offline",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/images/offline.png',
                      height: 500,
                    ),
                  ],
                )
                    : Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      _status!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    if (_status == "I need medicine")
                      Image.asset(
                        'assets/images/pills.png',
                        height: 500,
                      )
                    else if (_status == "I need assistance")
                      Image.asset(
                        'assets/images/assistance.png',
                        height: 500,
                      )
                    else
                      Image.asset(
                        'assets/images/okay.png',
                        height: 500,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
