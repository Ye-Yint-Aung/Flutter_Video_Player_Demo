import 'package:flutter/material.dart';

class UiTestingScreen extends StatefulWidget {
  const UiTestingScreen({super.key});

  @override
  State<UiTestingScreen> createState() => _UiTestingScreenState();
}

class _UiTestingScreenState extends State<UiTestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI Testing")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "UserName",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Style"),
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.blue,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero), side: BorderSide(color: Colors.white, width: 2))),
                  ),
                ),
              )
           
           
            ],
          ),
        ),
      ),
    );
  }
}
