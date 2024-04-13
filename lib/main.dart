import 'package:flutter/material.dart';
import 'package:sec3/features/auth/onboarding/view/page/onBording_page.dart';
import 'package:sec3/features/auth/registration/view/page/registeration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool onBording = sharedPreferences.getBool('onboarding') ?? false;

  MaterialApp materialApp = MaterialApp(
    //  home: onBording ? const RegistrationPage() : const OnBordingPage(),
    onGenerateInitialRoutes: (_)=>MyRoutes.initRoutes,
    onGenerateRoute: MyRoutes.onGenerateRoute,
  );

  runApp(materialApp);
}



//in core make this class
class MyRoutes{
  static List<Route> initRoutes=[
    // final  List data = settings.arguments as List;
    //   MaterialPageRoute<dynamic>(
    //    builder: (BuildContext context) =>  OnBordingPage(firstname: data[0] as String ,lastname: data[1] as String ),
    //  );
    
      //  MaterialPageRoute<dynamic>(
      //   builder: (BuildContext context) => const OnBordingPage(),
      // ),
 MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const RegistrationPage(),
      ),
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    

    switch(settings.name){
      case 'login' :
      
      final List data = settings.arguments as List;
      return MaterialPageRoute<dynamic>(
       builder: (BuildContext context) =>  OnBordingPage(firstname: data[0] as String ,lastname: data[1] as String ),
     );
     case 'registeration' : return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => const RegistrationPage(),
    );
    default :return MaterialPageRoute<dynamic>(
       builder: (BuildContext context) => const RegistrationPage(),
    );
    }
  // if (settings.name == 'login') {
  //   return MaterialPageRoute<dynamic>(
  //     builder: (BuildContext context) => const OnBordingPage(),
  //   );
  // } else {
  //   return MaterialPageRoute<dynamic>(
  //     builder: (BuildContext context) => const RegistrationPage(),
  //   );
  // }
}
}