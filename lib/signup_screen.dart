import 'package:flutter/material.dart';

import 'lib/user_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _firstName;
  late String _lastName;
  late DateTime _birthDate = DateTime.now();
  late String _region;
  late String _password;
  late String _nickname;
  late String _email;
  late int _age = 18;

  UserModel user = UserModel();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Üye Ol'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Ad'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen adınızı girin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _firstName = value!;
                    user.firstName=_firstName;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Soyad'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen soyadınızı girin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lastName = value!;
                    user.lastName=_lastName;
                  },
                ),
                SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  value: _age,
                  items: List.generate(90 - 12 + 1, (index) {
                    return DropdownMenuItem<int>(
                      value: index + 12,
                      child: Text('${index + 12}'),
                    );
                  }),
                  onChanged: (value) {
                    setState(() {
                      _age = value!;
                    });
                  },
                  onSaved: (value) {
                    _age = value!;
                  },
                  decoration: InputDecoration(labelText: 'Yaş'),
                  validator: (value) {
                    if (value == null) {
                      return 'Lütfen yaşınızı seçin';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Bölge'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen bölgenizi girin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _region = value!;
                    user.location=_region;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen Emailinizi girin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                    user.email=_email;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Şifre Oluştur',
                    hintText: 'En az 8 karakter, büyük harf, küçük harf, özel karakter içermeli',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen bir şifre girin';
                    } else if (value.length < 8) {
                      return 'Şifre en az 8 karakter olmalıdır';
                    } else if (!value.contains(RegExp(r'[A-Z]'))) {
                      return 'Şifre en az bir büyük harf içermelidir';
                    } else if (!value.contains(RegExp(r'[a-z]'))) {
                      return 'Şifre en az bir küçük harf içermelidir';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                    user.password=_password;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Takma İsim'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen bir takma isim girin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nickname = value!;
                  },
                ),
              SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Kullanıcı verilerini kullanarak bir şeyler yapabilirsiniz, örneğin:
                      print('Ad: $_firstName');
                      print('Soyad: $_lastName');
                      print('Doğum Tarihi: $_birthDate');
                      print('Yaş: $_age');
                      print('Bölge: $_region');
                      print('Email: $_email');
                      print('Şifre: $_password');
                      print('Takma İsim: $_nickname');

                      // Yeni üye olma işlemi başarılı ise ana ekrana dön
                      Navigator.pop(context);

                    }
                  },
                  child: Text('Üye Ol'),
        ),

        ],
            ),
          ),
        ),
      ),
    );

  }
}
