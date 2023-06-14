import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:photo_api_bloc/cubit/photo_event.dart';

import '../modals/photo_modal.dart';
import '../repository/photo_repository.dart';

part 'photo_state.dart';

class PhotoCubit extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository photoRepository;
  PhotoCubit(this.photoRepository) : super(PhotoLoadingState()) {
    on<LoadPhotoEvent>((event, emit) async {
      emit(PhotoLoadingState());
      try {
        final photos = await photoRepository.getPhotos();
        emit(
          PhotoLoadedState(photos),
        );
      } catch (e) {
        emit(
          PhotoErrorState(
            e.toString(),
          ),
        );
      }
    });
  }
}
