import 'package:defacto/models/store_models/notification.dart';
import 'package:flutter/material.dart';

Widget buildNotificationItem(NotificationData notificationData) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notificationData.title!,
                style: const TextStyle(color: Colors.black, fontSize: 25),
              ),
              Text(
                notificationData.message!,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
