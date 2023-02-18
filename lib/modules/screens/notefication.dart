import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/widgets/builders/divider.dart';
import 'package:defacto/modules/widgets/builders/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Notifications'),
            ),
            body: ListView.separated(
              itemBuilder: (context, index) => buildNotificationItem(
                  cubit.notificationModel!.data!.data![index]),
              separatorBuilder: (context, index) => BuildDivider(),
              itemCount: cubit.notificationModel!.data!.data!.length,
            ),
          );
        });
  }
}
