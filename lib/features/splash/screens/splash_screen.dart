///UI of Splash screen
library;

import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/shared/constants/assets.dart';
import 'package:capp_mobile/shared/routes/route.gr.dart';
import 'package:capp_mobile/shared/theme/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: TriangleGradientPainter(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(logoCapp),
              Text("CAPP",
                  style: Theme.of(context).textTheme.displayMedium!
              .copyWith(
                    color: Theme.of(context).primaryColor
                  )),
              FutureBuilder(
                  future: Future.delayed(Duration(seconds: 2)),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done){
                      context.replaceRoute(HomeRoute());
                    }
                    return SizedBox.shrink();
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
