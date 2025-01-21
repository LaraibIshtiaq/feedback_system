import 'package:auto_route/annotations.dart';
import 'package:capp_mobile/features/home/provider/devices_provider.dart';
import 'package:capp_mobile/features/home/provider/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    ref.read(homeViewModel).getEvents();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final events = ref.watch(eventProvider);
        return Center(
          child: FadeTransition(
            opacity: animation,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 2000),
              child: events.isEmpty
                  ? CircularProgressIndicator()
                  : Scrollbar(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(events[index].eventName),
                              subtitle: Text(events[index].eventNote),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: events.length),
                    ),
            ),
          ),
        );
      }),
    );
  }
}
