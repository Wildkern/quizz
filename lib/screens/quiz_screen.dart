import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer functionality
import '../services/api_service.dart';
import '../models/quiz_model.dart';
import '../widgets/question_card.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<QuizModel> quizData;
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int timer = 30; // Timer for each question (30 seconds)
  late Timer _timer;
  bool isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    quizData = ApiService().fetchQuizData();
  }

  // Start the timer for each question
  void _startTimer() {
    if (isTimerRunning) return;

    isTimerRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (this.timer > 0) {
        setState(() {
          this.timer--;
        });
      } else {
        _nextQuestion();
      }
    });
  }

  // Reset the timer when moving to a new question
  void _resetTimer() {
    setState(() {
      timer = 30;
    });
    _startTimer();
  }

  // Move to the next question
  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        _resetTimer(); // Reset timer when moving to next question
      } else {
        _submitQuiz(); // Submit quiz if it's the last question
      }
    });
  }

  // Submit the quiz
  void _submitQuiz() {
    int score = questions.fold(0, (totalScore, question) {
      final selectedOption = question.options.firstWhere(
        (option) => option.isSelected,
        orElse: () => Option(
            id: -1, description: '', isCorrect: false, isSelected: false),
      );
      return totalScore + (selectedOption.isCorrect ? 1 : 0);
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(questions: questions, score: score),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Make sure to cancel the timer when leaving the screen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back navigation
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Quiz',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.greenAccent,
            elevation: 0,
          ),
          body: FutureBuilder<QuizModel>(
            future: quizData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                questions = snapshot.data!.questions;

                // Start the timer when the screen is first built
                if (!isTimerRunning) {
                  _startTimer();
                }

                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blueAccent,
                        Colors.greenAccent,
                        Colors.yellowAccent
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      // Timer Display with Animation
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 500),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          child: Text('Time remaining: $timer s'),
                        ),
                      ),

                      // Question Number with Animation
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedOpacity(
                          opacity: 1.0,
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            'Question ${currentQuestionIndex + 1} of ${questions.length}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),

                      // Animated Question Transition
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          child: SingleChildScrollView(
                            child: QuestionCard(
                                question: questions[currentQuestionIndex]),
                          ),
                        ),
                      ),

                      // Navigation Buttons with Gradient
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: currentQuestionIndex ==
                                      questions.length - 1
                                  ? _submitQuiz // Call _submitQuiz when it's the last question
                                  : _nextQuestion, // Otherwise, move to the next question
                              child: Text(
                                currentQuestionIndex == questions.length - 1
                                    ? 'Finish Quiz'
                                    : 'Next',
                                style: const TextStyle(fontSize: 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('No data available.'));
              }
            },
          ),
        ),
      ),
    );
  }
}
