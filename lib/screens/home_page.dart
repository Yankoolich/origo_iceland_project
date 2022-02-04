import 'dart:async';

import 'package:flutter/material.dart';
import 'package:origo_iceland_project_app/enums/answers.dart';
import 'package:origo_iceland_project_app/helpers/communication_handler.dart';
import 'package:origo_iceland_project_app/helpers/model_helper.dart';
import 'package:origo_iceland_project_app/models/main_model.dart';
import 'package:origo_iceland_project_app/screens/bmi_page.dart';
import 'package:origo_iceland_project_app/services/preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MainModel? _userModel;

  @override
  void initState() {
    super.initState();
    _userModel = _getModelForCurrentUser();
    ModelHelper.setCurrentModel(_userModel);
    CommunicationHandler.getInstance().getStream()!.listen((model) {
      if (mounted) {
        setState(() => _userModel = model);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _goToNextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BMIScreen(),
        ));
  }

  MainModel _getModelForCurrentUser() {
    MainModel currentUserModel = MainModel.fromJson(PreferenceService.getInstance().getMainModel);
    return currentUserModel;
  }

  Widget _buildModelRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title:'),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildModelWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Last answers:',
          style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        _buildModelRow('Height', _userModel!.height.toString()),
        _buildModelRow('Weight', _userModel!.weight.toString()),
        _buildModelRow('BMI', _userModel!.bmi.toStringAsFixed(1)),
        _buildModelRow('Q1', AnswerPicker.stringValue(_userModel!.firstQuestion)),
        _buildModelRow('Q2', AnswerPicker.stringValue(_userModel!.secondQuestion)),
        _buildModelRow('Q3', AnswerPicker.stringValue(_userModel!.thirdQuestion)),
        _buildModelRow('Q4', AnswerPicker.stringValue(_userModel!.fourthQuestion)),
        _buildModelRow('Q5', AnswerPicker.stringValue(_userModel!.fifthQuestion)),
      ],
    );
  }

  Widget _buildElevatedBtn() {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)),
            onPressed: _goToNextScreen,
            child: const Text('OPEN WIZARD')));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildModelWidget(),
              _buildElevatedBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
