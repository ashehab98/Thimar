import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/features/notifications/cubit.dart';
import 'package:thimar/features/notifications/model.dart';
import 'package:thimar/features/notifications/states.dart';
import '../../../../gen/assets.gen.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NotificationsCubit()..getData(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("الإشعارات"),
            centerTitle: true,
          ),
          body: ListView(padding: const EdgeInsets.all(16), children: [
            BlocBuilder<NotificationsCubit, NotificationsStates>(
                builder: (context, state) {
              if (state is NotificationsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NotificationsSuccessState) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => _NotificationItem(
                    model: state.list,
                    index: index,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemCount: state.list.length,
                );
              } else {
                return const Text("Data Failed");
              }
            }),
          ]),
        ),
      ),
    );
  }
}

class _NotificationItem extends StatefulWidget {
  final List<Notifications> model;
  final int index;
  const _NotificationItem({
    super.key,
    required this.model,
    required this.index,
  });

  @override
  State<_NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<_NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: Container(
        width: 343.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.all(8.r),
            height: 33.h,
            width: 33.w,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.13),
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: AppImage(widget.model[widget.index].image),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.model[widget.index].title,
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                widget.model[widget.index].body,
                style: TextStyle(
                  color: Color(0xff989898),
                  fontSize: 10,
                ),
              ),
              Text(
                widget.model[widget.index].createdAt,
                style: TextStyle(
                  color: Color(0xff091022),
                  fontSize: 10,
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
