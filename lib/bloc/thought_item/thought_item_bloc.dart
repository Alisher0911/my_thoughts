import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_thoughts/data/models/thought_item_model.dart';

part 'thought_item_event.dart';
part 'thought_item_state.dart';

class ThoughtItemBloc extends Bloc<ThoughtItemEvent, ThoughtItemState> {
  ThoughtItemBloc() : super(ThoughtItemLoading()) {
    on<LoadThoughtItems>(_onLoadThoughtItems);
    on<AddThoughtItem>(_onAddThoughtItem);
    on<ChangeCompletion>(_onChangeCompletion);
  }


  void _onLoadThoughtItems(LoadThoughtItems event, Emitter<ThoughtItemState> state) async {
    emit(ThoughtItemLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const ThoughtItemLoaded(thoughtItems: []));
    } catch (_) {}
  }

  void _onAddThoughtItem(AddThoughtItem event, Emitter<ThoughtItemState> state) {
    final state = this.state;
    if (state is ThoughtItemLoaded) {
      try {
        final newItem = ThoughtItem(title: event.thoughtItemTitle);
        final List<ThoughtItem> updatedItems = List.from(state.thoughtItems)..insert(0, newItem);
        emit(ThoughtItemLoaded(thoughtItems: updatedItems));
      } catch (_) {}
    }
  }

  void _onChangeCompletion(ChangeCompletion event, Emitter<ThoughtItemState> state) {
    final state = this.state;
    if (state is ThoughtItemLoaded) {
      var updatedItems = state.thoughtItems.map(
        (item) => item.id == event.thoughtItem.id ? event.thoughtItem : item
      ).toList();

      var item = updatedItems.firstWhere((item) => item.id == event.thoughtItem.id);
      int index = updatedItems.indexOf(item);
      updatedItems.removeAt(index);
      
      if (event.thoughtItem.isChecked) {
        updatedItems.add(item);
      } else {
        updatedItems.insert(0, item);
      }

      emit(ThoughtItemLoaded(thoughtItems: updatedItems));
    }
  }
}
