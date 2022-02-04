import 'package:flutter/material.dart';
import 'package:origo_iceland_project_app/helpers/communication_handler.dart';
import 'package:origo_iceland_project_app/helpers/model_helper.dart';
import 'package:origo_iceland_project_app/helpers/util_helper.dart';
import 'package:origo_iceland_project_app/models/main_model.dart';
import 'package:origo_iceland_project_app/screens/question_page.dart';
import 'package:origo_iceland_project_app/services/preferences.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _bmiController = TextEditingController();

  double _bmiValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _updateModelData() async {
    if (_heightController.text.isNotEmpty && _weightController.text.isNotEmpty && _bmiValue != 0) {
      MainModel mainModel = ModelHelper.getCurrentModel();
      mainModel.height = int.parse(_heightController.text);
      mainModel.weight = int.parse(_weightController.text);
      mainModel.bmi = _bmiValue;
      PreferenceService.getInstance().setMainModel = mainModel;
      CommunicationHandler.getInstance().emitMessage(mainModel);
      await Utils.saveAllAndGoBack(context);
    } else {
      Utils.showErrorModal(context);
    }
  }

  void _updateBmiValue() {
    if (_heightController.text.isNotEmpty &&
        _weightController.text.isNotEmpty &&
        Utils.isNumeric(_heightController.text) &&
        Utils.isNumeric(_weightController.text)) {
      setState(() {
        _bmiValue =
            Utils.getBmiValue((double.parse(_heightController.text) / 100), double.parse(_weightController.text));
        _bmiController.text = _bmiValue.toStringAsFixed(1);
      });
    }
  }

  void _goToNextScreen() {
    if (_heightController.text.isNotEmpty && _weightController.text.isNotEmpty && _bmiValue != 0) {
      Utils.hideKeyboard(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                QuestionScreen(int.parse(_heightController.text), int.parse(_weightController.text), _bmiValue),
          ));
    } else {
      Utils.showErrorModal(context);
    }
  }

  Widget _buildFormField(String title, TextEditingController controller, [isBmiField = false]) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          TextFormField(
            onChanged: (value) {
              _updateBmiValue();
            },
            decoration: InputDecoration(
              suffixIcon: isBmiField ? null : const Icon(Icons.create),
            ),
            readOnly: isBmiField,
            controller: controller,
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedBtn(String title, [isPositiveBtn = false]) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    isPositiveBtn ? Theme.of(context).primaryColor : Theme.of(context).primaryColorLight)),
            onPressed: isPositiveBtn ? _updateModelData : _goToNextScreen,
            child: Text(
              title,
              style: TextStyle(color: isPositiveBtn ? Colors.white : Colors.black),
            )));
  }

  Widget _buildBMIWidget() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
                'BMI',
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            _buildFormField('Height', _heightController),
            _buildFormField('Weight', _weightController),
            _buildFormField('BMI', _bmiController, true),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonWrapper() {
    return Column(
      children: [
        _buildElevatedBtn('SAVE AND QUIT', true),
        _buildElevatedBtn('CONTINUE'),
      ],
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
                    _buildBMIWidget(),
                    _buildButtonWrapper(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
