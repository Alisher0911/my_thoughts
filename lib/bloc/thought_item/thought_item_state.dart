part of 'thought_item_bloc.dart';

abstract class ThoughtItemState extends Equatable {
  const ThoughtItemState();

  @override
  List<Object> get props => [];
}



class ThoughtItemLoading extends ThoughtItemState {
  @override
  List<Object> get props => [];
}


class ThoughtItemLoaded extends ThoughtItemState {
  final List<ThoughtItem> thoughtItems;

  const ThoughtItemLoaded({required this.thoughtItems});

  @override
  List<Object> get props => [thoughtItems];
}


class ThoughtItemError extends ThoughtItemState {
  final String error;

  const ThoughtItemError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ThoughtItemFailure { error: $error }';
}