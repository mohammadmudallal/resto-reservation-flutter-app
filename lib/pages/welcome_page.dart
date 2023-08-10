import 'package:flutter/material.dart';
import 'package:resto_reservation_app/pages/registration_page.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/welcome.png'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Make Your Reservation Now!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontStyle: FontStyle.italic),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text('View our menus, and make your reservation in advance',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54,
            ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 80,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                 Text('Get Started', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_forward_ios, color: Colors.white,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
