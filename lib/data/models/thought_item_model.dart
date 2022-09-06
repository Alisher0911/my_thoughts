import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class ThoughtItem extends Equatable {
  final String id;
  final String title;
  final bool isChecked;

   ThoughtItem({
    required this.title,
    String? id,
    this.isChecked = false,
  }) :id = id ?? const Uuid().v1();

  @override
  List<Object?> get props => [id, title, isChecked];

  ThoughtItem copyWith({ String? id, String? title, bool? isChecked}) {
    return ThoughtItem(
      id: id ?? this.id,
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked
    );
  }
}