import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_thoughts/bloc/thought_item/thought_item_bloc.dart';
import 'package:my_thoughts/presentation/widgets/header.dart';
import 'package:my_thoughts/presentation/widgets/thought_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(padding: EdgeInsets.all(21), child: Header()),

              const SizedBox(height: 5),

              BlocBuilder<ThoughtItemBloc, ThoughtItemState>(
                builder: (context, state) {
                  if (state is ThoughtItemLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ThoughtItemLoaded) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.thoughtItems.length,
                        itemBuilder: (context, index) {
                          return ThoughtItemCard(
                            thoughtItem: state.thoughtItems[index]
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text("Error");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
