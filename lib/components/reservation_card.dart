import 'package:flutter/material.dart';

class ReservationCard extends StatelessWidget {
  final String name;
  final String phone;
  final dynamic guests;
  final String email;
  final String date;

  ReservationCard({
    required this.name,
    required this.phone,
    required this.guests,
    required this.email,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Card(
          elevation: 2,
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Reservation Info: ', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 3,
                    color: Colors.orangeAccent
                ),
                  textAlign: TextAlign.center,
                ),
                Text('Reserved by $name', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    letterSpacing: 2,
                    color: Colors.grey.shade700
                ),),

                Row(
                  children: [
                    const Icon(Icons.phone_android,size: 10, color: Colors.orangeAccent,),
                    const SizedBox(width: 2,),
                    Text('Phone number: $phone', style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        letterSpacing: 2,
                        color: Colors.grey.shade700
                    ),),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.people,size: 10, color: Colors.orangeAccent,),
                    const SizedBox(width: 2,),
                    Text('$guests guest are coming', style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        letterSpacing: 2,
                        color: Colors.grey.shade700
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.email,size: 10, color: Colors.orangeAccent,),
                        const SizedBox(width: 2,),
                        Text('Email: $email',style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.grey.shade700
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month,size: 10, color: Colors.orangeAccent,),
                        const SizedBox(width: 2,),
                        Text('See you on $date', style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.grey.shade700
                        ),),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}