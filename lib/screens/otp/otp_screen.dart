import 'package:flutter/material.dart';
// Screens, Blocs & Utils
import 'package:avijatrik_hotel_supplier_app/blocs/otp/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/blocs/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/enum/enums.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
// Custom Widgets
import 'package:avijatrik_hotel_supplier_app/shared/widgets/button/footer_button.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_timer.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/error/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/image_with_shader/image_with_shader.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/otp/custom_otp.dart';
// Third party packages
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
    String countryCodeExt = phoneNumber.length == 10 ? '880' : '88';

    return Scaffold(
      backgroundColor: primaryWhite,
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
            // if (state.isNewUser) {
            //   Navigator.of(context).pushNamedAndRemoveUntil(
            //     '/update-profile',
            //     (Route<dynamic> route) => false,
            //     arguments: {'isNewUser': true},
            //   );
            // } else if (!state.hasPreferences) {
            //   Navigator.of(context).pushNamedAndRemoveUntil(
            //     '/user-preference',
            //     (Route<dynamic> route) => false,
            //   );
            // } else {
            if (state.success == true) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/home',
                (Route<dynamic> route) => false,
              );
            }
          }
        },
        child: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            height: SizeUtils.screenHeight,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: SizeUtils.screenHeight,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Positioned(
                    top: 0,
                    child: ImageWithShader(
                      imagePath: 'assets/images/bg-img.png',
                      heightInPercentage: 65,
                      gradient: mirrorGradientOtpScreen,
                    ),
                  ),
                  Positioned(
                    top: SizeUtils.screenHeight * 0.52,
                    child: SizedBox(
                      width: SizeUtils.screenWidth,
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
                                fontSize: titleFontSIze,
                                fontWeight: FontWeight.w700,
                                textColor: primaryBlack,
                              ),
                            ),
                            const SizedBox(height: 28),

                            // const CustomText(
                            //   title: 'Enter Verification Code',
                            //   fontSize: subTitleFontSIze,
                            // ),

                            BlocBuilder<OtpBloc, OtpState>(
                              builder: (context, state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OtpField(
                                      controller: otpCtrl,
                                      hasError: state is OtpVerificationFailed,
                                      onChanged: (otp) {
                                        _otpBloc
                                            .add(CheckOtpValidation(otp: otp));
                                      },
                                    ),
                                    Container(
                                      child: state is OtpVerificationFailed
                                          ? ErrorContainer(
                                              messages: state.messages,
                                              showErrorIcon: true,
                                            )
                                          : const SizedBox(),
                                    ),
                                    SizedBox(
                                      height: state is OtpVerificationFailed
                                          ? 12
                                          : 0,
                                    ),
                                  ],
                                );
                              },
                            ),
                            Row(
                              children: [
                                const CustomText(
                                  title: 'Enter the OTP we sent to ',
                                  fontSize: subTitleFontSIze,
                                  textColor: black80,
                                ),
                                const SizedBox(width: 5),
                                CustomText(
                                  title: '+$countryCodeExt$phoneNumber',
                                  fontSize: subTitleFontSIze,
                                  textColor: brand,
                                ),
                              ],
                            ),
                            const SizedBox(height: 28),

                            BlocBuilder<OtpBloc, OtpState>(
                              builder: (context, state) {
                                return Center(
                                  child: FooterButton(
                                    text: 'Verify',
                                    isLoading: state is OtpLoading,
                                    onPressed: state is OtpLoading ||
                                            state is OtpInvalid
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
                            const SizedBox(height: 12),
                            BlocBuilder<TimerBloc, TimerState>(
                              builder: (context, state) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      title: state is TimerShow
                                          ? 'Request again in'
                                          : 'Didn’t receive code?',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
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
                                              fontWeight: FontWeight.bold,
                                              textColor: brand,
                                            )
                                          : CustomTimer(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
