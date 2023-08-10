import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_reservation_app/components/reservation_card.dart';
import 'package:resto_reservation_app/make_reservation.dart';
import 'package:resto_reservation_app/models/ReservationProvider.dart';
import 'package:resto_reservation_app/models/my_reservation.dart';
import 'package:resto_reservation_app/services/reservation_services.dart';

class ReservationNavPage extends StatefulWidget {
  const ReservationNavPage({Key? key}) : super(key: key);

  @override
  State<ReservationNavPage> createState() => _ReservationNavPageState();
}

class _ReservationNavPageState extends State<ReservationNavPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reservation History'),
          elevation: 0,
          backgroundColor: Colors.orangeAccent,
          leading: IconButton(onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => super.widget));
          }, icon: Icon(Icons.history))
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.large(
              backgroundColor: Colors.orangeAccent,
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MakeReservstion()));
              }),
        ),
        body: SafeArea(
            child: FutureBuilder(
              future: ReservationServices.getMyReservations(),
                builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasData){
                  List<ReservationData> reservations = snapshot.data!;
                  return RefreshIndicator(
                    onRefresh: () async {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => super.widget));
                    },
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:  reservations.length,
                        itemBuilder: (context, index){
                        return ReservationCard(
                            name: reservations[index].name.toString(),
                            phone: reservations[index].phone.toString(),
                            guests: reservations[index].guests,
                            email: reservations[index].email.toString(),
                            date: reservations[index].date.toString()
                        );
                        }
                    ),
                  );
                }
                return const Center(child: Text('Reservations'),);
                }
            ),
        ),
      ),
    );
  }
}
// Provider.of<ReservationProvider>(context, listen: false)
//     .reservations
//     .isEmpty
// ? const Center(
// child:  Text('No Reservations yet'),
// )
//     : Consumer<ReservationProvider>(builder: (context, data, child) {
// return ListView.builder(
// itemCount: Provider.of<ReservationProvider>(context, listen: false).getReservationInfoLength(),
// itemBuilder: (context, index) {
// return data.reservations[index];
// });
// })