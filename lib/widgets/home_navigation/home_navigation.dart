import 'package:avijatrik_hotel_supplier_app/blocs/home_bloc/home_bloc.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/animated/animatedCustomText.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    final navBarWidth = (SizeUtils.screenWidth - (screenAllSidePadding * 2));

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          width: navBarWidth,
          height: 60,
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: brand,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: navBarWidth / 2,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutExpo,
                transform: Matrix4.translation(
                  vector.Vector3(
                      state is HomeScreenIndexState && state.screenIndex == 0
                          ? 0
                          : navBarWidth / 2,
                      0,
                      0),
                ),
                child: Container(),
              ),
              Center(
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (() => context.read<HomeBloc>().add(
                            const ChangeHomeScreenIndex(screenIndex: 0),
                          )),
                      child: Container(
                        width: navBarWidth / 2,
                        color: Colors.transparent,
                        child: Center(
                          child: AnimatedCustomText(
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.easeIn,
                            title: 'My Bids',
                            textColor: state is HomeScreenIndexState &&
                                    state.screenIndex == 0
                                ? primaryWhite
                                : black50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (() => context.read<HomeBloc>().add(
                            const ChangeHomeScreenIndex(screenIndex: 1),
                          )),
                      child: Container(
                        width: navBarWidth / 2,
                        color: Colors.transparent,
                        child: Center(
                          child: AnimatedCustomText(
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.easeIn,
                            title: 'My Rooms',
                            textColor: state is HomeScreenIndexState &&
                                    state.screenIndex == 1
                                ? primaryWhite
                                : black50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
