import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_thoughts/bloc/thought_item/thought_item_bloc.dart';

class Header extends StatelessWidget {
  const Header({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _textController = TextEditingController();

    return Form(
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: _textController,
              style: GoogleFonts.inter(
                color: Colors.white, fontSize: 14
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Type text ...",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
                contentPadding: const EdgeInsets.only(left: 5, right: 5),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                )
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'The field cannot be empty.';
                }
                return null;
              },
    
            ),
          ),
    
          SizedBox(width: 10),
    
          SizedBox(
            height: 16.0,
            width: 16.0,
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: const EdgeInsets.all(0.0),
              color: Colors.white,
              icon: const Icon(Icons.add),
              iconSize: 26,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<ThoughtItemBloc>().add(AddThoughtItem(_textController.text));
                }
              },
            )
          )
        ],
      ),
    );
  }
}