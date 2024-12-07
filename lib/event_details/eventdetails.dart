import 'package:events/screens/booking_screen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:readmore/readmore.dart';

class EventDetails extends StatelessWidget {
  EventDetails({super.key});

  final List<String> imageAvatar = [
    'assets/images/Ellipse 2.jpg',
    'assets/images/Ellipse 3.jpg',
    'assets/images/Ellipse 4.jpg'
  ];

  final String content =
      'viverra venenatis non faucibus quam tortor. nulla, cursus Donec eget sit placerat Cras Lorem sollicitudin. lacus, In Sed In';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
              ),
              builder: (context) {
                return SizedBox(
                  height: 440,
                  width: 402,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25, top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Harmony Nights',
                                        style: GoogleFonts.outfit(
                                            color: Colors.black,
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/Group.svg'),
                                          SizedBox(width: 7.w),
                                          Text(
                                            '06:30 PM, 17 Oct 2024',
                                            style: GoogleFonts.outfit(
                                                color: Colors.black,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/loc.svg'),
                                          SizedBox(width: 7.w),
                                          Text(
                                            'Old Harbour Hotel, Fort Kochi',
                                            style: GoogleFonts.outfit(
                                                color: Colors.black,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: SvgPicture.asset(
                                          'assets/images/pop.svg'),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 21,
                              ),
                              Text(
                                'Select Tickets',
                                style: GoogleFonts.outfit(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 9),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/seats.svg'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'VIP Seating',
                                          style: GoogleFonts.outfit(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          '25.00',
                                          style: GoogleFonts.outfit(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(width: 30),
                                        InputQty(
                                          maxVal: 100,
                                          initVal: 1,
                                          minVal: 0,
                                          steps: 1,
                                          onQtyChanged: (val) {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/seats.svg'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Balcony Seating',
                                        style: GoogleFonts.outfit(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 18),
                                      Text(
                                        '25.00',
                                        style: GoogleFonts.outfit(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 30),
                                      InputQty(
                                        maxVal: 100,
                                        initVal: 1,
                                        minVal: 0,
                                        steps: 1,
                                        onQtyChanged: (val) {},
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 5),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/seats.svg'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Floor Seats',
                                          style: GoogleFonts.outfit(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 45,
                                        ),
                                        Text(
                                          '25.00',
                                          style: GoogleFonts.outfit(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(width: 30),
                                        InputQty(
                                          maxVal: 100,
                                          initVal: 1,
                                          minVal: 0,
                                          steps: 1,
                                          onQtyChanged: (val) {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen(),));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              44, 100, 227, 1),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      width: 360,
                                      height: 60,
                                      child: Center(
                                        child: Text(
                                          'Book My Ticket',
                                          style: GoogleFonts.outfit(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14.sp),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                );
              },
            );
          },
          backgroundColor: Colors.blue[800],
          label: Text(
            'Book Now',
            style: GoogleFonts.outfit(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp),
          ),
        ),
      ),
     body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 352.h,
              width: 402.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/eventImage.png'),
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 30),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.4.h),
                    child: Container(
                      width: 397.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(49),
                            bottomRight: Radius.circular(48)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 94, 92, 92)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Container(
                                    width: 90.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  255, 138, 134, 134)
                                              .withOpacity(0.3),
                                          spreadRadius: 5,
                                          blurRadius: 0,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        '1k+ attending',
                                        style: GoogleFonts.outfit(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Container(
                                    width: 90.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  255, 138, 134, 134)
                                              .withOpacity(0.3),
                                          spreadRadius: 5,
                                          blurRadius: 0,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Music',
                                        style: GoogleFonts.outfit(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: SvgPicture.asset(
                                    'assets/images/Vector.svg'))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harmony Nights',
                          style: GoogleFonts.outfit(
                              color: Colors.black,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/Group.svg'),
                            SizedBox(width: 7.w),
                            Text(
                              '06:30 PM, 17 Oct 2024',
                              style: GoogleFonts.outfit(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/loc.svg'),
                            SizedBox(width: 7.w),
                            Text(
                              'Old Harbour Hotel, Fort Kochi',
                              style: GoogleFonts.outfit(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < 3; i++)
                              Align(
                                widthFactor: 0.5,
                                child: CircleAvatar(
                                  radius: 13.r,
                                  backgroundImage: AssetImage(imageAvatar[i]),
                                ),
                              ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '1k+ attending',
                              style: GoogleFonts.outfit(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Ellipse 1.jpg'),
                      ),
                      title: Text(
                        'Beyoncé’s',
                        style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        'Event Organizer',
                        style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 73.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'Follow',
                              style: GoogleFonts.outfit(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      )),
                  Text(
                    'About this event',
                    style: GoogleFonts.outfit(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  ReadMoreText(
                    content,
                    trimLines: 3,
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'read more',
                    trimExpandedText: 'read less',
                    lessStyle: GoogleFonts.outfit(
                        color: Colors.indigo,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300),
                    moreStyle: GoogleFonts.outfit(
                        color: Colors.indigo,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300),
                    style: GoogleFonts.outfit(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: GestureDetector(
                        onTap: () {
                          print('map');
                        },
                        child: Container(
                            width: 360.w,
                            height: 140.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                                Image.asset('assets/images/Mask group.jpg'))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 5.w),
                    child: Text(
                      'Featured Events',
                      style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Container(
                      width: 360.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/soundwave.png'),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16.w, top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Container(
                                        width: 90.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      255, 138, 134, 134)
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 0,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            '1k+ attending',
                                            style: GoogleFonts.outfit(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Container(
                                        width: 90.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      255, 138, 134, 134)
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 0,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Music',
                                            style: GoogleFonts.outfit(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: SvgPicture.asset(
                                        'assets/images/Vector.svg'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 9.3.h),
                            child: Container(
                              height: 50.h,
                              width: 310.w,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 94, 92, 92)
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 0,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w, top: 2.h, right: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Soundwave Sessions',
                                          style: GoogleFonts.outfit(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15.sp),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.white,
                                              size: 19.r,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              'Kochi • 17 Oct 2024',
                                              style: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Container(
                      width: 360.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/soundwave.png'),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16.w, top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Container(
                                        width: 90.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      255, 138, 134, 134)
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 0,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            '1k+ attending',
                                            style: GoogleFonts.outfit(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Container(
                                        width: 90.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      255, 138, 134, 134)
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 0,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Music',
                                            style: GoogleFonts.outfit(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: SvgPicture.asset(
                                        'assets/images/Vector.svg'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 9.5.h),
                            child: Container(
                              height: 50.h,
                              width: 310.w,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 94, 92, 92)
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 0,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w, top: 2.h, right: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Soundwave Sessions',
                                          style: GoogleFonts.outfit(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15.sp),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.white,
                                              size: 19.r,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              'Kochi • 17 Oct 2024',
                                              style: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Container(
                      width: 360.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/soundwave.png'),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16.w, top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Container(
                                        width: 90.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      255, 138, 134, 134)
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 0,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            '1k+ attending',
                                            style: GoogleFonts.outfit(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Container(
                                        width: 90.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      255, 138, 134, 134)
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 0,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Music',
                                            style: GoogleFonts.outfit(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: SvgPicture.asset(
                                        'assets/images/Vector.svg'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 9.5.h),
                            child: Container(
                              height: 50.h,
                              width: 310.w,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 94, 92, 92)
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 0,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w, top: 2.h, right: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Soundwave Sessions',
                                          style: GoogleFonts.outfit(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15.sp),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.white,
                                              size: 19.r,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              'Kochi • 17 Oct 2024',
                                              style: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}