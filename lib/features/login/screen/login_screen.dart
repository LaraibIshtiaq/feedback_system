import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/shared/routes/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _){
          return SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login User ",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Enter User Name"),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Enter Password"),
                      obscureText: true,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            context.pushRoute(ForgetPasswordRoute());
                          },
                          child: Text("Forgot Password"),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.replaceRoute(HomeRoute());
                      },
                      child: Text("Login"),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        context.pushRoute(SignupRoute());
                      },
                      child: Text("Don't have an account? Sign Up"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
