import 'package:avijatrik_hotel_supplier_app/shared/login/ui/components/header_container.dart';
import 'package:avijatrik_hotel_supplier_app/shared/otp/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/blocs/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/enum/enums.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/button/footer_button.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/bottom_navigation_container.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/error/error_container.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/otp/custom_otp.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/otp/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => OtpBloc(authService: AuthService()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => TimerBloc(),
        ),
      ],
      child: OtpForm(
        phoneNumber: phoneNumber,
      ),
    );
  }
}

// ignore: must_be_immutable
class OtpForm extends StatelessWidget with CodeAutoFill {
  OtpForm({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  final otpCtrl = TextEditingController();
  late OtpBloc _otpBloc;
  late TimerBloc _timerBloc;

  @override
  void codeUpdated() {
    otpCtrl.text = code.toString();
  }

  Future<void> listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    await SmsAutoFill().listenForCode;
  }

  void dispose() {
    cancel();
    SmsAutoFill().unregisterListener();
    _timerBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    _otpBloc = BlocProvider.of<OtpBloc>(context);
    _timerBloc = BlocProvider.of<TimerBloc>(context);
    listenOtp();

    return Scaffold(
      backgroundColor: whiteBackGroundColor,
      body: BlocListener(
        bloc: _otpBloc,
        listener: (_, state) {
          if (state is OtpVerificationSuccess) {
            dispose();

            BlocProvider.of<AuthBloc>(context).add(
              const ChangeAuthStatus(
                authenticationStatus: AuthenticationStatus.authenticated,
              ),
            );
            if (state.isNewUser) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/update-profile',
                (Route<dynamic> route) => false,
                arguments: {'isNewUser': true},
              );
            } else if (!state.hasPreferences) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/user-preference',
                (Route<dynamic> route) => false,
              );
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/home',
                (Route<dynamic> route) => false,
              );
            }
          }
        },
        child: SingleChildScrollView(
          reverse: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: SizeUtils.screenHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderContainer(),
                Transform(
                  transform: Matrix4.translationValues(0, -20, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: screenLeftPadding,
                      right: screenRightPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: CustomText(
                            title: 'OTP Verification',
                            fontSize: headerTextFontSIze,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: CustomText(
                            title: 'Enter the OTP we sent to  +88$phoneNumber',
                            fontSize: subTitleFontSIze,
                            textColor: black80,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomText(
                          title: 'Enter Verification Code',
                          fontSize: subTitleFontSIze,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        BlocBuilder<OtpBloc, OtpState>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                OtpField(
                                  controller: otpCtrl,
                                  hasError: state is OtpVerificationFailed,
                                  onChanged: (otp) {
                                    _otpBloc.add(CheckOtpValidation(otp: otp));
                                  },
                                ),
                                if (state is OtpVerificationFailed)
                                  ErrorContainer(
                                    messages: state.messages,
                                    showErrorIcon: true,
                                  ),
                                SizedBox(
                                  height:
                                      state is OtpVerificationFailed ? 12 : 0,
                                ),
                              ],
                            );
                          },
                        ),
                        BlocBuilder<TimerBloc, TimerState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                CustomText(
                                  title: state is TimerShow
                                      ? 'Request again in'
                                      : 'Didn’t receive code?',
                                  fontSize: 14,
                                  textColor: black80,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _otpBloc.add(
                                      ResendOtp(phoneNumber: phoneNumber),
                                    );
                                    _timerBloc.add(
                                      const TimerActive(
                                        isActive: true,
                                      ),
                                    );
                                  },
                                  child: state is TimerHide
                                      ? const CustomText(
                                          title: 'Request again',
                                          fontSize: 14,
                                          textColor: brand,
                                        )
                                      : OtpTimer(
                                          seconds:
                                              AppConstants.otpTimeInSeconds,
                                          timeOnEnd: () {
                                            try {
                                              _timerBloc.add(
                                                const TimerActive(
                                                  isActive: false,
                                                ),
                                              );
                                            } catch (ex) {}
                                          },
                                        ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<OtpBloc, OtpState>(
                  builder: (context, state) {
                    return BottomNavigationContainer(
                      child: FooterButton(
                        text: 'Verify',
                        icon: 'icons/check.svg',
                        isLoading: state is OtpLoading,
                        onPressed: state is OtpLoading || state is OtpInvalid
                            ? null
                            : () {
                                FocusScope.of(context).unfocus();
                                _otpBloc.add(
                                  OtpSubmitButtonPressed(
                                    phoneNumber: phoneNumber,
                                    otp: int.parse(otpCtrl.text),
                                  ),
                                );
                              },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
