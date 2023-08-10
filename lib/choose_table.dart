 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_reservation_app/components/reservation_card.dart';
import 'package:resto_reservation_app/models/ReservationProvider.dart';
import 'package:resto_reservation_app/services/data_fetch.dart';
import 'package:resto_reservation_app/models/table.dart';
import 'package:resto_reservation_app/services/reservation_services.dart';

class ChooseTable extends StatefulWidget {
  const ChooseTable({Key? key}) : super(key: key);

  @override
  State<ChooseTable> createState() => _ChooseTableState();
}

class _ChooseTableState extends State<ChooseTable> {

  // String? dropdownitem;
  //
  // String firstItem = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.orangeAccent,
              )),
        ),
        body: SafeArea(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Reservation Details: ', style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            letterSpacing: 2
                          ),
                          ),
                          Text("Name: ${Provider.of<ReservationProvider>(context,listen: false).getnName()}", style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              letterSpacing: 2
                          ),
                          ),
                          Text("Email: ${Provider.of<ReservationProvider>(context, listen: false).getEmail()}", style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              letterSpacing: 2
                          ),
                          ),
                          Text("Number of guests: ${Provider.of<ReservationProvider>(context, listen: false).getGuests()}", style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              letterSpacing: 2
                          ),
                          ),
                          Text("Phone number: ${Provider.of<ReservationProvider>(context, listen: false).getPhone()}", style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              letterSpacing: 2
                          ),
                          ),
                          Text("Date: ${Provider.of<ReservationProvider>(context, listen: false).getDate()}", style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              letterSpacing: 2
                          ),
                          ),
                          
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Choose a table please:', style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500
                    ),),
                    const SizedBox(height: 10,),
                    Container(
                      child: FutureBuilder(
                          future: FetchData.getTablesByDate(date: Provider.of<ReservationProvider>(context, listen: false).getDate()),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<TableModel> tables = snapshot.data!;
                              dynamic? firstItem = tables.first.id;
                              return StatefulBuilder(
                                  builder: (context, setState){
                                    return Container(
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          DropdownButton(
                                            value: firstItem,
                                            hint: Text('Choose a table'),
                                            onChanged: (value) {
                                              setState(() {
                                                firstItem = value;
                                                print(firstItem);
                                              });
                                            },
                                            items: tables
                                                .map((value) => DropdownMenuItem(
                                                value: value.id, child: Text(value.name.toString() + " (" + value.guest_number.toString() + " guests )" )))
                                                .toList(),

                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                              width: double.infinity,
                                              height: 50,
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                    backgroundColor: Colors.orangeAccent,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10))),
                                                onPressed: () {
                                                  ReservationServices.makeReservationRequest(
                                                      context: context,
                                                      user_id: Provider.of<ReservationProvider>(context,listen: false).getUserId(),
                                                      table_id: firstItem,
                                                      date: Provider.of<ReservationProvider>(context,listen: false).getDate()
                                                  );
                                                  SnackBar snackBar = const SnackBar(
                                                      content: Text(
                                                          'You have reserved your place! See you soon'));
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                },
                                                child:
                                                const Text('Make Reservation', style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                ),),
                                              )
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              );
                            }
                            return const Center(
                              child: Text('Tables'),
                            );
                          }
                      ),
                    ),

                  ],
                ),
              ),
            )
        )
    );
  }
}

// print(Provider.of<ReservationProvider>(context, listen: false)
//     .getUserId()
//     .toString() +
// "\n" +
// Provider.of<ReservationProvider>(context, listen: false).getnName() +
// "\n" +
// Provider.of<ReservationProvider>(context, listen: false).getEmail() +
// "\n" +
// Provider.of<ReservationProvider>(context, listen: false).getPhone() +
// "\n" +
// Provider.of<ReservationProvider>(context, listen: false)
//     .getGuests()
//     .toString() +
// "\n" +
// Provider.of<ReservationProvider>(context, listen: false).getDate());
