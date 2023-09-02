import 'package:bloc_example/logic/Counter%20bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is CounterInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CounterChangeSuccessfully) {
            if (state.counter > 10) {
              print('You achived the counter');
            }
            return Center(
              child: Text(
                state.counter.toString(),
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            );
          }
          if (state is Failed) {
            return Text('Failed');
          }

          return Center(
            child: Text(
              state.toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
