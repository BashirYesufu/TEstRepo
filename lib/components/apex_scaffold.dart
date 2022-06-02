import 'package:apex/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../utilities/provider/providers/loading_provider.dart';

class ApexScaffold extends StatelessWidget {
  final List<Widget> children;
  final Color appBarColor;
  final Color backgroundColor;
  final Widget? bottomNavBar;
  final bool hasBackButton;

  const ApexScaffold({
    required this.children,
    this.appBarColor = ApexColors.white,
    this.backgroundColor = ApexColors.white,
    this.bottomNavBar,
    this.hasBackButton = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingProvider = Provider.of<LoadingStateProvider>(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ModalProgressHUD(
        inAsyncCall: loadingProvider.loading,
        child: Scaffold(
          backgroundColor: appBarColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            centerTitle: true,
            leading: hasBackButton
                ? InkWell(
                    onTap: () {
                      //Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: ApexColors.black,),
                  )
                : SizedBox(),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: children,
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(child: bottomNavBar ?? SizedBox()),
        ),
      ),
    );
  }
}
