// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/cities/cubit.dart';
import 'package:thimar/features/cities/states.dart';
import 'package:thimar/features/cities/model.dart';

class CitiesSheet extends StatefulWidget {
  const CitiesSheet({super.key});

  @override
  State<CitiesSheet> createState() => _CitiesSheetState();
}

class _CitiesSheetState extends State<CitiesSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCitiesCubit(),
      child: Builder(builder: (context) {
        GetCitiesCubit cubit = BlocProvider.of(context);
        cubit.getData();
        return Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Text(
                "اختر المدينة",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (state is GetCitiesLoadingState) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is GetCitiesSuccessState) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            _ItemCity(model: cubit.model.list[index]),
                        itemCount: cubit.model.list.length,
                        padding: EdgeInsets.all(16),
                      ),
                    );
                  } else {
                    return Text("Failed");
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _ItemCity extends StatelessWidget {
  final CityModel model;
  const _ItemCity({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, model);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Theme.of(context).primaryColor.withOpacity(.1),
        ),
        child: Center(child: Text(model.name)),
      ),
    );
  }
}
