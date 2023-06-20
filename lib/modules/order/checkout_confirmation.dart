import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';

class CheckoutSummaryPage extends StatefulWidget {
  final bool isSummary;
  const CheckoutSummaryPage({Key? key, required this.isSummary})
      : super(key: key);

  @override
  State<CheckoutSummaryPage> createState() => _CheckoutSummaryPageState();
}

class _CheckoutSummaryPageState extends State<CheckoutSummaryPage> {
  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEA4262),
      Color(0xFFDD6140),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  Gradient gradient2 = const LinearGradient(
    colors: [
      Color(0xFFEA4262),
      Color(0xFFDD6140),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () async {
          confirmationSuccess(context);
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
              child: Text('Confirm',
                  style: TextStyle(
                      fontFamily: cinta,
                      fontSize: 16.sp,
                      color: white,
                      fontWeight: FontWeight.bold))),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: 120.h,
          decoration: const BoxDecoration(color: white),
          child: Padding(
            padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 41.h,
                      width: 119.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          gradient: gradient),
                      child: const Center(child: Text('Delivery')),
                    ),
                    Container(
                      height: 41.h,
                      width: 119.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: const Color(0xffe4e4e4)),
                      child: const Center(child: Text('Payment')),
                    ),
                    Container(
                      height: 41.h,
                      width: 119.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: const Color(0xffe4e4e4)),
                      child: const Center(child: Text('Summary')),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your order'),
              Container(
                height: 100.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal'),
                        Text('NGN 62500'),
                      ],
                    ),
                    8.height,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery fee'),
                        Text('NGN 5000'),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'),
                        Text('NGN 5000'),
                      ],
                    ),
                  ],
                ),
              ),
              Text('Your order'),
              Container(
                height: 100.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Olayinka ola'),
                    Text('14, Adebayo street, Surulere, Lagos state'),
                  ],
                ),
              ),
              Text('Payment method'),
              Container(
                height: 56.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Olayinka ola'),
                    Text('14, Adebayo street, Surulere, Lagos state'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  confirmationSuccess(BuildContext context) {
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
