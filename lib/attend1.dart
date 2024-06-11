import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:intl/intl.dart';

class AttedBlock {
  late String date;
  late String punchIn;
  late String punchOut;
  late String note;

  AttedBlock({
    required this.date,
    required this.punchIn,
    required this.punchOut,
    required this.note,
  });
}

class Atted1 extends StatefulWidget {
  const Atted1({super.key});

  @override
  State<Atted1> createState() => _atted1State();
}

class _atted1State extends State<Atted1> {
  List<AttedBlock> items = [];
  DateTime selectedDate = DateTime.now();
  bool is_punched = false;

  @override
  void initState() {
    super.initState();
    insertData();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.day, //1st day will selected
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void insertData() {
    List<AttedBlock> tempItems = List.generate(10, (index) {
      return AttedBlock(
        // date: "${DateFormat.MMM().format(selectedDate)}-${selectedDate.year}",
        date:
            "${DateFormat.d().format(selectedDate)} ${DateFormat.E().format(selectedDate)}",
        punchIn: "10:05 AM",
        punchOut: "06:10 PM",
        note: "Many desktop publishing packages and web Page",
      );
    });

    setState(() {
      items = tempItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        width: 155,
                        padding: EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 10,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${DateFormat.MMM().format(selectedDate)}-${selectedDate.year}",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.616,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Container(
                        width: 200,
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    " ${DateFormat.d().format(selectedDate)} ${DateFormat.E().format(selectedDate)}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 12,
                                    ),
                                    Text(
                                      " ${DateFormat.jm().format(DateTime.now())}",
                                      style: GoogleFonts.poppins(fontSize: 12),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 12,
                                    ),
                                    Text(
                                      " ${item.punchOut}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DottedLine(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.center,
                                  lineLength: double.infinity,
                                  lineThickness: 1.0,
                                  dashLength: 4.0,
                                  dashColor: Colors.grey.shade300,
                                  dashRadius: 0.0,
                                  dashGapLength: 2.0,
                                  dashGapColor: Colors.transparent,
                                  dashGapRadius: 0.0,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Flexible(
                                  child: Text(
                                    " ${item.note}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    selectionColor: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),

                // yha se punch in start

                is_punched
                    ? Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3) // changes position of shadow
                                ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${DateFormat.EEEE().format(selectedDate)}   ${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              height: 60, // Set the height to 50
                              child: TextField(
                                // controller: _controller,
                                maxLines: 1,
                                maxLength: 50,

                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 221, 40, 40),
                                      width: 17,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 0.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                      width: 0.5,
                                    ),
                                  ),
                                  labelText: 'Description',
                                  labelStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color: Colors.red), // Outline color
                                backgroundColor:
                                    Colors.white, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25), // Rounded corners
                                ),
                              ),
                              child: Text(
                                'Punch Out',
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: Colors.red),
                              ),
                            ),
                          ],
                        ))
                    : Container(
                        height: 88,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3) // changes position of shadow
                                ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${DateFormat.EEEE().format(selectedDate)}   ${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "You'r about to enter the office",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              OutlinedButton(
                                onPressed: () {
                                  is_punched = true;
                                  setState(() {});
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: Colors.red), // Outline color
                                  backgroundColor:
                                      Colors.white, // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25), // Rounded corners
                                  ),
                                ),
                                child: Text(
                                  'Punch In',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Colors.red),
                                ),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),

                // SizedBox(height: 20.5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
