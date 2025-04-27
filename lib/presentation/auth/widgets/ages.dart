import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/presentation/auth/bloc/age_display_cubit.dart';
import 'package:ecommerce/presentation/auth/bloc/age_display_state.dart';
import 'package:ecommerce/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 2.7,
      child: BlocBuilder<AgeDisplayCubit, AgeDisplayState>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AgesLoaded) {
            return _ages(state.ages);
          }
          if (state is AgesLoadFailure) {
            return Center(child: Text(state.message + "tttttttttttttt"));
          }
          return Container(child: Text("sadfkjasfdlkjas"));
        },
      ),
    );
  }

  _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),

      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            context.read<AgeSelectionCubit>().selecAge(
              ages[index].data()["value"],
            );
          },
          child: Text(
            ages[index].data()["value"],
            style: TextStyle(fontSize: 18),
          ),
        );
      },
      itemCount: ages.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: 20);
      },
    );
  }
}
