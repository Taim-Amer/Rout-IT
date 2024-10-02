
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class QuestionModel extends Equatable {
  final int questionId;
  final String question;
  final List<String> options;
  final int correctOption;
  final int questionXP;
  bool isAnswered;
  int? selectedAns;

  QuestionModel({
    required this.questionId,
    required this.question,
    required this.options,
    required this.correctOption,
    required this.questionXP,
    this.isAnswered = false,
    this.selectedAns,
  });

  @override
  List<Object?> get props => [questionId, isAnswered, selectedAns, correctOption];

  QuestionModel copyWith({
    bool? isAnswered,
    int? selectedAns,
  }) {
    return QuestionModel(
      questionId: questionId,
      question: question,
      options: options,
      correctOption: correctOption,
      questionXP: questionXP,
      isAnswered: isAnswered ?? this.isAnswered,
      selectedAns: selectedAns ?? this.selectedAns,
    );
  }
}