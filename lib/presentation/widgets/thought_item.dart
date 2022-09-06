import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_thoughts/bloc/thought_item/thought_item_bloc.dart';
import 'package:my_thoughts/consts/styles.dart';
import 'package:my_thoughts/data/models/thought_item_model.dart';

class ThoughtItemCard extends StatelessWidget {
  final ThoughtItem thoughtItem;

  const ThoughtItemCard({ 
    Key? key, 
    required this.thoughtItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CheckboxListTile(
        checkColor: Colors.black,
        activeColor: whiteColor70,
        side: BorderSide(color: whiteColor70),
        shape: Border(
          top: BorderSide(color: blackColor16),
          bottom: BorderSide(color: blackColor16),
          left: BorderSide(color: blackColor16),
          right: BorderSide(color: blackColor16)
        ),
        value: thoughtItem.isChecked,
        title: Text(thoughtItem.title, 
                    style: GoogleFonts.inter(
                      textStyle: thoughtItem.isChecked 
                                  ? const TextStyle(fontSize: 14, color: Colors.white, decoration: TextDecoration.lineThrough) 
                                  : const TextStyle(fontSize: 14, color: Colors.white)
                    )
        ),
        onChanged: (_) {
          context.read<ThoughtItemBloc>().add(
            ChangeCompletion(thoughtItem.copyWith(isChecked: !thoughtItem.isChecked))
          );
        }
      ),
    );
  }
}