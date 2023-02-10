import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: const Text('Defacto'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:[
              Container(
                  height: 250,
                  width: double.infinity,
                  child: SvgPicture.asset('images/amico.svg')),
              Container(
                  height: 250,
                  width: double.infinity,
                  child: SvgPicture.asset('images/amico1.svg')),
              Container(
                  height: 250,
                  width: double.infinity,
                  child: SvgPicture.asset('images/amico3.svg')),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  height: 50,
                  width: double.infinity,
                  child: TextButton(onPressed:(){}, child:const Text('Continue',style: TextStyle(color: Colors.white),)))
            ],
          ),
        ),
      ),
    );
  }
}
