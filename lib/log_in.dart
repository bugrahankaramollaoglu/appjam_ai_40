import 'package:flutter/material.dart';
import 'package:proje1/lib/user_list.dart';
import 'package:proje1/signup_screen.dart';
import 'anasayfa.dart';

class GirisEkrani extends StatefulWidget {
  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _passwordController;
  UserList _userList = UserList(); // UserList sınıfından bir örnek oluşturuldu

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 32),
              Text(
                'IntellectEdge',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage('https://cdn.aarp.net/content/dam/aarp/health/brain_health/2019/02/1140-gcbh-milestones-promo.imgcache.rev6870ef69ee2f48d336791775bd721336.jpg'), // Değişiklik burada
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Hoşgeldiniz',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Container(
                color: Colors.white,
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'Ad',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                color: Colors.white,
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Soyad',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                color: Colors.white,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String enteredFirstName = _firstNameController.text.trim();
                  String enteredLastName = _lastNameController.text.trim();
                  String enteredPassword = _passwordController.text.trim();

                  // Girilen bilgileri UserList sınıfındaki kullanıcılarla karşılaştır
                  bool isAuthenticated = _userList.authenticateUser(enteredFirstName, enteredLastName, enteredPassword);

                  if (isAuthenticated) {
                    // Giriş başarılı ise ana sayfaya yönlendir
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Anasayfa(
                        firstName: enteredFirstName,
                        lastName: enteredLastName,
                        password: enteredPassword,
                      )),
                    );
                  } else {
                    // Kullanıcı adı veya şifre yanlış ise hata mesajı göster
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Hata'),
                          content: Text('Kullanıcı adı veya şifre hatalı.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Tamam'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Giriş Yap'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text('Yeni Üye Olmak İster misin?'),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
