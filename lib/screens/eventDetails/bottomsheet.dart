import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Helperwidgets {
  static void showCustomModalBottomSheet(BuildContext context) {
    final ValueNotifier<int> vipCountNotifier = ValueNotifier<int>(0);
    final ValueNotifier<int> balCountNotifier = ValueNotifier<int>(0);
    final ValueNotifier<int> floCountNotifier = ValueNotifier<int>(0);

    final TextEditingController vipController = TextEditingController();
    final TextEditingController balController = TextEditingController();
    final TextEditingController floController = TextEditingController();
    final ScrollController scrollController = ScrollController();
    final FocusNode focusNode = FocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 200), () {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      }
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: 440,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Harmony Nights',
                                  style: GoogleFonts.outfit(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/images/Group.svg'),
                                    const SizedBox(width: 7),
                                    Text(
                                      '06:30 PM, 17 Oct 2024',
                                      style: GoogleFonts.outfit(
                                        color: Colors.black,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/images/loc.svg'),
                                    const SizedBox(width: 7),
                                    Text(
                                      'Old Harbour Hotel, Fort Kochi',
                                      style: GoogleFonts.outfit(
                                        color: Colors.black,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: SvgPicture.asset('assets/images/pop.svg'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 21),
                        Text(
                          'Select Tickets',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/seats.svg'),
                            const SizedBox(width: 10),
                            Text(
                              'VIP Seating',
                              style: GoogleFonts.outfit(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 50),
                            Text(
                              '23.00',
                              style: GoogleFonts.outfit(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 40),
                            CounterColumn(
                              title: "VIP Count",
                              valueNotifier: vipCountNotifier,
                              controller: vipController,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/seats.svg'),
                            const SizedBox(width: 10),
                            Text(
                              'Balcony Seating',
                              style: GoogleFonts.outfit(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 21),
                            Text(
                              '25.00',
                              style: GoogleFonts.outfit(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 40),
                            CounterColumn(
                              title: "BAL Count",
                              valueNotifier: balCountNotifier,
                              controller: balController,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/seats.svg'),
                            const SizedBox(width: 10),
                            Text(
                              'Floor Seating',
                              style: GoogleFonts.outfit(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 39),
                            Text(
                              '25.00',
                              style: GoogleFonts.outfit(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 40),
                            CounterColumn(
                              title: "FLO Count",
                              valueNotifier: floCountNotifier,
                              controller: floController,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            // print('bookmyticket');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(44, 100, 227, 1),
                                borderRadius: BorderRadius.circular(35)),
                            width: 360,
                            height: 60,
                            child: Center(
                              child: Text(
                                'Book My Ticket',
                                style: GoogleFonts.outfit(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}

class CounterColumn extends StatelessWidget {
  final String title;
  final ValueNotifier<int> valueNotifier;
  final TextEditingController controller;

  const CounterColumn({
    required this.title,
    required this.valueNotifier,
    required this.controller,
    super.key,
  });

  void _increment() {
    valueNotifier.value++;
    controller.text = valueNotifier.value.toString();
  }

  void _decrement() {
    if (valueNotifier.value > 0) {
      valueNotifier.value--;
      controller.text = valueNotifier.value.toString();
    }
  }

  void _onTextChanged(String value) {
    if (value.isNotEmpty) {
      valueNotifier.value = int.tryParse(value) ?? 0;
    } else {
      valueNotifier.value = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _decrement,
          child: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
        ),
        ValueListenableBuilder<int>(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            return SizedBox(
              width: 50,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: controller,
                keyboardType: TextInputType.number,
                onChanged: _onTextChanged,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "0",
                ),
              ),
            );
          },
        ),
        GestureDetector(
          onTap: _increment,
          child: const Icon(
            Icons.arrow_drop_up_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
