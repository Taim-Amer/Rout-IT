import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:route_it27/features/roadmaps/data/models/chat_model.dart';

class ChatCubit extends Cubit<List<Chat>> {
  ChatCubit() : super(Chat.generate());

  /* Controllers */
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  Future<void> onFieldSubmitted() async {
    if (textEditingController.text.isEmpty) return;

    final newChat = Chat.sent(message: textEditingController.text);
    emit([...state, newChat]);

    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    textEditingController.text = '';
  }

  void onFieldChanged(String term) {}

  bool get isTextFieldEnable => textEditingController.text.isNotEmpty;
}
