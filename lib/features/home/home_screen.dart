import 'package:auto_route/annotations.dart';
import 'package:f11_flutter/features/home/provider/devices_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final devices = ref.watch(devicesProvider);
          return Center(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(devices[index].name),
                    subtitle: Text(devices[index].description),
                    leading: CircleAvatar(
                      child: Text(devices[index].id.toString()),
                    ),
                    trailing: IconButton(onPressed: (){
                      ref.read(devicesProvider.notifier).remove(devices[index].id);
                      }, icon: Icon(Icons.delete)),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: devices.length),
          );
        }
      ),
    );
  }
}
