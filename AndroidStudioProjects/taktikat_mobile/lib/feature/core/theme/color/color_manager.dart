import 'package:flutter/material.dart';

class ColorManager {
  //00529F

  final possessionBlue = const Color(0xFF00529F);

  //DB0030
  final possessionRed = const Color(0xFFDB0030);

  //00BF24
  final statsBackgroundColor = const Color(0xFF00BF24);

  //DFDFDF
  final unSelectedWidgetColor = const Color(0xFFDFDFDF);

  //00BF24
  final Color greenLineup = const Color(0xFF00BF24);

  final Color redLineup = const Color(0xFFf08022);

  ColorManager._();
  static ColorManager instance = ColorManager._();

//**** App level ****
  final unselectedText = const Color(0xFFBFBFBF);
  final hintColor = const Color(0xFFEBEBEB);
  final canvasColor = const Color(0xFFF5F5F5);

//**** light theme ****
  final primary = const Color(0xFF502464);
  final secondary = const Color(0xFF707070);
  final onPrimary = const Color(0xFFC90F8D);
  final onSecondary = const Color(0xff156585);
  final primaryContainer = const Color(0xFFF5F5F5);
  final buttonColor = const Color(0xff126282);
  final onButtonBackGround = const Color(0xFFEEEEEE);

//**** dark theme ****
  final dtBackGround = const Color(0xFFFFFFFF);
  final dtPrimary = const Color(0xffC822C9);
  final dtOnPrimary = const Color(0xFFFFFFFF);
  final dtSecondary = const Color(0xFFFFFFFF);
  final dtOnSecondary = const Color(0xFFFFFFFF);
  final dtPrimaryContainer = const Color(0xFFFFFFFF);
  final dtButtonColor = const Color(0xFFFFFFFF);
  final dtOnButtonBackGround = const Color(0xFFFFFFFF);

//**** manager level ****
  final transparent = const Color(0X00000000);
  //707070
  final Color textHintColor = const Color(0xFF707070);

  //8B8B8B
  final Color selectedTabDark = const Color(0xFF8B8B8B);

  //7C8989
  final Color contactUsButtonColor = const Color(0xFF7C8989);

  //333491
  final Color leftScoreColor = const Color(0xFF333491);

  //9D9D9D
  final Color bottomNavColor = const Color(0xFF9D9D9D);

  final Color yellowTextColor = const Color(0xFFF7EB16);

  final Color staticGrey = const Color(0xFFDEDEDE);

  final Color fillBorderColor = const Color(0xFF424242);

  //707070
  final Color textBorderColor = const Color(0xFF707070);

  //BABABA
  final Color textFiledBorder = const Color(0xFFBABABA);

  //6585C1
  final Color facebookColor = const Color(0xFF6585C1);

  //D56254
  final Color googleColor = const Color(0xFFD56254);

  //479BE9
  final Color twitter = const Color(0xFF479BE9);

  //868686
  final Color tabHeaderColor = const Color(0xFF868686);

  //EAEAEA
  final Color borderBackgroundColor = const Color(0xFFEAEAEA);

  //707070
  final Color dashColor = const Color(0xFF707070);

  final error = const Color(0xFFD32F2F);

  final success = const Color(0xFF388E3C);

  final white = const Color(0xFFFFFFFF);

  final darkGrey = const Color(0xFF515151);

  final black = const Color(0xFF000000);

  final backgroundColor = const Color(0xFFF2F2F2);

  final backgroundColorDark = const Color(0xFF1A1A1A);

  final textBodyColorDark = const Color(0xFFBDBDBD);

  final textColor = const Color(0xFF000000);

  final textBodyColor = const Color(0xFF424242);

  final redTextColor = const Color(0xFFD32F2F);

//00457B
  final secondaryHeaderColor = const Color(0xFF4F988C);

  //F3F3F3
  // final dividerColor = const Color(0xFFF3F3F3);
  final Color dividerColor = const Color(0xFFBFBFBF);

  //C6C6C6
  final textGray = const Color(0xFFC6C6C6);

  //003146
  final darkBlue = const Color(0xFF003146);

  //E1E1E1
  final crossColor = const Color(0xFFE1E1E1);

  final Gradient? drawerGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF006A58),
      Color(0xFF004580),
    ],
  );

  //6E6E6E
  final textGrayColor = const Color(0xFF6E6E6E);

  //00A54C
  final green = const Color(0xFF00A54C);

  //BC0000
  final red = const Color(0xFFAD0032);

  //036973
  final secondaryDark = const Color(0xFF036973);

  //0093D2
  final primaryLightColor = const Color(0xFF0093D2);

  get whitePercentage50 => null;

  //F6F6F6
  final Color scaffoldColor = const Color(0xFFF6F6F6);
}

// class ColorManager {
//   final Color blue = const Color(0xFF48A4DD);
//
//   //9C9C9C
//   final Color borderColor = const Color(0xFF9C9C9C);
//
//   //8B8B8B
//   final Color selectedTabDark = const Color(0xFF8B8B8B);
//
//   //7C8989
//   final Color contactUsButtonColor = const Color(0xFF7C8989);
//
//   //333491
//   final Color leftScoreColor = const Color(0xFF333491);
//
//   //9D9D9D
//   final Color bottomNavColor = const Color(0xFF9D9D9D);
//
//   final Color yellowTextColor = const Color(0xFFF7EB16);
//
//   final Color staticGrey = const Color(0xFFDEDEDE);
//
//   //F6D65C
//   final Color scoreYellowColor = const Color(0xFFF6D65C);
//
//   final Color fillBorderColor = const Color(0xFF424242);
//
//   //707070
//   final Color textBorderColor = const Color(0xFF707070);
//
//   //BABABA
//   final Color textFiledBorder = const Color(0xFFBFBFBF);
//
//   //707070
//   final Color textHintColor = const Color(0xFF707070);
//
//   //6585C1
//   final Color facebookColor = const Color(0xFF6585C1);
//
//   //D56254
//   final Color googleColor = const Color(0xFFD56254);
//
//   //479BE9
//   final Color twitter = const Color(0xFF479BE9);
//
//   //868686
//   final Color tabHeaderColor = const Color(0xFF868686);
//
//   //EAEAEA
//   final Color borderBackgroundColor = const Color(0xFFEAEAEA);
//
//   //BF1B93
//   final Color deleteColor = const Color(0xFFBF1B93);
//
//   //EAEC22
//   final Color selectedBottomNavColor = const Color(0xFFEAEC22);
//
//   //707070
//   final Color dashColor = const Color(0xFF707070);
//
//   //928CCF
//   final Color colorPrimaryLite = const Color(0xFF928CCF);
//
//   //D86D11
//   final Color europaLeage = const Color(0xFFD86D11);
//

//
//   final Color matchedBackgroundColor = const Color(0xFFF2F2F2);
//
//   //8C1539
//   final Color wordCupLight = const Color(0xFF8C1539);
//   //67102A
//   final wordCupIntermidiate = const Color(0xFF67102A);
//   //460B1D
//   final wordCupDark = const Color(0xFF460B1D);
//
//   final error = const Color(0xFFD32F2F);
//
//   final success = const Color(0xFF388E3C);
//
//   final white = const Color(0xFFFFFFFF);
//
//   final trnasparent = const Color(0X00000000);
//
//   final colorPrimary = const Color(0xFF502464);
//
//   final darkGrey = const Color(0xFF515151);
//
//   final black = const Color(0xFF000000);
//
//   final backgroundColor = const Color(0xFFF2F2F2);
//
//   final textBodyColorDark = const Color(0xFFBDBDBD);
//
//   final textColor = const Color(0xFF000000);
//
//   final textBodyColor = const Color(0xFFBFBFBF);
//
//   final redTextColor = const Color(0xFFD32F2F);
//
// //00457B
//   final secondaryHeaderColor = const Color(0xFF6B95EA);
//
//   //F3F3F3
//   // final dividerColor = const Color(0xFFF3F3F3);
//   final Color dividerColor = const Color(0xFFDCDCDD);
//
//   //C6C6C6
//   final textGray = const Color(0xFFC6C6C6);
//
//   //080E35
//   final darkBlue = const Color(0xFF080E35);
//
//   //E1E1E1
//   final crossColor = const Color(0xFFE1E1E1);
//
//   final Gradient? drawerGradient = const LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [
//       Color(0xFF006A58),
//       Color(0xFF004580),
//     ],
//   );
//
//   //97FCB5
//   final secondaryDarkColor = const Color(0xFF97FCB5);
//
//   //6E6E6E
//   final textGrayColor = const Color(0xFF6E6E6E);
//
//   //006B59
//   final green = const Color(0xFF006B59);
//
//   //EEEEEE
//   final dividerHilghtColor = const Color(0xFFEEEEEE);
//
//   //036973
//   final secondaryDark = const Color(0xFF036973);
//
//   //0093D2
//   final primaryLightColor = const Color(0xFFD50861).withOpacity(0.15);
//
//
//   //D1D1D1
//   final unselectedItemColor = const Color(0xFFD1D1D1);
//
//   //F7F7FD
//   final scaffoldSacendaryColor = const Color(0xFFF7F7FD);
//
//   //F5F5F5
//
//   final Color canvasColor = const Color(0xFFF5F5F5);
//
//   ColorManager._();
//   static ColorManager instance = ColorManager._();
//
//   get whitePercentage50 => null;
//
//   //White 100%
//   final Color scaffoldColor = const Color(0xFFFFFFFF);
//
//   //F7F8FD
//   final Color textFieldBackground = const Color(0xFFF7F8FD);
//
//   //#D91A57
//   final Color splashAndstartButton = const Color(0xFFD91A57);
//
//
// }
