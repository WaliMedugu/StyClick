import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class FabricSellerDetails extends StatefulWidget {
  final int? selectedIndex;
  final String businessName;
  const FabricSellerDetails(
      {Key? key, required this.businessName, this.selectedIndex = 0})
      : super(key: key);

  @override
  State<FabricSellerDetails> createState() => _FabricSellerDetailsState();
}

class _FabricSellerDetailsState extends State<FabricSellerDetails>
    with SingleTickerProviderStateMixin {
  TabController? tabcontroller;

  final List<Map<String, String>> _products = [
    {'name': 'Swiss Lace', 'price': 'NGN 3,500/yd', 'tag': 'Lace'},
    {'name': 'Ankara Print', 'price': 'NGN 2,200/yd', 'tag': 'Ankara'},
    {'name': 'Aso-oke Special', 'price': 'NGN 8,000/yd', 'tag': 'Aso-oke'},
    {'name': 'Brocade Fabric', 'price': 'NGN 4,100/yd', 'tag': 'Lace'},
    {'name': 'Chiffon Silk', 'price': 'NGN 5,000/yd', 'tag': 'Ankara'},
    {'name': 'Aso-oke Gold', 'price': 'NGN 12,000/yd', 'tag': 'Aso-oke'},
  ];

  List<Map<String, String>> _filtered(String tab) {
    if (tab == 'All') return _products;
    return _products.where((p) => p['tag'] == tab).toList();
  }

  @override
  void initState() {
    tabcontroller = TabController(length: 4, vsync: this);
    tabcontroller!.animateTo(widget.selectedIndex!);
    super.initState();
  }

  @override
  void dispose() {
    tabcontroller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Gradient header ──────────────────────────────────────
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(gradient: brandGradient),
              padding: EdgeInsets.only(
                  left: 17.w, right: 17.w, top: 16.h, bottom: 24.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(backIcon, width: 24.w,
                        color: Colors.white),
                  ),
                  20.width,
                  Text(
                    widget.businessName,
                    style: GoogleFonts.montserrat(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),

            // ── Scrollable body ──────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner image
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 17.w, vertical: 16.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(bizImage,
                            width: double.infinity,
                            height: 160.h,
                            fit: BoxFit.cover),
                      ),
                    ),

                    // Avatar + Chat button
                    Padding(
                      padding:
                          EdgeInsets.only(left: 26.w, right: 17.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: white, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: ink.withOpacity(0.1),
                                    blurRadius: 8)
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(profileIcon),
                            ),
                          ),
                          InkWell(
                            onTap: () => _chatStylist(context),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primary.withOpacity(0.1),
                                border: Border.all(
                                    color: primary.withOpacity(0.3)),
                              ),
                              padding: EdgeInsets.all(10.w),
                              child: Image.asset(chatIcon,
                                  height: 18.h,
                                  width: 18.w,
                                  color: primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.height,

                    // Seller info
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.businessName,
                            style: GoogleFonts.montserrat(
                                fontSize: 18.sp,
                                color: ink,
                                fontWeight: FontWeight.w900),
                          ),
                          8.height,
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: locationIconColor, size: 14.sp),
                              4.width,
                              Text('Garki, Abuja',
                                  style: TextStyle(
                                      fontFamily: cinta,
                                      fontSize: 13.sp,
                                      color: textLight)),
                              16.width,
                              Image.asset(clock, height: 14, width: 14),
                              4.width,
                              Text('3y 3m on Styclick',
                                  style: TextStyle(
                                      fontFamily: cinta,
                                      fontSize: 12.sp,
                                      color: textLight)),
                            ],
                          ),
                          8.height,
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: 4.5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 14,
                                ignoreGestures: true,
                                itemBuilder: (context, _) => const Icon(
                                    Icons.star_rounded,
                                    color: Colors.amber),
                                onRatingUpdate: (_) {},
                              ),
                              8.width,
                              Text('4.5 (13 Reviews)',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 11.sp, color: textLight)),
                            ],
                          ),
                          16.height,
                          Divider(color: sand),
                          16.height,

                          // Products tab label
                          Text('PRODUCTS',
                              style: GoogleFonts.montserrat(
                                  fontSize: 11.sp,
                                  color: textLight,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.5)),
                          12.height,

                          // Tab bar
                          Container(
                            height: 44.h,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: sand),
                            ),
                            child: TabBar(
                              controller: tabcontroller,
                              labelStyle: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700),
                              unselectedLabelStyle: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500),
                              labelColor: white,
                              unselectedLabelColor: textLight,
                              indicator: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [primary, primaryGradient]),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              dividerColor: Colors.transparent,
                              tabs: const [
                                Tab(text: 'All'),
                                Tab(text: 'Ankara'),
                                Tab(text: 'Lace'),
                                Tab(text: 'Aso-oke'),
                              ],
                            ),
                          ),
                          16.height,
                        ],
                      ),
                    ),

                    // Tab content — product grid
                    SizedBox(
                      height: 480.h,
                      child: TabBarView(
                        controller: tabcontroller,
                        children: ['All', 'Ankara', 'Lace', 'Aso-oke']
                            .map((tab) => _buildProductGrid(tab))
                            .toList(),
                      ),
                    ),
                    32.height,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(String tab) {
    final items = _filtered(tab);
    if (items.isEmpty) {
      return Center(
        child: Text('No $tab products yet',
            style: TextStyle(
                fontFamily: cinta, fontSize: 14.sp, color: textLight)),
      );
    }
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 9 / 13,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final product = items[index];
        return Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: sand),
            boxShadow: [
              BoxShadow(
                  color: ink.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 3))
            ],
          ),
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(maleAsoebi, fit: BoxFit.cover),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: white, shape: BoxShape.circle),
                          padding: EdgeInsets.all(6.w),
                          child: Image.asset(favoriteIcon,
                              height: 14.h, width: 14.w, color: primary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.height,
              Text(
                product['name']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: cinta,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: ink),
              ),
              4.height,
              Text(
                product['price']!,
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    color: primary,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        );
      },
    );
  }

  void _chatStylist(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r)),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: cream,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Chat Seller',
                  style: GoogleFonts.montserrat(
                      fontSize: 20.sp,
                      color: primary,
                      fontWeight: FontWeight.w900)),
              16.height,
              Text('Upload Image',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: ink,
                      fontFamily: cinta,
                      fontWeight: FontWeight.w500)),
              8.height,
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                dashPattern: const [8, 4],
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    decoration: const BoxDecoration(color: uploadBtnColor),
                    height: 48.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(uploadIcon, height: 24.h, width: 24.w),
                        8.width,
                        Text('Upload image',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: uploadTextColor,
                                fontFamily: cinta,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              16.height,
              CustomTextField(
                label: 'Message',
                labelColor: ink,
                hintTextColor: const Color.fromRGBO(0, 0, 0, 0.4),
                hintText: 'Ask about fabric availability, pricing...',
                maxLines: 4,
              ),
              24.height,
              InkWell(
                onTap: () {},
                child: Container(
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    gradient: const LinearGradient(
                        colors: [primary, primaryGradient]),
                  ),
                  child: Center(
                    child: Text('Send message',
                        style: TextStyle(
                            fontFamily: cinta,
                            fontSize: 16.sp,
                            color: white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              24.height,
            ],
          ),
        );
      },
    );
  }
}
