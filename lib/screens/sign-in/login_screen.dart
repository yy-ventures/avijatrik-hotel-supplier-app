// Screen Components
import 'package:avijatrik_hotel_supplier_app/blocs/login/index.dart';
import 'package:avijatrik_hotel_supplier_app/screens/sign-in/components/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/appbar/appbar.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/button/custom_text_button.dart';
// Custom Widgets
import 'package:avijatrik_hotel_supplier_app/widgets/button/footer_button.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/bottom_navigation_container.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text_field.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/error/error_container.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/image_with_shader/image_with_shader.dart';
// Third party package
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => LoginBloc(authService: AuthService()),
      child: LoginForm(),
    );
  }
}

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final phoneNumberCtrl = TextEditingController();
  late LoginBloc _loginBloc;

  @override
  Widget build(BuildContext context) {
    // Setting System UI Styles
    SystemChrome.setSystemUIOverlayStyle(transparentNavigation());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top]);

    SizeUtils().init(context);
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      backgroundColor: primaryWhite,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        statusbarTransparent: true,
        elevation: 0,
      ),
      body: BlocListener(
        bloc: _loginBloc,
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamed(
              context,
              '/otp',
              arguments: {'phoneNumber': phoneNumberCtrl.text},
            );
          }
        },
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            constraints: BoxConstraints(
              minHeight: SizeUtils.screenHeight,
            ),
            height: SizeUtils.screenHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(
                  top: 0,
                  child: ImageWithShader(
                    imagePath: 'assets/images/bg-img.png',
                    heightInPercentage: 65,
                    gradient: mirrorGradient,
                  ),
                ),
                Positioned(
                  top: SizeUtils.screenHeight * 0.62,
                  child: Container(
                    width: SizeUtils.screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomText(
                          title: 'Sign In',
                          textColor: brand,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 33),
                        const CustomText(
                          title: 'Enter your phone number',
                          textColor: black70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 4),
                        const CustomText(
                          title: 'We will send you a code on this number',
                          textColor: black70,
                          fontSize: 14,
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: screenLeftPadding + 40,
                            right: screenRightPadding + 40,
                            bottom: screenBottomPadding + 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CountryCodeContainer(
                                    onChange: (CountryCode? country) async {
                                      print(country);
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      textController: phoneNumberCtrl,
                                      labelText: 'Phone no.',
                                      textInputType: TextInputType.number,
                                      isRequired: true,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'),
                                        ),
                                        LengthLimitingTextInputFormatter(11),
                                      ],
                                      onChange: (value) {
                                        _loginBloc.add(
                                          CheckIsValidPhoneNumber(
                                              phoneNumber: value),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return state is LoginError
                                      ? ErrorContainer(
                                          messages: state.errors,
                                          showAsterisk: true,
                                        )
                                      : const SizedBox();
                                },
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return BottomNavigationContainer(
                                  child: Column(
                                    children: [
                                      FooterButton(
                                        text: 'Sign In',
                                        // icon: 'icons/keyboard_arrow_right.svg',
                                        isLoading: state is LoginLoading,
                                        onPressed: state is LoginLoading ||
                                                state is LoginPhoneNumberInvalid
                                            ? null
                                            : () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                _loginBloc.add(
                                                  LoginButtonPressed(
                                                    phoneNumber:
                                                        phoneNumberCtrl.text,
                                                  ),
                                                );
                                              },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
