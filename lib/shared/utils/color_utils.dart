import 'package:flutter/material.dart';

// Red
const Color redNotification = Color(0xFFE13255);
//Green
const Color brand = Color(0xFF1FA67D);
const Color brandShadow = Color(0xFF1B8A68);
const Color greenLight = Color(0xFF5AF5C6);
const Color green80 = Color(0xFF4CB897);
const Color green60 = Color(0xFF79CAB1);
const Color green40 = Color(0xFFA5DBCB);
const Color green20 = Color(0xFFD2EDE5);
const Color greenOverlay = Color(0xFFDDF2EC);
const Color greenOpacity = Color(0xFFE4F4EF);

//Black
const Color primaryBlack = Color(0xFF2E2E2E);
const Color black80 = Color(0xFF414141);
const Color black50 = Color(0xFF707070);
const Color black60 = Color(0xFF707171);
const Color black40 = Color(0xFFA0A0A0);
const Color black20 = Color(0xFFCFD0D0);
const Color blackOverlay = Color(0xFFDBDBDB);
const Color blackOpacity = Color(0xFFF2F2F2);

//Blue
const Color primaryBlue = Color(0xFF4082E4);
const Color blue80 = Color(0xFF669BE9);
const Color blue60 = Color(0xFF8CB4EF);
const Color blue40 = Color(0xFFB3CDF4);
const Color blue20 = Color(0xFFD9E6FA);
const Color blueOverlay = Color(0xFFE2ECFB);
const Color blueOpacity = Color(0xFFE8F0FC);

//danger
const Color primaryDanger = Color(0xFFFF5C5C);
const Color danger80 = Color(0xFFFF7D7D);
const Color danger60 = Color(0xFFFF9E9E);
const Color danger40 = Color(0xFFFFBEBE);
const Color danger20 = Color(0xFFFFDEDE);
const Color dangerOverlay = Color(0xFFFFE7E7);
const Color dangerOpacity = Color(0xFFFFEBEB);

//danger
const Color primaryWarning = Color(0xFFFF8E3C);
const Color warning80 = Color(0xFFFFA463);
const Color warning60 = Color(0xFFFFBB8A);
const Color warning40 = Color(0xFFFFD2B1);
const Color warning20 = Color(0xFFFFE8D8);
const Color warningOverlay = Color(0xFFFFF1E8);
const Color warningOpacity = Color(0xFFFFF8F3);

//success
const Color primarySuccess = Color(0xFF35DB95);
const Color success80 = Color(0xFF43C890);
const Color success60 = Color(0xFF72D6AC);
const Color success40 = Color(0xFFA1E3C7);
const Color success20 = Color(0xFFD0F1E3);
const Color successOverlay = Color(0xFFDCF5EA);
const Color successOpacity = Color(0xFFE3F7EE);

//White
const Color primaryWhite = Color(0xFFFFFFFF);
const Color white80 = Color(0xFFF6F6F6);
const Color lightGrey = Color(0xFFEBEBEB);
//Other
const Color whiteBackGroundColor = Color(0xFFFFFFFF); //Color(0xFFE5E5E5);
const Color backGroundColor = Color(0xFFF5F5F5);
const Color inputBorderColor = black20;
const Color disableColor = black20;
const Color disableTextColor = black40;

//Shadow
const Color shadowHeavy = Color.fromRGBO(0, 0, 0, 0.14);
const Color shadowLight = Color.fromRGBO(0, 0, 0, 0.05);
const Color shadowAppBar = Color.fromRGBO(0, 0, 0, 0.35);

// Backdrop
Color backDrop = const Color(0xFF000000).withOpacity(0.5);

// Gradient from both top to bottom and bottom to top on background image for sign-in page and otp page
const mirrorGradient = LinearGradient(
  colors: [
    primaryWhite,
    Colors.transparent,
    primaryWhite,
  ],
  stops: [0, 0.5, 1],
  begin: Alignment(0, -0.9),
  end: Alignment(0, 0.9),
);
const mirrorGradientOtpScreen = LinearGradient(
  colors: [
    primaryWhite,
    Colors.transparent,
    primaryWhite,
  ],
  stops: [0, 0.35, 0.85],
  begin: Alignment(0, -0.9),
  end: Alignment(0, 0.9),
);

// Gradient from top to bottom of the status bar behind the background image
const linearGradient = LinearGradient(
  colors: [
    primaryWhite,
    Colors.transparent,
  ],
  stops: [0, 0.5],
  begin: Alignment(0, -0.9),
  end: Alignment(0, 1),
);
// Gradient from top to bottom of the status bar behind the background image
const helpScreenGradient = LinearGradient(
  colors: [
    primaryWhite,
    Colors.transparent,
  ],
  stops: [0.2, 1],
  begin: Alignment(0, -0.9),
  end: Alignment(0, 1),
);
