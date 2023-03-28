import 'package:flutter/material.dart';

import '../../../../../utils/constants/const_images.dart';
import 'Widgets/verify_code_widget.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({
    Key? key,
    this.isUpdate = false,
  }) : super(key: key);

  final bool isUpdate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    ConstImages.signupLogo,
                    fit: BoxFit.fill,
                  ),
                ),
                PositionedDirectional(
                  top: 10,
                  start: 20,
                  child: BackButton(
                    color: Theme.of(context).colorScheme.background,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 35),
                  VerifyCodeWidget(isUpdate: isUpdate),
                  const SizedBox(height: 34),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
