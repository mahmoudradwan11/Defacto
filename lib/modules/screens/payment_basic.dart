import 'package:defacto/core/controllers/payment/payment_cubit.dart';
import 'package:defacto/core/controllers/payment/payment_states.dart';
import 'package:defacto/modules/screens/visa.dart';
import 'package:defacto/modules/widgets/builders/default_form_feild.dart';
import 'package:defacto/modules/widgets/builders/defualt_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PaymentBasic extends StatelessWidget {
  var price;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  PaymentBasic({Key? key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
      if (state is GetPaymentRequestSuccess) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VisaScreen(),
            ));
      }
    }, builder: (context, state) {
      var cubit = PaymentCubit.get(context);
      priceController.text = price.toString();
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Payment With Defacto',
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        width: 500,
                        child: const Image(
                          fit: BoxFit.contain,
                          image: AssetImage('images/visa.png'),
                        )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Your Info',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey[200],
                    child: defaultFieldForm(
                        show: false,
                        controller: firstNameController,
                        keyboard: TextInputType.text,
                        hint: 'Fisrt Name',
                        prefix: Icons.person,
                        valid: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter First Name';
                          }
                          return null;
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey[200],
                    child: defaultFieldForm(
                        show: false,
                        controller: lastNameController,
                        keyboard: TextInputType.text,
                        hint: 'Last Name',
                        prefix: Icons.person,
                        valid: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Last Name';
                          }
                          return null;
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey[200],
                    child: defaultFieldForm(
                        show: false,
                        controller: phoneController,
                        keyboard: TextInputType.phone,
                        hint: 'Phone Number',
                        prefix: Icons.phone_android,
                        valid: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Phone';
                          }
                          return null;
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey[200],
                    child: defaultFieldForm(
                        show: false,
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        hint: 'email',
                        prefix: Icons.email,
                        valid: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Email';
                          }
                          return null;
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey[200],
                    child: defaultFieldForm(
                        show: false,
                        controller: priceController,
                        keyboard: TextInputType.text,
                        hint: 'price',
                        prefix: Icons.price_change,
                        valid: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Price';
                          }
                          return null;
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultButton(
                      borderColor: Colors.white,
                      backgroundColor: Colors.black,
                      buttonWidget: const Text(
                        'Pay',
                        style: TextStyle(color: Colors.white),
                      ),
                      function: () {
                        if (formKey.currentState!.validate()) {
                          cubit.getOrderId(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              price: priceController.text.toString(),
                              phone: phoneController.text);
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
