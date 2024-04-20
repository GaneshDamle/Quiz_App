import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State {
  bool questionUI = true;
  bool quizStarted = false;
  int questionIndex = 0;
  int buttonChoiceIndex = -1;
  int noOfCorrectQuestion = 0;

  MaterialStateProperty<Color?>? choiceAnswer(int buttonIndex) {
    if (buttonChoiceIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonChoiceIndex == buttonIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Colors.purple);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.purple);
    }
  }

  void startQuiz() {
    setState(() {
      quizStarted = true;
    });
  }

  void nextScrren() {
    if (buttonChoiceIndex == -1) {
      return;
    }
    if (questionIndex == allQuestions.length - 1) {
      questionUI = false;
    }
    if (buttonChoiceIndex != -1) {
      if (buttonChoiceIndex == allQuestions[questionIndex].answerIndex) {
        noOfCorrectQuestion += 1;
      }
      questionIndex += 1;
      buttonChoiceIndex = -1;
      setState(() {});
    }
  }

  List allQuestions = [
    const SingleQuestionModel(
      question:
          " Which component allows us to specify the distance between widgets on the screen?",
      options: ["SafeArea", "SizedBox", "table", "AppBar"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question:
          " Which function will return the widgets attached to the screen as a root of the widget tree to be rendered on screen?",
      options: ["main()", "runApp()", "container()", "root()"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "Which element is used as an identifier in Flutter?",
      options: ["Serial", "Widgets", "Keys", "All of the above"],
      answerIndex: 2,
    ),
    const SingleQuestionModel(
      question:
          "What language is Flutter's rendering engine primarily written in?",
      options: ["Kotlin", "C++", "Dart", "Java"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "Which widget is used to display an image in Flutter?",
      options: [" ImageField", "ImageWidget", "ImageView", "Image"],
      answerIndex: 3,
    ),
    const SingleQuestionModel(
        question: "What widget would you use for repeating content in Flutter?",
        options: ["ExpandedView", "ListView", "Stack", " ArrayView"],
        answerIndex: 1),
    const SingleQuestionModel(
        question: " Which widget is used to create a list in Flutter?",
        options: ["ListView", "ListWidget", "ListLayout", " ListContainer"],
        answerIndex: 0),
  ];
  Scaffold isQuestionScreen() {
    if (!quizStarted) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.grey,
          child: Center(
            child: ElevatedButton(
              onPressed: startQuiz,
              child: const Text("Start Quiz"),
            ),
          ),
        ),
      );
    } else if (questionUI == true) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("Quiz App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                // backgroundColor: Colors.orange,
              )),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Question : ",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    )),
                Text(
                  "${questionIndex + 1} /${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "${allQuestions[questionIndex].question}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: choiceAnswer(0),
                ),
                onPressed: () {
                  if (buttonChoiceIndex == -1) {
                    setState(() {
                      buttonChoiceIndex = 0;
                    });
                  }
                },
                child: Text("${allQuestions[questionIndex].options[0]}"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: choiceAnswer(1),
                ),
                onPressed: () {
                  if (buttonChoiceIndex == -1) {
                    setState(() {
                      buttonChoiceIndex = 1;
                    });
                  }
                },
                child: Text("${allQuestions[questionIndex].options[1]}"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: choiceAnswer(2),
                ),
                onPressed: () {
                  if (buttonChoiceIndex == -1) {
                    setState(() {
                      buttonChoiceIndex = 2;
                    });
                  }
                },
                child: Text("${allQuestions[questionIndex].options[2]}"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: choiceAnswer(3),
                ),
                onPressed: () {
                  if (buttonChoiceIndex == -1) {
                    setState(() {
                      buttonChoiceIndex = 3;
                    });
                  }
                },
                child: Text("${allQuestions[questionIndex].options[3]}"),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              nextScrren();
            });
          },
          child: const Icon(Icons.forward, color: Colors.orange),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("Quiz App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              )),
          centerTitle: true,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                    width: 380,
                    height: 250,
                    child: Image.network(
                      "https://media.istockphoto.com/id/1183252990/vector/first-prize-gold-trophy-icon-prize-gold-trophy-winner-first-prize-vector-illustration-and.jpg?s=612x612&w=0&k=20&c=cr3yNa3yDHeqaN_-2W8TmGvuZ2hLXufO75KOdjY-1uo=",
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text("Congratulations!!!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text("You have solved all quiz",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text("Score : $noOfCorrectQuestion /${allQuestions.length}",
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 20),
                noOfCorrectQuestion != allQuestions.length
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            buttonChoiceIndex = -1;
                            noOfCorrectQuestion = 0;
                            questionIndex = 0;
                            questionUI = true;
                          });
                        },
                        child: const Text("Reset"),
                      )
                    : const Text("All quiz  are correct..!!!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
              ],
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
