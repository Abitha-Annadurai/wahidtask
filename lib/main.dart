import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wahidtask/date_provider.dart';
import 'package:wahidtask/user_model.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(),
      body: _data.when(data: (_data){
        List<UserModel> userList = _data.map((e) => e).toList();
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(userList[index].avatar.toString()),
                        ),
                        title: Text(userList[index].name.toString()),
                        subtitle: Text(userList[index].description.toString()),
                      ),
                    );
                  }),
            )
          ],
        );
      }, 
          error: (err, s) => Text(err.toString()),
          loading: () => Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
