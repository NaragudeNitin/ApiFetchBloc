import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_api_bloc/cubit/photo_event.dart';
import 'package:photo_api_bloc/modals/photo_modal.dart';
import 'package:photo_api_bloc/repository/photo_repository.dart';

import 'cubit/photo_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Api'),
      ),
      body: BlocBuilder<PhotoCubit, PhotoState>(
        builder: (context, state) {
          if (state is PhotoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PhotoErrorState) {
            return const Center(
              child: Text('There is an Error'),
            );
          }
          if (state is PhotoLoadedState) {
            List<PhotoModal> photoList = state.photos;
            return ListView.builder(
              itemCount: photoList.take(20).length,
              itemBuilder: (context, index) {
                return Padding(padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Card(
                    color: Colors.blueGrey.shade50,
                    child: ListTile(
                      title: Text('${photoList[index].title}', style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),),
                      subtitle: Text('${photoList[index].id}',style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(photoList[index].url.toString()),
                      ),
                    ),
                  ),
                );
            },);
          }
          return Container();
        },
      ),
    );
  }
}