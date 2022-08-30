import 'package:avijatrik_hotel_supplier_app/shared/login/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/login/ui/components/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/button/custom_text_button.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/button/footer_button.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/bottom_navigation_container.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text_field.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/error/error_container.dart';
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
    SizeUtils().init(context);
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      backgroundColor: Colors.blue,
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
        child: Container(
          color: Colors.amber,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: SizeUtils.screenHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderContainer(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: screenLeftPadding,
                    right: screenRightPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: CustomText(
                          title: 'Please login to continue',
                          fontSize: headerTextFontSIze,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Center(
                        child: CustomText(
                          title: 'We will send you a code on this phone number',
                          fontSize: subTitleFontSIze,
                          textColor: black80,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                              labelText: 'Enter Mobile Number',
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
                                  CheckIsValidPhoneNumber(phoneNumber: value),
                                );
                              },
                            ),
                          ),
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
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return BottomNavigationContainer(
                      child: Column(
                        children: [
                          FooterButton(
                            text: 'Get Started',
                            // icon: 'icons/keyboard_arrow_right.svg',
                            isLoading: state is LoginLoading,
                            onPressed: state is LoginLoading ||
                                    state is LoginPhoneNumberInvalid
                                ? null
                                : () {
                                    FocusScope.of(context).unfocus();
                                    _loginBloc.add(
                                      LoginButtonPressed(
                                        phoneNumber: phoneNumberCtrl.text,
                                      ),
                                    );
                                  },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CustomTextButton(
                            text: 'Skip for now',
                            onPressed: () =>
                                Navigator.pushNamed(context, '/home'),
                          ),
                        ],
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
