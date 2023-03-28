import 'package:flutter/material.dart';

import '../../core/theme/size/app_size.dart';

class AppLoading extends StatelessWidget {
  final Color? color;
  final bool? isCenter;
  const AppLoading({Key? key, this.color, this.isCenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCenter == true
        ? Center(
            child: CircularProgressIndicator(
              color: color ?? Theme.of(context).primaryColor,
            ),
          )
        : Column(
            children: [
              SizedBox(height: AppSize.h150),
              Center(
                child: CircularProgressIndicator(
                  color: color ?? Theme.of(context).primaryColor,
                ),
              ),
            ],
          );
  }
}
