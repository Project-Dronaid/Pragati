import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack/Management/Management/provider.dart';
import 'package:provider/provider.dart';

class addTransaction extends StatefulWidget {
  const addTransaction({Key? key}) : super(key: key);

  @override
  State<addTransaction> createState() => _addTransactionState();
}

class _addTransactionState extends State<addTransaction> {
  @override
  DateTime date = new DateTime.now();
  final TextEditingController expalin_C = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
  int i=-1;
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              child: main_container(context, height,  width),
            ),
          ],
        ),
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: Color.fromRGBO(206,111,89,1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      'Adding',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }


  Container main_container(BuildContext context2,var height, var width) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 450,
      width: 340,
      child: Column(
        children: [
          SizedBox(height: 30),
          explain(),
          SizedBox(height: 30),
          amount(),
          SizedBox(height: 30),
          How( height,  width),
          SizedBox(height: 30),
          date_time(),
          Spacer(),
          save(context2),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        focusNode: ex,
        controller: expalin_C,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'explain',
          labelStyle: TextStyle(fontSize: 17, color: Color.fromRGBO(206,111,89,0.9)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,0.6))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,1))),
        ),
      ),
    );
  }

  Padding amount() {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amount_c,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'amount',
          labelStyle: TextStyle(fontSize: 17, color: Color.fromRGBO(206,111,89,0.9)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,0.6))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,1))),
        ),
      ),
    );
  }

  Padding How(var height, var width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width*0.02),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      i=1;
                    });
                  },
                  child: Container(
                    width: width*0.32,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      color: (i==1)?Colors.lightGreen:Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: (i==1)?Colors.green:Color.fromRGBO(206,111,89,0.6),
                        width: 2
                      )
                    ),
                    child: Align(
                      alignment: Alignment.center,
                        child: Text("Income", style: TextStyle(color: (i==1)?Colors.white:Color.fromRGBO(206,111,89,0.9), fontSize: width*0.045, fontWeight: FontWeight.bold),)
                    ),
                  ),
                ),

              GestureDetector(
                onTap: (){
                  setState(() {
                    i=0;
                  });
                },
                child: Container(
                  width: width*0.32,
                  height: height*0.05,
                  decoration: BoxDecoration(
                      color: (i==0)?Color(0xF1FF6E6E):Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: (i==0)?Colors.red:Color.fromRGBO(206,111,89,0.6),
                          width: 2
                      )
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("Expense", style: TextStyle(color: (i==0)?Colors.white:Color.fromRGBO(206,111,89,0.9), fontSize: width*0.045, fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget date_time() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color.fromRGBO(206,111,89,0.6))),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
          );
          if (newDate == Null) return;
          setState(() {
            date = newDate!;
          });
        },
        child: Text(
          '  ${date.day} / ${date.month} / ${date.year}',
          style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w500,
            color: Color.fromRGBO(206,111,89,1),
          ),
        ),
      ),
    );
  }

  GestureDetector save(BuildContext context2) {
    final data = Provider.of<Data>(context);
    return GestureDetector(
      onTap: () {
          if(expalin_C.text=="" || amount_c.text=="" || i==-1)
            {
              toastmessage("Please enter all the details", context2, Color.fromRGBO(206,111,89,0.8), Color.fromRGBO(206,111,89,1));
            }
          else if(int.parse(amount_c.text)<0)
            {
              toastmessage("Please enter positive amount", context2, Color.fromRGBO(206,111,89,0.8), Color.fromRGBO(206,111,89,1));
            }
          else{
            data.addTransaction(expalin_C.text, date, int.parse(amount_c.text), i);
            toastmessage("Added Succesfuly", context2, Colors.lightGreen, Colors.green);
            Navigator.pop(context);
          }

      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:  Color.fromRGBO(206,111,89,1),
        ),
        width: 220,
        height: 50,
        child: Text(
          'Save',
          style: TextStyle(
            fontFamily: 'f',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

void toastmessage(String message, BuildContext context2, Color c, Color sc) {
  var width = MediaQuery.of(context2).size.width;
  var height = MediaQuery.of(context2).size.height;
  ScaffoldMessenger.of(context2).showSnackBar(SnackBar(
    content: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(
                width: width * 0.1,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          height: height * 0.09,
          padding: EdgeInsets.all(height * 0.02),
          decoration: BoxDecoration(
              color: c, borderRadius: BorderRadius.circular(width * 0.05)),
        ),
        Positioned(
            bottom: 0,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(width * 0.05),
                ),
                child: SvgPicture.asset(
                  'assets/svg/bubbles.svg',
                  height: height * 0.06,
                  width: width * 0.9,
                  color: sc,
                ))),
        Positioned(
            top: -height * 0.01,
            child: SvgPicture.asset(
              'assets/svg/fail.svg',
              height: height * 0.033,
              color: sc,
            ))
      ],
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ));
}
