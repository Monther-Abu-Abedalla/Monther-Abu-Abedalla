import 'package:flutter/material.dart';

import '../../constants/const_gifs.dart';


class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ConstGifs.skeleton,
      height: 30,
      fit: BoxFit.contain,
      width: 30,
    );
  }
}
