import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/views/political_privacy/cubit.dart';
import 'package:thimar/views/political_privacy/states.dart';

class PoliticalPrivacyView extends StatefulWidget {
  const PoliticalPrivacyView({super.key});

  @override
  State<PoliticalPrivacyView> createState() => _PoliticalPrivacyViewState();
}

class _PoliticalPrivacyViewState extends State<PoliticalPrivacyView> {
  final cubit = KiwiContainer().resolve<PolicyCubit>()..getData();
  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Theme.of(context).primaryColor),
          ),
        ),
        body: Column(
          children: [
            BlocBuilder<PolicyCubit, PolicyStates>(
              builder: (context, state) {
                if (state is PolicyLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PolicySuccessState) {
                  return Container(
                    padding: EdgeInsets.all(16.r),
                    child: HtmlWidget(
                      state.data,
                      textStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff828282),
                      ),
                    ),
                  );
                } else {
                  return const Text("Data Failed");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
