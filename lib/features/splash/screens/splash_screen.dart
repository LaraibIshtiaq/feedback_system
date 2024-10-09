///UI of Splash screen
library;

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:f11_flutter/shared/routes/route.gr.dart';
import 'package:f11_flutter/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("F11 Architecture",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Text("Flutter",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 20,),
            CircularProgressIndicator(color: AppColors.black,),
            FutureBuilder(
                future: Future.delayed(Duration(seconds: 2)),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
                    context.replaceRoute(LoginRoute());
                  }
                  return SizedBox.shrink();
                },
            ),
          ],
        ),
      ),
    );
  }
}
