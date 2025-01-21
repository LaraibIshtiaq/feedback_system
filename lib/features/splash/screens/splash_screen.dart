///UI of Splash screen
library;

import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/shared/routes/route.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CAPP - TEO Customer App",
                style: Theme.of(context).textTheme.displayLarge),
            Text("Flutter",
                style: Theme.of(context).textTheme.displayMedium
            ),
            SizedBox(height: 20,),
            CircularProgressIndicator(color:  Theme.of(context).primaryColor),
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
