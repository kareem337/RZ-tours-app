import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 200.0,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: Icon(
                  Icons.email,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: Icon(
                  Icons.password,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Signin',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60.0,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Create an Account? Signup',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
