import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/providers/data_provider.dart';


import 'model/interest_response.dart';

void main() {
  runApp( const ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Counter App',
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Counter Page'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => const CounterPage()),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Using the WidgetRef to get the counter int from the counterProvider.
    // The watch method makes the widget rebuild whenever the int changes value.
    //   - something like setState() but automatic
    final _data = ref.watch(userDataProvider);

    return  Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: _data.when(
          data: (_data) {
            return Column(
              children: [
                ..._data.map((e) => ListView(shrinkWrap: true, children: [
                  InkWell(
                    onTap: () =>
                      {

                        },
                    child: ListTile(
                      title: Text(e.name!),
                      subtitle: Text(e.name!),
                    ),
                  ),
                ])),
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),

        ));
  }
}