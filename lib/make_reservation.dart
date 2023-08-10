import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_reservation_app/choose_table.dart';
import 'package:resto_reservation_app/models/ReservationProvider.dart';
import 'package:resto_reservation_app/models/user.dart';
// import 'package:resto_reservation_app/services/reservation_services.dart';

class MakeReservstion extends StatefulWidget {
  @override
  State<MakeReservstion> createState() => _MakeReservstionState();
}

class _MakeReservstionState extends State<MakeReservstion> {


  // DateTime dateTime = DateTime(
  //   DateTime.now().year,
  //   DateTime.now().month,
  //   DateTime.now().day,
  //   DateTime.now().hour,
  //   DateTime.now().minute,
  // );
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _guestController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String final_date = '';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Reservation Application', style: TextStyle(color: Colors.orangeAccent),),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.orangeAccent,)),
      ),
      body: SafeArea(
          child: Form(
            key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          height: 700,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Name: ',
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _nameController,
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return 'Please enter name';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person),
                                            hintText: 'Enter your name',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10))),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Email Address: ',
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _emailController,
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return 'Please enter email';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                            hintText: 'Enter your email address',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10))),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Phone number: ',
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _phoneController,
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return 'Please enter a phone number';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.phone),
                                            hintText: 'Enter your our phone number',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10))),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'How many guests are coming?',
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _guestController,
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return 'Please enter number of guests';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.people_alt_outlined),
                                            hintText: 'Enter guests number',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10))),
                                      ),
                                      const SizedBox(height: 5,),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Choose date:',
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _dateController,
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return 'Please choose date';
                                          }
                                          return null;
                                        },
                                        onTap: () async {
                                          final date = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
                                              lastDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day + 20)
                                          );
                                          // final time = await showTimePicker(
                                          //     context: context,
                                          //     initialTime: TimeOfDay(
                                          //         hour: 20,
                                          //         minute: 0
                                          //     )
                                          // );
                                            final_date = date.toString().split(' ')[0]; //+ " " +time!.format(context).toString().split(' ')[0];
                                            // print(final_date);
                                           _dateController.text = final_date;

                                        },
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.calendar_month),
                                            hintText: 'Choose a date',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Container(
                                          width: double.infinity,
                                          height: 60,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.orangeAccent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10))),
                                            onPressed: () {
                                              if(_formKey.currentState!.validate()){
                                                Provider.of<ReservationProvider>(context, listen: false).setReservationData(
                                                  user_id: Provider.of<User>(context,listen: false).getId(),
                                                  name: _nameController.text,
                                                  email: _emailController.text,
                                                  phone: _phoneController.text,
                                                  guests: _guestController.text,
                                                  date: _dateController.text,
                                                );
                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseTable()));
                                              }
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: const [
                                                Text('Choose Table', style: TextStyle(
                                                  fontSize: 28,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold
                                                ),),
                                                Icon(Icons.arrow_forward, color: Colors.white, size: 35,)
                                              ],
                                            )
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  )
                ),
              )
          )
      ),
    );
  }
}
