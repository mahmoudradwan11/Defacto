import 'package:defacto/core/network/local/cache.dart';
import 'package:defacto/models/store_models/onboarding.dart';
import 'package:defacto/modules/screens/home.dart';
import 'package:defacto/modules/screens/login_layout.dart';
import 'package:defacto/modules/widgets/builders/defualt_botton.dart';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'images/amico.svg',
      title: 'Welcome',
      body: 'We Have a 100k+ Products. Choose Your product from our E-commerce shop.',
    ),
    BoardingModel(
        image: 'images/amico1.svg',
        title: 'Easy & safe payment',
        body: 'Easy Checkout 6 Safe Payment method. Trusted by our Customers from all over the world.'
    ),
    BoardingModel(
      image: 'images/amico3.svg',
      title: 'Track your order',
      body: 'Best Tracker has been Used For Track your order. You will know where your product is at the moment.',
    ),
  ];
  var boardController = PageController();
  var isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
            height: 450,
            child: PageView.builder(
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  physics: const BouncingScrollPhysics(),
                  controller: boardController,
                  itemBuilder: (context, index) =>builtBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
          ),
          SmoothPageIndicator(
              effect: ScrollingDotsEffect(
                dotColor: Colors.grey[300]!,
                activeDotColor:Colors.black,
                dotHeight: 10,
                dotWidth: 10,
                // expansionFactor: 4,
                spacing: 5.0,
              ),
              controller: boardController,
              count: boarding.length),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: DefaultButton(
              radius: 10,
              backgroundColor: Colors.black,
                buttonWidget:const Text('Next',style: TextStyle(color: Colors.white),), function:(){
              if (isLast) {
                submit();
              } else {
                boardController.nextPage(
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.fastLinearToSlowEaseIn);
              }
            }
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if(isLast!=true)
            Padding(
            padding: const EdgeInsets.only(left:20,right: 20,),
            child: DefaultButton(
                radius: 10,
                backgroundColor: Colors.white,
                buttonWidget:const Text('skip',style: TextStyle(color: Colors.black),),
                function:(){
                  submit();
            }
            ),
          )
        ],
      ),
    );
  }

  void submit()
  {
    CacheHelper.saveData(key:'onBoarding', value:true).then((value){
      if(value)
      {
        navigateAndFinish(context,const LoginLayout());
      }
    });
  }

  Widget builtBoardingItem(BoardingModel model) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Container(
             height: 250,
               width: double.infinity,
               child: SvgPicture.asset(model.image)),
           const SizedBox(
             height: 30,
           ),
           Text(
            model.title,
            style:const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500,color: Colors.black),
          ),
           Padding(
             padding: const EdgeInsets.all(25.0),
             child: Text(
              model.body,
              textAlign:TextAlign.center,
              style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
              ),
          ),
           ),
        ],
      );
}
