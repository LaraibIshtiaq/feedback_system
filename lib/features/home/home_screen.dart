import 'package:auto_route/annotations.dart';
import 'package:f11_flutter/features/home/provider/devices_provider.dart';
import 'package:f11_flutter/features/home/provider/home_view_model.dart';
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
    ref.read(homeViewModel).getDevices();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        final devices = ref.watch(devicesProvider);
        return Center(
          child: FadeTransition(
            opacity: animation,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 2000),
              child: devices.isEmpty
                  ? CircularProgressIndicator()
                  : Scrollbar(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(devices[index].name),
                            subtitle: Text(devices[index].url),
                            leading: CircleAvatar(
                              child: Image.network(
                                  devices[index].url,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    );
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ),
                            trailing: IconButton(
                                onPressed: () {
                                  ref
                                      .read(devicesProvider.notifier)
                                      .remove(devices[index].id);
                                },
                                icon: Icon(Icons.delete)),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: devices.length),
                  ),
            ),
          ),
        );
      }),
    );
  }
}
