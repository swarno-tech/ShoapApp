import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 3),
                  Container(
                    height: 250,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.all(20),
                    child: Image.asset('assets/images/login_page.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Text(
              "Hello",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontFamily: 'Lato',
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Welcome,to shopping app\nwhere you can buy anything",
              style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
            TextField(
              obscureText: true,
              obscuringCharacter: '*',
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Password",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Logged in successfully")),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  minimumSize: WidgetStatePropertyAll(Size(200, 50)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  minimumSize: WidgetStatePropertyAll(Size(200, 50)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Sign up uisng",
              style: TextStyle(fontSize: 16, fontFamily: 'Lato'),
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.facebook),
                  iconSize: 40,
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.google, color: Colors.red),
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.linkedin, color: Colors.blue),
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
