import 'package:flutter/material.dart';
import 'package:origo_iceland_project_app/enums/answers.dart';
import 'package:origo_iceland_project_app/helpers/communication_handler.dart';
import 'package:origo_iceland_project_app/helpers/model_helper.dart';
import 'package:origo_iceland_project_app/helpers/util_helper.dart';
import 'package:origo_iceland_project_app/models/main_model.dart';
import 'package:origo_iceland_project_app/screens/home_page.dart';
import 'package:origo_iceland_project_app/services/preferences.dart';

class QuestionScreen extends StatefulWidget {
  final int height;
  final int weight;
  final double bmi;
  const QuestionScreen(this.height, this.weight, this.bmi, {Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  ANSWERS _q1Value = ANSWERS.NO;
  ANSWERS _q2Value = ANSWERS.NO;
  ANSWERS _q3Value = ANSWERS.NO;
  ANSWERS _q4Value = ANSWERS.NO;
  ANSWERS _q5Value = ANSWERS.NO;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _updateModelData() async {
    MainModel mainModel = ModelHelper.getCurrentModel();
    mainModel.height = widget.height;
    mainModel.weight = widget.weight;
    mainModel.bmi = widget.bmi;
    mainModel.firstQuestion = _q1Value;
    mainModel.secondQuestion = _q2Value;
    mainModel.thirdQuestion = _q3Value;
    mainModel.fourthQuestion = _q4Value;
    mainModel.fifthQuestion = _q5Value;
    PreferenceService.getInstance().setMainModel = mainModel;
    CommunicationHandler.getInstance().emitMessage(mainModel);
    await Utils.saveAllAndGoBack(context);
  }

  Widget _buildElevatedBtn(String title) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
            ),
            onPressed: _updateModelData,
            child: Text(
              title,
            )));
  }

  Widget _buildQuestionWidget() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Question 1 '),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio<ANSWERS>(
                          value: ANSWERS.YES,
                          groupValue: _q1Value,
                          onChanged: (ANSWERS? value) {
                            setState(() {
                              _q1Value = value!;
                            });
                          },
                        ),
                        const Text('Yes'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<ANSWERS>(
                          value: ANSWERS.NO,
                          groupValue: _q1Value,
                          onChanged: (ANSWERS? value) {
                            setState(() {
                              _q1Value = value!;
                            });
                          },
                        ),
                        const Text('No'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Question 2'),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio<ANSWERS>(
                          value: ANSWERS.YES,
                          groupValue: _q2Value,
                          onChanged: (ANSWERS? value) {
                            setState(() {
                              _q2Value = value!;
                            });
                          },
                        ),
                        const Text('Yes'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<ANSWERS>(
                          value: ANSWERS.NO,
                          groupValue: _q2Value,
                          onChanged: (ANSWERS? value) {
                            setState(() {
                              _q2Value = value!;
                            });
                          },
                        ),
                        const Text('No'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Question 3'),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio<ANSWERS>(
                          value: ANSWERS.YES,
                          groupValue: _q3Value,
                          onChanged: (ANSWERS? value) {
                            setState(() {
                              _q3Value = value!;
                            });
                          },
                        ),
                        const Text('Yes'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<ANSWERS>(
                          value: ANSWERS.NO,
                          groupValue: _q3Value,
                          onChanged: (ANSWERS? value) {
                            setState(() {
                              _q3Value = value!;
                            });
                          },
                        ),
                        const Text('No'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Question 4'),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio<ANSWERS>(
                          value: ANSWERS.YES,
                          groupValue: _q4Value,
                          onChanged: (ANSWERS? value) {
                            setState(() {
                              _q4Value = value!;
                            });
                          },
                        ),
                        const Text('Yes'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<ANSWERS>(
                          value: ANSWERS.NO,
                          groupValue: _q4Value,
                          onChanged: (ANSWERS? value) {
                            setState(() {
                              _q4Value = value!;
                            });
                          },
                        ),
                        const Text('No'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Question 5'),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio<ANSWERS>(
                          value: ANSWERS.YES,
                          groupValue: _q5Value,
                          onChanged: (ANSWERS? value) {
                            setState(() {
                              _q5Value = value!;
                            });
                          },
                        ),
                        const Text('Yes'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<ANSWERS>(
                          value: ANSWERS.NO,
                          groupValue: _q5Value,
                          onChanged: (ANSWERS? value) {
                            setState(() {
                              _q5Value = value!;
                            });
                          },
                        ),
                        const Text('No'),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildQuestionWidget(),
                  _buildElevatedBtn('SAVE AND QUIT'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
