import 'package:equatable/equatable.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();
}

class LoadPhotoEvent extends PhotoEvent {
@override
  List<Object?> get props => [];
}