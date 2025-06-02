import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Screen App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

/// Home Menu
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Menu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Screen A to B with Data'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ScreenA()));
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Login Screen'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => LoginScreen()));
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Static List (Fruits)'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => StaticListScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ========== Screen A and B ==========
class ScreenA extends StatelessWidget {
  final String dataToPass = "Hello from Screen A!";

  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen A')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ScreenB(data: dataToPass)),
            );
          },
          child: Text('Go to Screen B'),
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  final String data;

  const ScreenB({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen B')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back to Screen A'),
            ),
          ],
        ),
      ),
    );
  }
}

// ========== Login Screen ==========
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  String _message = '';

  void _login() {
    setState(() {
      _message = "Logging in...";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _username,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(color: Colors.blue, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

// ========== Static List ==========
class StaticListScreen extends StatelessWidget {
  final List<String> fruits = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Mango',
    'Pineapple',
    'Strawberry',
    'Watermelon',
    'Blueberry',
    'Papaya',
  ];

   StaticListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fruit List')),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: Icon(Icons.local_grocery_store),
              title: Text(fruits[index]),
            ),
          );
        },
      ),
    );
  }
}
