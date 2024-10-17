import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class Quiz {
  final String statement;
  final List<QuizOption> options;
  final String correctOptionId;

  Quiz(
      {required this.statement,
      required this.options,
      required this.correctOptionId});
}

class QuizOption {
  final String id;
  final String option;

  QuizOption(this.id, this.option);
}

class TeXViewQuizRnd extends StatefulWidget {
  final TeXViewRenderingEngine renderingEngine;

  const TeXViewQuizRnd(
      {super.key, this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  State<TeXViewQuizRnd> createState() => _TeXViewQuizRndState();
}

class _TeXViewQuizRndState extends State<TeXViewQuizRnd> {
  int currentQuizIndex = 0;
  String selectedOptionId = "";
  bool isWrong = false;

  List<Quiz> quizList = [
    Quiz(
      statement: r"""<h3>What is the correct form of quadratic formula?</h3>""",
      options: [
        QuizOption(
          "id_1",
          r""" <h2>(A)   \(x = {-b \pm \sqrt{b^2+4ac} \over 2a}\)</h2>""",
        ),
        QuizOption(
          "id_2",
          r""" <h2>(B)   \(x = {b \pm \sqrt{b^2-4ac} \over 2a}\)</h2>""",
        ),
        QuizOption(
          "id_3",
          r""" <h2>(C)   \(x = {-b \pm \sqrt{b^2-4ac} \over 2a}\)</h2>""",
        ),
        QuizOption(
          "id_4",
          r""" <h2>(D)   \(x = {-b + \sqrt{b^2+4ac} \over 2a}\)</h2>""",
        ),
      ],
      correctOptionId: "id_3",
    ),
    Quiz(
      statement:
          r"""<h3>Choose the correct mathematical form of Bohr's Radius.</h3>""",
      options: [
        QuizOption(
          "id_1",
          r""" <h2>(A)   \( a_0 = \frac{{\hbar ^2 }}{{m_e ke^2 }} \)</h2>""",
        ),
        QuizOption(
          "id_2",
          r""" <h2>(B)   \( a_0 = \frac{{\hbar ^2 }}{{m_e ke^3 }} \)</h2>""",
        ),
        QuizOption(
          "id_3",
          r""" <h2>(C)   \( a_0 = \frac{{\hbar ^3 }}{{m_e ke^2 }} \)</h2>""",
        ),
        QuizOption(
          "id_4",
          r""" <h2>(D)   \( a_0 = \frac{{\hbar }}{{m_e ke^2 }} \)</h2>""",
        ),
      ],
      correctOptionId: "id_1",
    ),
    Quiz(
      statement: r"""<h3>Select the correct Chemical Balanced Equation.</h3>""",
      options: [
        QuizOption(
          "id_1",
          r""" <h2>(A)   \( \ce{CO + C -> 2 CO} \)</h2>""",
        ),
        QuizOption(
          "id_2",
          r""" <h2>(B)   \( \ce{CO2 + C ->  CO} \)</h2>""",
        ),
        QuizOption(
          "id_3",
          r""" <h2>(C)   \( \ce{CO + C ->  CO} \)</h2>""",
        ),
        QuizOption(
          "id_4",
          r""" <h2>(D)   \( \ce{CO2 + C -> 2 CO} \)</h2>""",
        ),
      ],
      correctOptionId: "id_4",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("TeXView Quiz"),
      ),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              bool isCorrect = selectedOptionId ==
                  quizList[currentQuizIndex].correctOptionId;
              showModalBottomSheet(
                context: context,
                barrierColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.black,
                          ),
                          height: 200, // Set your desired height
                          // Black background

                          child: Center(
                            child: Text(
                              isCorrect ? 'Correct Answer' : 'Wrong Answer',
                              style: TextStyle(
                                color: isCorrect ? Colors.green : Colors.red,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 3, 95, 95),
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Close the modal before updating the state
                                    Navigator.pop(
                                        context); // This hides the modal
                                    setState(() {
                                      if (currentQuizIndex > 0) {
                                        selectedOptionId = "";
                                        currentQuizIndex--;
                                      }
                                    });
                                  },
                                  //    child: const Text("<- Previous"),

                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios_rounded,
                                        size: 17,
                                      ),
                                      SizedBox(width: 20),
                                      Text("Previous",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 3, 95, 95),
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Close the modal before updating the state
                                    Navigator.pop(
                                        context); // This hides the modal
                                    setState(() {
                                      if (currentQuizIndex <
                                          quizList.length - 1) {
                                        selectedOptionId = "";
                                        currentQuizIndex++;
                                      }
                                    });
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Next",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                      SizedBox(width: 20),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 17,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text("Check"),
          ),
        )
      ],
      body: ListView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(
            'Quiz ${currentQuizIndex + 1}/${quizList.length}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TeXView(
            child: TeXViewColumn(children: [
              TeXViewDocument(
                quizList[currentQuizIndex].statement,
                style: const TeXViewStyle(
                  padding: TeXViewPadding.all(10),
                  backgroundColor: Colors.white,
                  borderRadius: TeXViewBorderRadius.all(10),
                  border: TeXViewBorder.all(
                    TeXViewBorderDecoration(
                      borderWidth: 2,
                      borderColor: Colors.grey,
                    ),
                  ),
                ),
              ),
              TeXViewGroup(
                  children: quizList[currentQuizIndex]
                      .options
                      .map((QuizOption option) {
                    return TeXViewGroupItem(
                      rippleEffect: false,
                      id: option.id,
                      child: TeXViewDocument(
                        option.option,
                        style: const TeXViewStyle(
                          padding: TeXViewPadding.all(10),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                  selectedItemStyle: const TeXViewStyle(
                    borderRadius: TeXViewBorderRadius.all(10),
                    border: TeXViewBorder.all(
                      TeXViewBorderDecoration(
                        borderWidth: 3,
                        borderColor: Color(0xFF852DFE),
                      ),
                    ),
                    margin: TeXViewMargin.all(10),
                  ),
                  normalItemStyle: TeXViewStyle(
                      borderRadius: const TeXViewBorderRadius.all(10),
                      border: TeXViewBorder.all(
                        TeXViewBorderDecoration(
                          borderWidth: 3,
                          borderColor: Colors.grey[200],
                        ),
                      ),
                      margin: const TeXViewMargin.all(10)),
                  onTap: (id) {
                    selectedOptionId = id;
                    setState(() {
                      isWrong = false;
                    });
                  })
            ]),
          ),
        ],
      ),
    );
  }
}
