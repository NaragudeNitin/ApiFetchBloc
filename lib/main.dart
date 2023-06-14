import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_api_bloc/cubit/photo_cubit.dart';
import 'package:photo_api_bloc/home_screen.dart';
import 'package:photo_api_bloc/repository/photo_repository.dart';

import 'cubit/photo_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PhotoCubit(PhotoRepository())..add(LoadPhotoEvent()),
          ),
          
        ],
        child: const HomeScreen(),
      ),
    );
  }
}

