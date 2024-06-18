import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:intl/intl.dart';

class AttedBlock {
  final String date;
  final String punchIn;
  final String punchOut;
  final String note;

  AttedBlock({
    required this.date,
    required this.punchIn,
    required this.punchOut,
    required this.note,
  });
}

class AttedOptimised1 extends StatefulWidget {
  const AttedOptimised1({super.key});

  @override
  State<AttedOptimised1> createState() => _AttedOptimised1State();
}

class _AttedOptimised1State extends State<AttedOptimised1> {
  List<AttedBlock> items = [];
  DateTime selectedDate = DateTime.now();
  bool isPunched = false;

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
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        insertData();
      });
    }
  }

  void insertData() {
    items = List.generate(
      10,
      (i) => AttedBlock(
        date:
            "${DateFormat.d().format(selectedDate)} ${DateFormat.E().format(selectedDate)}",
        punchIn: "10:05 AM",
        punchOut: "06:10 PM",
        note: "Many desktop publishing packages and web Page",
      ),
    );
    setState(() {});
  }

  Widget _buildDateSelector() {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        width: 155,
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_back_ios, size: 10),
            const SizedBox(width: 10),
            Text(
              "${DateFormat.MMM().format(selectedDate)}-${selectedDate.year}",
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward_ios, size: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCard(AttedBlock item) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " ${DateFormat.d().format(selectedDate)} ${DateFormat.E().format(selectedDate)}",
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red, size: 12),
                Text(" ${item.punchIn}",
                    style: GoogleFonts.poppins(fontSize: 12)),
                const Spacer(),
                const Icon(Icons.location_on, color: Colors.red, size: 12),
                Text(" ${item.punchOut}",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            const SizedBox(height: 10),
            const DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Colors.grey,
              dashGapLength: 2.0,
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Text(
                " ${item.note}",
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w300),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPunchInOutContainer() {
    return Container(
      height: isPunched ? 180 : 88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isPunched
            ? const BorderRadius.vertical(top: Radius.circular(10))
            : BorderRadius.zero,
        border:
            Border(top: BorderSide(color: Colors.grey.shade300, width: 1.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: isPunched ? _buildPunchOutContent() : _buildPunchInContent(),
    );
  }

  Widget _buildPunchInContent() {
    return Center(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${DateFormat.EEEE().format(selectedDate)} ${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  "You're about to enter the office",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: () {
              setState(() {
                isPunched = true;
              });
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            child: Text('Punch In',
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.red)),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildPunchOutContent() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                "${DateFormat.EEEE().format(selectedDate)} ${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            maxLines: 1,
            maxLength: 50,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 0.5),
              ),
              labelText: 'Description',
              labelStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {
            setState(() {
              isPunched = false;
            });
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          child: Text('Punch Out',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.red)),
        ),
      ],
    );
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
                  child: Center(child: _buildDateSelector()),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.616,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) =>
                        _buildAttendanceCard(items[index]),
                  ),
                ),
                const SizedBox(height: 20),
                _buildPunchInOutContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
