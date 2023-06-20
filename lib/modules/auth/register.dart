import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/modules/auth/verify_user.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';
import 'package:stylclick/shared/constants/strings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _currentStep = 0;
  final List<String> titles = ['bye', 'hello', 'hi'];
  String? selectedState;
  List<String> states = ['State 1', 'State 2', 'State 3'];
  int _curStep = 1;
  String countryCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Center(
                child: Image.asset(
                  loginLogo,
                  height: 57.h,
                  width: 184.42.w,
                ),
              ),
              16.height,
              Center(
                child: Text('Registration',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 35.sp,
                        color: black,
                        fontWeight: FontWeight.bold)),
              ),
              // SizedBox(
              //   height: 300,
              //   child: Stepper(
              //     type: StepperType.horizontal,
              //     physics: ScrollPhysics(),
              //     currentStep: _currentStep,
              //     onStepTapped: (step) => tapped(step),
              //     onStepContinue: continued,
              //     onStepCancel: cancel,
              //     steps: <Step>[
              //       Step(
              //         title: new Text('Ab'),
              //         content: Column(
              //           children: <Widget>[
              //             TextFormField(
              //               decoration:
              //                   InputDecoration(labelText: 'Email Address'),
              //             ),
              //             TextFormField(
              //               decoration: InputDecoration(labelText: 'Password'),
              //             ),
              //           ],
              //         ),
              //         isActive: _currentStep >= 0,
              //         state: _currentStep >= 0
              //             ? StepState.complete
              //             : StepState.disabled,
              //       ),
              //       Step(
              //         title: new Text('cd'),
              //         content: Column(
              //           children: <Widget>[
              //             TextFormField(
              //               decoration:
              //                   InputDecoration(labelText: 'Home Address'),
              //             ),
              //             TextFormField(
              //               decoration: InputDecoration(labelText: 'Postcode'),
              //             ),
              //           ],
              //         ),
              //         isActive: _currentStep >= 0,
              //         state: _currentStep >= 1
              //             ? StepState.complete
              //             : StepState.disabled,
              //       ),
              //       Step(
              //         title: new Text('ef'),
              //         content: Column(
              //           children: <Widget>[
              //             TextFormField(
              //               decoration:
              //                   InputDecoration(labelText: 'Mobile Number'),
              //             ),
              //           ],
              //         ),
              //         isActive: _currentStep >= 0,
              //         state: _currentStep >= 2
              //             ? StepState.complete
              //             : StepState.disabled,
              //       ),
              //       Step(
              //         title: new Text('gh'),
              //         content: Column(
              //           children: <Widget>[
              //             TextFormField(
              //               decoration:
              //                   InputDecoration(labelText: 'Mobile Number'),
              //             ),
              //           ],
              //         ),
              //         isActive: _currentStep >= 0,
              //         state: _currentStep >= 3
              //             ? StepState.complete
              //             : StepState.disabled,
              //       ),
              //     ],
              //   ),
              // ),
              // ),
              // StepProgressView(
              //     width: MediaQuery.of(context).size.width,
              //     curStep: _curStep,
              //     color: Color(0xff50AC02),
              //     titles: titles),
              16.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  label: 'Full name',
                  labelColor: black,
                  hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  hintText: 'Enter full name',
                ),
              ),
              8.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  label: 'Email',
                  labelColor: black,
                  hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  hintText: 'Enter email',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: textfieldFilledColor,
                          ),
                          child: CountryCodePicker(
                            // backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
                            onInit: (_countryCode) {
                              countryCode = _countryCode.toString();
                            },
                            flagWidth: logicalWidth() / 18,
                            initialSelection: 'NG',
                            favorite: const ['+234', 'NG'],
                            onChanged: (_countryCode) {
                              countryCode = _countryCode.toString();
                              log("New Country selected: " +
                                  countryCode.toString());
                            },
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                        ),
                      ),
                    ),
                    8.width,
                    Flexible(
                      flex: 2,
                      child: CustomTextField(
                        label: '',
                        labelColor: black,
                        hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                        hintText: 'Mobile number',
                      ),
                    ),
                  ],
                ),
              ),
              8.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'State',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: black,
                                fontFamily: cinta,
                                fontWeight: FontWeight.w500),
                          ),
                          8.height,
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffdedede),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: selectedState,
                                  items: states.map((state) {
                                    return DropdownMenuItem<String>(
                                      value: state,
                                      child: Text(state),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedState = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.width,
                    Flexible(
                      flex: 2,
                      child: CustomTextField(
                        label: 'Address',
                        labelColor: black,
                        hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                        hintText: 'Enter address',
                      ),
                    ),
                  ],
                ),
              ),

              8.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  label: 'Password',
                  labelColor: black,
                  hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  hintText: 'Enter password',
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off,
                          color: Color.fromRGBO(0, 0, 0, 1))),
                ),
              ),
              8.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  label: 'Confirm password',
                  labelColor: black,
                  hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  hintText: 'Enter password',
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off,
                          color: Color.fromRGBO(0, 0, 0, 1))),
                ),
              ),
              8.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  label: 'Referral Code',
                  labelColor: black,
                  hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  hintText: 'Enter Referral Code',
                ),
              ),
              8.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('If someone referred you enter their code here',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        fontStyle: FontStyle.italic,
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        fontWeight: FontWeight.w300)),
              ),
              16.height,
              InkWell(
                onTap: () {
                  VerifyUser().launch(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                        // color: white,
                        borderRadius: BorderRadius.circular(9),
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [primary, primaryGradient],
                        )),
                    child: Center(
                        child: Text('Sign up',
                            style: TextStyle(
                                fontFamily: cinta,
                                fontSize: 16.sp,
                                color: white,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              16.height,
              InkWell(
                onTap: () {
                  const LoginScreen().launch(context);
                },
                child: Center(
                  child: Text('Already have an account ? Sign In',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 16.sp,
                          color: signupTextColor,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              16.height
            ],
          ),
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}

class CircularStepper extends StatefulWidget {
  final int currentStep;
  final List<Step> steps;

  const CircularStepper({
    required this.currentStep,
    required this.steps,
  });

  @override
  _CircularStepperState createState() => _CircularStepperState();
}

class _CircularStepperState extends State<CircularStepper> {
  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: widget.currentStep,
      steps: widget.steps,
      // controlsBuilder: (BuildContext context,
      //     {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
      //   return const SizedBox.shrink();
      // },
      physics: const NeverScrollableScrollPhysics(),
      type: StepperType.horizontal,
    );
  }
}

class StepItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const StepItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class StepProgressView extends StatelessWidget {
  final double _width;

  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = black;
  final double lineWidth = 3.0;

  StepProgressView(
      {Key? key,
      required int curStep,
      List<String>? titles,
      required double width,
      required Color color})
      : _titles = titles ?? [],
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        assert(width > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this._width,
        child: Column(
          children: <Widget>[
            Row(
              children: _iconViews(),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _titleViews(),
            ),
          ],
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, icon) {
      var circleColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
      var iconColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

      list.add(
        Container(
          width: 20.0,
          height: 20.0,
          padding: const EdgeInsets.all(0),
          decoration: new BoxDecoration(
            /* color: circleColor,*/
            borderRadius: new BorderRadius.all(new Radius.circular(22.0)),
            border: new Border.all(
              color: circleColor,
              width: 2.0,
            ),
          ),
          child: Icon(
            Icons.circle,
            color: iconColor,
            size: 12.0,
          ),
        ),
      );

      //line between icons
      if (i != _titles.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineWidth,
          color: lineColor,
        )));
      }
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      list.add(Text(text, style: const TextStyle(color: black)));
    });
    return list;
  }
}
