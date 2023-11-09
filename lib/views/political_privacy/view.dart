import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/views/political_privacy/cubit.dart';
import 'package:thimar/views/political_privacy/states.dart';

class PoliticalPrivacyView extends StatefulWidget {
  const PoliticalPrivacyView({super.key});

  @override
  State<PoliticalPrivacyView> createState() => _PoliticalPrivacyViewState();
}

class _PoliticalPrivacyViewState extends State<PoliticalPrivacyView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PolicyCubit()..getData(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("سياسة الخصوصية"),
            leading: Container(
              height: 32,
              width: 32,
              padding: EdgeInsets.only(right: 5),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Theme.of(context).primaryColor.withOpacity(.13),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios),
                  color: Theme.of(context).primaryColor),
            ),
          ),
          body: BlocBuilder<PolicyCubit, PolicyStates>(
            builder: (context, state) {
              if (state is PolicyLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PolicySuccessState) {
                return ListView(padding: EdgeInsets.all(16.r), children: [
                  Text(
                  state.data,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff828282),
                    ),
                  ),
                ]);
              }else {
                return const Text("Data Failed");
              }
            },
          ),
        ),
      ),
    );
  }
}
