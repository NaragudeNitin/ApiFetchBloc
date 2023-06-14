part of 'photo_cubit.dart';

@immutable
abstract class PhotoState extends Equatable {}

class PhotoLoadingState extends PhotoState {
  @override
  List<Object?> get props => [];
}

class PhotoLoadedState extends PhotoState {
  final List<PhotoModal> photos;

  PhotoLoadedState(this.photos);

  @override
  List<Object?> get props => [photos];
}

class PhotoErrorState extends PhotoState {
  final String error;

  PhotoErrorState(this.error);
  @override
  List<Object?> get props => [error];
  
}
