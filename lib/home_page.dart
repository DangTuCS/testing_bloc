import 'package:flutter/material.dart';
import 'package:testing_bloc/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final NamesCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = NamesCubit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<String?>(
          stream: cubit.stream,
          builder: (context, snapshot) {
            final button = TextButton(
              onPressed: () {
                cubit.pickRandomName();
              },
              child: Text('Pick a random name'),
            );
            switch (snapshot.connectionState) {

              case ConnectionState.none:
                // TODO: Handle this case.
                return button;
              case ConnectionState.waiting:
                // TODO: Handle this case.
                return button;
              case ConnectionState.active:
                // TODO: Handle this case.
                return Column(
                  children: [
                    Text(snapshot.data ?? ''),
                    button,
                  ],
                );
              case ConnectionState.done:
                // TODO: Handle this case.
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
