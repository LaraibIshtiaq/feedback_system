import 'package:auto_route/auto_route.dart';
import 'package:f11_flutter/shared/routes/route.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Sign Up User"),
                TextField(
                  decoration: InputDecoration(hintText: "Enter User Name"),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Password"),
                  obscureText: true,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Confirm Password"),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.replaceRoute(HomeRoute());
                  },
                  child: Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
