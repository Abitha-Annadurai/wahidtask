import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                itemCount: userList.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(userList[index].avatar),
                            ),
                            RatingBarIndicator(
                              unratedColor: Colors.black12,
                              //rating: 3.56,
                              rating: userList[index].stars,
                              itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                              itemCount: 5,
                              itemSize: 20,
                              direction: Axis.horizontal,
                            ),
                            Text(userList[index].name),
                            Text(userList[index].username),
                            Text(userList[index].description),
                          ],),
                      )
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
