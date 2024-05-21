import 'package:flutter/material.dart';
import 'package:proje1/camera.dart';
import 'package:proje1/main.dart';
import 'package:proje1/todo.dart';
//import 'home.dart';
import 'ai.dart'; // Yapay zeka dosyasını import ediyoruz
//import 'profile.dart'; // Profil dosyasını import ediyoruz
 // Sohbet dosyasını import ediyoruz

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Anasayfa(firstName: '', lastName: '', password: ''),
    );
  }
}

class Anasayfa extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String password;

  const Anasayfa({Key? key, required this.firstName, required this.lastName, required this.password}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    todo(), // home.dart'tan PageOne widget'ını kullanıyoruz
    Chatscreen(), // Yapay zeka sayfasını burada kullanıyoruz
    camera(), // Sohbet sayfasını burada kullanıyoruz
    /*ProfileScreen()*/ // Profil sayfasını burada kullanıyoruz
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[400],
      appBar: AppBar(
        title: Text('IntellectEdge'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.add_alarm),
                label: 'Todo',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help_rounded),
                label: 'AI',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera ),
                label: 'Kamera', // Sohbet sayfasını buraya ekledik
              ),

            ],
            selectedLabelStyle: TextStyle(fontSize: 10), // Seçili öğe yazı boyutu
            unselectedLabelStyle: TextStyle(fontSize: 10), // Seçilmemiş öğe yazı boyutu
            selectedItemColor: Colors.black, // Seçili öğe rengi
            unselectedItemColor: Colors.black.withOpacity(0.6), // Seçilmemiş öğe rengi
          ),
        ),
      ),
    );
  }
}
