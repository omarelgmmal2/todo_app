import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_color.dart';
import 'package:todo_app/core/utils/app_routes.dart';
import '../../core/design/custom_floating_action_button.dart';
import 'widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addTaskRoute);
        },
        widget: const Icon(CupertinoIcons.plus, color: AppColor.white),
      ),
      body:  const HomeViewBody(),
    );
  }
}
