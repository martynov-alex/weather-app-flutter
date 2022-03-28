import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    String city = 'Moscow';

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter a city name'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.black87,
              decoration: const InputDecoration(
                icon: Icon(Icons.location_city, color: Colors.black87),
                hintText: 'Enter a city name',
                focusColor: Colors.black87,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
              ),
              onEditingComplete: () => Navigator.pop(context, city),
              onChanged: (String value) => city = value,
              autofocus: true,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.pop(context, city),
              child: Text(
                'Get weather',
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
