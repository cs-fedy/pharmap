import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/components/custom_text_form_field.dart';
import 'package:pharmap/components/option_card.dart';
import 'package:pharmap/models/pharmacy_type.dart';
import 'package:pharmap/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:pharmap/services/database.dart';

enum ScreenState { choose, fillPharmacy }

class OptionScreen extends StatefulWidget {
  static final String id = '/OptionScreen';
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  ScreenState _screenState = ScreenState.choose;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String pharmacyCode;
  String pharmacyName;
  String pharmacyLongitude;
  String pharmacyLatitude;
  PharmacyType pharmacyType;
  List<String> errors = [];
  bool isSigningIn = false;

  List<String> checkUserInputValidity() {
    List<String> errors = [];
    if (pharmacyCode.trim() == '') {
      errors.add('pharmacy code must be provided');
    }

    if (pharmacyName.trim() == '') {
      errors.add('pharmacy name must be provided');
    }

    if (pharmacyLongitude.trim() == '') {
      errors.add('pharmacy longitude must be provided');
    }

    if (pharmacyLatitude.trim() == '') {
      errors.add('pharmacy latitude must be provided');
    }

    if (pharmacyType == null) {
      errors.add('pharmacy type must be provided');
    }
    return errors;
  }

  void _handleSubmit() async {
    setState(() {
      errors = [];
      isSigningIn = true;
    });
    User user = Provider.of<User>(context, listen: false);
    _formKey.currentState.save();
    Database db = Database();

    List<String> userInputState = checkUserInputValidity();
    if (userInputState.isNotEmpty) {
      setState(() {
        errors.addAll(userInputState);
        isSigningIn = false;
      });
      return;
    }

    await db.addPharmacyData(
        user.uid,
        pharmacyCode,
        pharmacyName,
        double.parse(pharmacyLongitude),
        double.parse(pharmacyLatitude),
        pharmacyType == PharmacyType.day ? 'day' : 'night');
    Navigator.pushReplacementNamed(context, '/WrapperScreen');
  }

  Widget _chooseWidget() {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 15.0,
          ),
          child: SizedBox(
            width: _size.width,
            height: _size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: OptionCard(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, '/WrapperScreen'),
                    label: 'CLIENT',
                    assetPath: "assets/Svg/client.svg",
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: OptionCard(
                    onTap: () =>
                        setState(() => _screenState = ScreenState.fillPharmacy),
                    label: 'PHARMACIST',
                    assetPath: "assets/Svg/pharmacist.svg",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fillPharmacyDataWidget() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fill your pharmacy\nData to get started',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withAlpha(40),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          autovalidate: false,
                          hintText: "Pharmacy Code",
                          onSaved: (String newValue) => pharmacyCode = newValue,
                        ),
                        CustomTextFormField(
                          autovalidate: false,
                          hintText: "Pharmacy Name",
                          onSaved: (String newValue) => pharmacyName = newValue,
                        ),
                        CustomTextFormField(
                          autovalidate: false,
                          hintText: "Pharmacy Longitude",
                          onSaved: (String newValue) =>
                              pharmacyLongitude = newValue,
                        ),
                        CustomTextFormField(
                          autovalidate: false,
                          hintText: "Pharmacy Latitude",
                          onSaved: (String newValue) =>
                              pharmacyLatitude = newValue,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text('Pharmacy type'),
                  ListTile(
                    title: const Text('night'),
                    leading: Radio<PharmacyType>(
                      value: PharmacyType.night,
                      groupValue: pharmacyType,
                      onChanged: (PharmacyType value) {
                        setState(() {
                          pharmacyType = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('day'),
                    leading: Radio<PharmacyType>(
                      value: PharmacyType.day,
                      groupValue: pharmacyType,
                      onChanged: (PharmacyType value) {
                        setState(() {
                          pharmacyType = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: errors
                          .map(
                            (element) => Text(
                              element,
                              style: TextStyle(color: dangerColor),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  CustomButton(
                    text: isSigningIn? 'loading...': 'Save data',
                    bgColor: primaryColor,
                    press: isSigningIn? (){}: _handleSubmit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_screenState == ScreenState.fillPharmacy) {
      return _fillPharmacyDataWidget();
    }
    return _chooseWidget();
  }
}
