import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefefef),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.w),
                    child: Image.asset(
                      backIcon,
                      color: Colors.black,
                      width: 24.w,
                    ),
                  ),
                ),
                8.width,
                Text(
                  'Transaction History',
                  style: TextStyle(
                    color: black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            // 16.height,
            Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w),
              child: CustomTextField(
                  hintTextColor: homeSearchHintColor,
                  hintText: 'Search ',
                  filledColor: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  prefixIcon: const Icon(Icons.search)),
            ),
            SizedBox(
              height: logicalHeight(),
              width: logicalWidth(),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      color: white,
                      height: 64.h,
                      width: logicalWidth(),
                      child: Row(
                        children: [
                          // Color(0xfffff3e8) debit color
                          20.width,
                          CircleAvatar(
                            backgroundColor: const Color(0xffe8ffed),
                            child: Image.asset(
                              creditIcon,
                              height: 16,
                              width: 16,
                            ),
                          ),
                          8.width,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fund your wallet',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '28th April 09:23am',
                                    style: TextStyle(
                                      color: const Color(0xff6e6e6e),
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  4.width,
                                  Text(
                                    'successful',
                                    style: TextStyle(
                                      color: const Color(0xff37b34a),
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '+20,000NGN',
                            style: TextStyle(
                              color: const Color(0xff37b34a),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          16.width,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
