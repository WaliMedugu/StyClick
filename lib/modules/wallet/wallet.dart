import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/wallet/request_withdrawal.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/utils/helpers.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFef4050),
      Color(0xFFf1552e),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefefef),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        backIcon,
                        color: Colors.black,
                        width: 24.w,
                      ),
                    ),
                  ),
                  Text(
                    'Wallet',
                    style: TextStyle(
                      color: black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              16.height,
              Container(
                height: 200.h,
                width: logicalWidth(),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(walletBg),
                      fit: BoxFit.cover,
                    ),
                    color: Color(0xff4f5052),
                    borderRadius: BorderRadius.circular(7.r)),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.w, top: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Balance',
                        style: TextStyle(
                          color: white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      16.height,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("N 9500.00",
                              style: TextStyle(
                                color: white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              )),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: white,
                            size: 16,
                          )
                        ],
                      ),
                      40.height,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                gradient: gradient,
                                borderRadius: BorderRadius.circular(25)),
                            height: 45.h,
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: white,
                                  size: 20,
                                ),
                                Text("Add funds",
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ),
                          16.width,
                          InkWell(
                            onTap: () {
                              RequestWithdrawal().launch(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffef434b), width: 2),
                                  borderRadius: BorderRadius.circular(25)),
                              height: 45.h,
                              width: 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.remove,
                                    color: white,
                                    size: 20,
                                  ),
                                  4.width,
                                  Text("Withdraw",
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              32.height,
              Text('Payment Methods',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  )),
              32.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    cardIcon,
                    height: 16,
                    width: 31,
                  ),
                  8.width,
                  Text('Card',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
              8.height,
              Divider(),
              8.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ussdIcon,
                    height: 16,
                    width: 31,
                  ),
                  8.width,
                  Text('USSD',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
              8.height,
              Divider(),
              8.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    transferIcon,
                    height: 16,
                    width: 31,
                  ),
                  8.width,
                  Text('Bank Transfer',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
              8.height,
              Divider(),
              8.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    cashIcon,
                    height: 16,
                    width: 31,
                  ),
                  8.width,
                  Text('Cash',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
