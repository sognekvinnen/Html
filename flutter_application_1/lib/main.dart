import 'package:flutter/material.dart';
import 'package:flutter_application_1/map.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async  {
    WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://frvexfoezbscdbcvuxas.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZydmV4Zm9lemJzY2RiY3Z1eGFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk3NDY4ODgsImV4cCI6MjA3NTMyMjg4OH0.XDr9MFxBMX0P42a4MwjstxtZeh_Caqdyrfpfr7d9ec8',
  );

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Форма входа',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  var menuIndex=0;
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Обработка данных формы
      final login = _loginController.text;
      final password = _passwordController.text;
      
      // Здесь можно добавить логику авторизации
      print('Логин: $login');
      print('Пароль: $password');
      
      if(menuIndex==0) {

     var authResponse =await Supabase.instance.client.auth.signInWithPassword(
      email: login,
      password: password);
     print(authResponse);
      print(authResponse.user);
      if(authResponse.user !=null) {

          ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Форма отправлена успешно!')),
                );

          Navigator.of(context).push( 
            MaterialPageRoute(builder: (c) {

                  return    MyMapWidget();


            })
          );
      }
      else {
         ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error!')),
                );
      }
      // Показать сообщение об успехе
     
      }
      else if(menuIndex==1) {
        
     var authResponse =await Supabase.instance.client.auth.signUp(
      email: login,
      password: password);
     print(authResponse.user);
      // Показать сообщение об успехе
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Форма отправлена успешно!')),
      );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) { setState(() { menuIndex=i; }); },
        currentIndex:menuIndex,
        items: [ 
      BottomNavigationBarItem(icon: Icon(Icons.add_card),label:'signin'),
         BottomNavigationBarItem(icon: Icon(Icons.add_card),label: 'signup'),
            BottomNavigationBarItem(icon: Icon(Icons.add_card),label:'map')
      ]),
      
      appBar: AppBar(
        title:  Text(menuIndex==1 ? 'Форма входа' : 'Регистрация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Поле логина
              TextFormField(
                controller: _loginController,
                decoration: const InputDecoration(
                  labelText: 'Логин',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите логин';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Поле пароля
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите пароль';
                  }
                  if (value.length < 6) {
                    return 'Пароль должен содержать минимум 6 символов';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              // Кнопка ОК
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'ОК',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}