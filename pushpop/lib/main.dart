// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("This is the 1st Page"),
            backgroundColor: Colors.pink,
            leading: Icon(Icons.code)),
        body: Form(
            key: formKey,
            child: ListView(padding: const EdgeInsets.all(20), children: [
          TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name:"),
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if (value == null || value == ""){
                  return "Please input your name";
                }
                return null;
              }
          ),
          TextFormField(
              controller: locationController,
              decoration: InputDecoration(labelText: "Location:"),
              keyboardType: TextInputType.text,
              validator: (value){
                if (value == null || value == ""){
                  return "Please input your name";
                }
                return null;
              }
            ),
          SizedBox(height: 20),
             
          ElevatedButton(
              onPressed: () {
                formKey.currentState!.validate();
               
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(
                            name: nameController.text,
                            location: locationController.text)));
              },
              child: (const Text("Submit")))
        ])));
  }
}

class SecondPage extends StatelessWidget {
  String? name;
  String? location;

  SecondPage({super.key, this.name, this.location});

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Text("This is the Second Page")),
     
        body: ListView(padding: EdgeInsets.all(20),
           children: [
             Text(
              "Welcome! $name from $location to my Second Page! How you doing?",
              textAlign: TextAlign.center),
        const SizedBox(height: 20),
          OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Let's go back"))
        ]));
  }
}