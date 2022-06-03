import 'package:apex/routes.dart';
import 'package:apex/utilities/provider/provider_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Apex());
}

class Apex extends StatelessWidget {
  const Apex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHandler.initialRoute,
        routes: RouteHandler.routes,
        //onGenerateRoute: RouteHandler.generateRoute,
      ),
    );
  }
}