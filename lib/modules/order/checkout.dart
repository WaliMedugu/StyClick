import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEA4262),
      Color(0xFFDD6140),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  String? selectedState;
  String? selectedCity;

  List<String> states = ['State 1', 'State 2', 'State 3'];
  List<String> cities = ['City 1', 'City 2', 'City 3'];

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd1d1d1),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 17.0, right: 17,bottom: 17),
        child: InkWell(
          onTap: () async {},
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
                child: Text('Proceed to payment',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 16.sp,
                        color: white,
                        fontWeight: FontWeight.bold))),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: 100.h,
          decoration: const BoxDecoration(color: white),
          child: Padding(
            padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                32.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Checkout',
                      style: TextStyle(
                        color: Color(0xffe25350),
                        fontSize: 24.sp,
                        fontFamily: cinta,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        color: Color(0xffe25350),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: logicalWidth(),
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 16.0, left: 17, right: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 32.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          gradient: gradient),
                      child: Center(
                          child: Text(
                        'Delivery',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: cinta,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                    Container(
                      height: 32.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: const Color(0xffe4e4e4)),
                      child: Center(
                          child: Text(
                        'Payment',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontFamily: cinta,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                    Container(
                      height: 32.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: const Color(0xffe4e4e4)),
                      child: Center(
                          child: Text(
                        'Summary',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontFamily: cinta,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
            16.height,
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address details',
                      style: TextStyle(
                        color: Color(0xff898a8d),
                        fontSize: 14.sp,
                        fontFamily: cinta,
                        fontWeight: FontWeight.w500,
                      )),
                  InkWell(
                      onTap: () {
                        changeAddress(context);
                      },
                      child: Text('Change',
                          style: TextStyle(
                            color: Color(0xffef4a47),
                            fontSize: 14.sp,
                            fontFamily: cinta,
                            fontWeight: FontWeight.w700,
                          )))
                ],
              ),
            ),
            16.height,
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                height: 100,
                width: logicalWidth(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 12, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Olayinka Doe',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 14.sp,
                            fontFamily: cinta,
                            fontWeight: FontWeight.w700,
                          )),
                      8.height,
                      Text('12 abc street, lagos state',
                          style: TextStyle(
                            color: Color(0xff263238),
                            fontSize: 12.sp,
                            fontFamily: cinta,
                            fontWeight: FontWeight.w500,
                          )),
                      8.height,
                      Text('+234809678546',
                          style: TextStyle(
                            color: Color(0xff263238),
                            fontSize: 12.sp,
                            fontFamily: cinta,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, top: 16, bottom: 16),
              child: Text('Shipment details',
                  style: TextStyle(
                    color: Color(0xff898a8d),
                    fontSize: 14.sp,
                    fontFamily: cinta,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17),
              child: SizedBox(
                height: logicalHeight(),
                width: logicalWidth(),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)),
                        height: 170.h,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 12, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Package 1 of 3',
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 15.sp,
                                    fontFamily: cinta,
                                    fontWeight: FontWeight.w700,
                                  )),8.height,
                              Text('1 yard of swiss ankara',
                                  style: TextStyle(
                                    color: Color(0xff4f5052),
                                    fontSize: 13.sp,
                                    fontFamily: cinta,
                                    fontWeight: FontWeight.w500,
                                  )),8.height,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Seller:',
                                      style: TextStyle(
                                        color: Color(0xffef4a47),
                                        fontSize: 13.sp,
                                        fontFamily: cinta,
                                        fontWeight: FontWeight.w700,
                                      )),4.width,
                                  Text('Shipment stores',
                                      style: TextStyle(
                                        color: Color(0xff4f5052),
                                        fontSize: 13.sp,
                                        fontFamily: cinta,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),8.height,
                               Text(
                                  'Shipment details delivered lorem ipum lorem ipsum',
                                  style: TextStyle(
                                  color: Color(0xff4f5052),
                          fontSize: 13.sp,
                          fontFamily: cinta,
                          fontWeight: FontWeight.w500,
                        )),8.height,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Delivery fee:',
                                      style: TextStyle(
                                        color: Color(0xffef4a47),
                                        fontSize: 13.sp,
                                        fontFamily: cinta,
                                        fontWeight: FontWeight.w700,
                                      )),4.width,
                                  Text('NGN 345',
                                      style: TextStyle(
                                        color: Color(0xff4f5052),
                                        fontSize: 13.sp,
                                        fontFamily: cinta,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal'),
                      const Text('NGN 62500'),
                    ],
                  ),
                  8.height,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Delivery fee'),
                      const Text('NGN 5000'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total'),
                      const Text('NGN 5000'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  changeAddress(BuildContext context) {
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
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Change Address',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xffef4a47),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  8.height,
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: index,
                            focusColor: const Color(0xfff04a41),

                            groupValue: null, // Provide a value for groupValue
                            onChanged: (value) {},
                          ),
                          8.width,
                          const Text('1 Abc street')
                        ],
                      );
                    },
                  ),
                  InkWell(
                    onTap: () async {},
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                          // color: white,
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xffef424d), width: 2)),
                      child: Center(
                          child: Text('Add New Address',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 16.sp,
                                  color: const Color(0xfff05037),
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  InkWell(
                    onTap: () async {},
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
                          child: Text('Save Address',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 16.sp,
                                  color: white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  24.height,
                ],
              ));
        });
  }

  addAddress(BuildContext context) {
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
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Change Address',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xffef4a47),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  8.height,
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: index,
                            focusColor: const Color(0xfff04a41),

                            groupValue: null, // Provide a value for groupValue
                            onChanged: (value) {},
                          ),
                          8.width,
                          const Text('1 Abc street')
                        ],
                      );
                    },
                  ),
                  CustomTextField(
                    label: 'Full Name',
                    filledColor: const Color(0xffdedede),
                    labelColor: black,
                    hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                    hintText: 'Full name',
                  ),
                  CustomTextField(
                    label: 'New Address',
                    filledColor: const Color(0xffdedede),
                    labelColor: black,
                    hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                    hintText: 'No 12 Asombi Street, Nyanya Abuja',
                  ),
                  Row(
                    children: [
                      Expanded(
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
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: selectedState,
                                    items: states.map((state) {
                                      return DropdownMenuItem<String>(
                                        value: state,
                                        child: Text(state ?? 'Select state'),
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
                      16.width,
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'City',
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
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: selectedCity,
                                    items: cities.map((city) {
                                      return DropdownMenuItem<String>(
                                        value: city,
                                        child: Text(city),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedCity = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    label: 'Phone number',
                    filledColor: const Color(0xffdedede),
                    labelColor: black,
                    hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                    hintText: 'Phone number',
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlutterSwitch(
                        width: 48.0,
                        height: 24.0,
                        inactiveColor: const Color(0xffd1d1d1),
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
                        'Set the new address as default',
                        style: TextStyle(
                          color: const Color(0xff444343),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () async {},
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
                          child: Text('Save Address',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 16.sp,
                                  color: white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  24.height,
                ],
              ));
        });
  }
}
