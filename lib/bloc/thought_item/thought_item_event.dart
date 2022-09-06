part of 'thought_item_bloc.dart';

abstract class ThoughtItemEvent extends Equatable {
  const ThoughtItemEvent();

  @override
  List<Object> get props => [];
}



class LoadThoughtItems extends ThoughtItemEvent {
  @override
  List<Object> get props => [];
}


class AddThoughtItem extends ThoughtItemEvent {
  final String thoughtItemTitle;

  const AddThoughtItem(this.thoughtItemTitle);

  @override
  List<Object> get props => [thoughtItemTitle];
}


class ChangeCompletion extends ThoughtItemEvent {
  final ThoughtItem thoughtItem;

  const ChangeCompletion(this.thoughtItem);

  @override
  List<Object> get props => [];
}