import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/widgets/builders/defualt_botton.dart';
import 'package:defacto/modules/widgets/builders/text_form.dart';
import 'package:defacto/modules/widgets/funtions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUs extends StatelessWidget {
   TextEditingController descriptionController = TextEditingController();
   ContactUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state){
          var cubit = DefactoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:const Text('Contact Us',),
            ),
            body:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildTextForm(
                    context,
                    buttonController: descriptionController,
                    title: 'Problem',
                    MediaQuery.of(context).size.height * 0.22,
                  ),
                  const Spacer(),
                  DefaultButton(function:(){
                    cubit.sendContact(descriptionController.text);
                    cubit.showAlert(context);
                    showToast('Send',ToastStates.SUCCESS);
                  },
                    borderColor: Colors.white,
                    backgroundColor: Colors.black,
                    buttonWidget: const Text(
                      'Send',style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
