// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:counter_in_bloc/bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Center(
        child: BlocProvider(
          create: (context) => CounterCubit(),
          child: HomeView(
            toggleTheme: _toggleTheme,
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key, required toggleTheme})
      : _toggleTheme = toggleTheme;

  final VoidCallback _toggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color.fromARGB(255, 240, 130, 122),
                ),
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                child: const Text('+',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: const Color.fromARGB(255, 161, 149, 71),
                  ),
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Text('-',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ))),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: const Color.fromARGB(255, 30, 58, 168),
                  ),
                  onPressed: () {
                    context.read<CounterCubit>().resetCounter();
                  },
                  child: const Text('0',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ))),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('counter', style: TextStyle(fontSize: 25)),
                  SizedBox(width: 10),
                  Text(
                    '${context.watch<CounterCubit>().counter}',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      _toggleTheme();
                    },
                    child: Text('change theme'),
                  ),
                ],
              )
            ],
          ));
        },
      ),
    );
  }
}
