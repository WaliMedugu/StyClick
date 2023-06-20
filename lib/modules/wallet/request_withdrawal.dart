import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';

import '../../shared/widgets/custom_textfield.dart';

class RequestWithdrawal extends StatefulWidget {
  const RequestWithdrawal({Key? key}) : super(key: key);

  @override
  State<RequestWithdrawal> createState() => _RequestWithdrawalState();
}

class _RequestWithdrawalState extends State<RequestWithdrawal> {
  bool status = false;
  String? selectedBank;
  List<String> banks = ['Bank 1', 'Bank 2', 'Bank 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefefef),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.height,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      backIcon,
                      color: black,
                      width: 24.w,
                    ),
                  ),
                  8.width,
                  Text(
                    'Request Withdrawal',
                    style: TextStyle(
                      color: black,
                      fontFamily: cinta,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              16.height,
              Text(
                'Note',
                style: TextStyle(
                  color: Color(0xffef4a47),
                  fontSize: 12.sp,
                  fontFamily: cinta,
                  fontWeight: FontWeight.bold,
                ),
              ),
              8.height,
              Text(
                'lorem ipsum lorem ipsum',
                style: TextStyle(
                  color: Color(0xff444343),
                  fontSize: 13.sp,
                  fontFamily: cinta,
                  fontWeight: FontWeight.w400,
                ),
              ),
              24.height,
              CustomTextField(
                hintTextColor: homeSearchHintColor,
                hintText: 'Payout amount',
                filledColor: Colors.white,
                label: 'Payout amount (NGN)',
                fontWeight: FontWeight.w700,
                borderRadius: BorderRadius.circular(5.r),
              ),
              16.height,
              Text(
                'Bank Name',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: black,
                    fontFamily: cinta,
                    fontWeight: FontWeight.w700),
              ),
              8.height,
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffdedede),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: DropdownButton<String>(
                      value: selectedBank,
                      isExpanded: true,
                      items: banks.map((bank) {
                        return DropdownMenuItem<String>(
                          value: bank,
                          child: Text(bank ?? 'Select bank'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedBank = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              16.height,
              CustomTextField(
                hintTextColor: homeSearchHintColor,
                hintText: 'Account Number',
                filledColor: Colors.white,
                label: 'Account Number',
                fontWeight: FontWeight.w700,
                borderRadius: BorderRadius.circular(5.r),
              ),
              16.height,
              CustomTextField(
                hintTextColor: homeSearchHintColor,
                hintText: 'Account Name',
                filledColor: Colors.white,
                label: 'Account Name',
                fontWeight: FontWeight.w700,
                borderRadius: BorderRadius.circular(5.r),
              ),
              16.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterSwitch(
                    width: 48.0,
                    height: 24.0,
                    inactiveColor: Color(0xffd1d1d1),
                    toggleSize: 16.0,
                    value: status,
                    borderRadius: 30.0,
                    padding: 4.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                  ),
                  8.width,
                  Text(
                    'Set as automatic withdrawal',
                    style: TextStyle(
                      color: Color(0xff444343),
                      fontSize: 13.sp,
                      fontFamily: cinta,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              32.height,
              InkWell(
                onTap: () async {
                  requestSuccess(context);
                },
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                      // color: white,
                      borderRadius: BorderRadius.circular(9),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [primary, primaryGradient],
                      )),
                  child: Center(
                      child: Text('Request withdrawal',
                          style: TextStyle(
                              fontFamily: cinta,
                              fontSize: 16.sp,
                              color: white,
                              fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  requestSuccess(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
        ),
        builder: (BuildContext context) {
          return Container(
              height: logicalHeight() * 0.35,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  32.height,
                  32.height,
                  Center(
                    child: Text('Successful',
                        style: TextStyle(
                            fontFamily: cinta,
                            fontSize: 24.sp,
                            color: successColor,
                            fontWeight: FontWeight.bold)),
                  ),
                  8.height,
                  Center(
                    child: Text(
                      'Lorem ipsum lorem lorem ipsum',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  24.height,
                ],
              ));
        });
  }
}
