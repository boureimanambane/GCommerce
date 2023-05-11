import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:flutter/src/widgets/form.dart';
Future<void> main() async {
 runApp(MaterialApp(home: MyApp()));
}
/*void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: MyApp()));
}*/
class Themes {
  final ThemeData theme1 = ThemeData(
    primaryColor: Color(0xFFee6a59),
    fontFamily: "Quicksand",
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: Color(0xFFf9ac67)),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
 Connexion createState() => Connexion();
 // Connexion createState() => Connexion();
}

class Connexion extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: Themes().theme1,
      title: "Connexion",
      home: Scaffold(
        appBar: AppBar(
          title: Text("G_COMMERCE"),
        ),
   // return Scaffold(
  body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 45),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Username"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 45),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Password"),
                    obscureText: true,
                  ),
                ),
                ElevatedButton(
                 // onPressed: boutonLoginAppuyer,
                  child: Text("Login"),
                //onPressed: () => Navigator.pushNamed(context, FirstScreen()),
                //onPressed: () => Navigator.pushNamed(context, "/"),
                  onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(
                               // builder: (context) => Home(),
                            // builder: (context) => Interfaces(),
                            // builder: (context) => Articles(),
                              builder: (context) => MyHomePage(),
                              )
                          );
                          
                      },
                    ),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1.5)),
                    Padding(padding: EdgeInsets.all(8), child: Text("OU")),
                    Expanded(child: Divider(thickness: 1.5)),
                  ],
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          // builder: (context) => Home()//Exception on this line.
                                 //builder: (context) => Interfaces()
                                 //builder: (context) => Articles()
                                 builder: (context) => MyHomePage()
                          )
                      );
                    },
                    child: const Text("NEXT"),
                  )
                ],
              ),
            )

    ),
    ),
     );
        
  }
} 
class Articles extends StatelessWidget{
  @override
  String value ='';
   String IdArticle ='';
    String Designation ='';
     String TypeArticle ='';
      String UniteGestion ='';
       String QuantiteArticle ='';
        String PrixUnitaire ='';
         String Date ='';
         final formkey=new GlobalKey<FormState>();
          enregistrerForm(){
           if (formkey.currentState!.validate()){
            formkey.currentState!.save(); 
            debugPrint('$IdArticle');
            debugPrint('$Designation');
            debugPrint('$TypeArticle');
            formkey.currentState!.reset();
          }
          else{
              debugPrint('Erreur');
            }
          }
  Widget build(BuildContext context) {
    //return MaterialApp(
      //title: 'Nouveau Article',
      home: return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Nouveau Article',),
          backgroundColor: Color(0xFFee6a59),
          ),
           body: Form(
            key: formkey,
             child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text( 
                    value,
                    style: TextStyle(      fontSize: 20, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Identifiant',
                      hintText: 'Identifiant Article',
                      icon: Icon(
                        Icons.card_travel_rounded,
                        color: Color(0xFFee6a59),
                        size: 25,
                      ),
                    ),
                    validator:(val)=>value.length==0? " Valider Identifiant Article":null,
                    onSaved:(val)=>IdArticle=value ,
                    keyboardType: TextInputType.number,
                    autocorrect: true,
                    autofocus: true,
                  ),
                   TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Désignation',
                      hintText: 'Désignation Article',
                      icon: Icon(
                        Icons.backup,
                        color: Color(0xFFee6a59),
                        size: 25,
                      ),
                    ),
                    validator:(val)=>value.length==0? " Valider Désignation Article":null,
                    onSaved:(val)=>Designation=value ,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    autofocus: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Type',
                      hintText: 'Type Article',
                      icon: Icon(
                        Icons.difference_sharp,
                        color: Color(0xFFee6a59),
                        size: 25,
                      ),
                    ),
                    validator:(val)=>value.length==0? " Valider le type Article":null,
                    onSaved:(val)=>TypeArticle=value ,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    autofocus: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Unité de gestion',
                      hintText: 'Unité de gestion Article',
                      icon: Icon(
                        Icons.stacked_bar_chart,
                        color: Color(0xFFee6a59),
                        size: 25,
                      ),
                    ),
                    validator:(val)=>value.length==0? " Valider unité de gestion Article":null,
                    onSaved:(val)=>UniteGestion=value ,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    autofocus: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Quantité',
                      hintText: 'Quantité à stocker',
                      icon: Icon(
                        Icons.production_quantity_limits,
                        color: Color(0xFFee6a59),
                        size: 25,
                      ),
                    ),
                    validator:(val)=>value.length==0? " Valider la quantité Article":null,
                    onSaved:(val)=>QuantiteArticle=value ,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    autofocus: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Prix Article',
                      hintText: 'Prix unitaire article',
                      icon: Icon(
                        Icons.price_change_sharp,
                        color: Color(0xFFee6a59),
                        size: 25,
                      ),
                    ),
                    validator:(val)=>value.length==0? " Valider le prix unitaire Article":null,
                    onSaved:(val)=>PrixUnitaire=value ,
                    keyboardType: TextInputType.number,
                    autocorrect: true,
                    autofocus: true,
                  ),
                 TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      hintText: 'Date de stockage',
                      icon: Icon(
                        Icons.date_range_sharp,
                        color: Color(0xFFee6a59),
                        size: 25,
                      ),
                    ),
                    validator:(val)=>value.length==0? " Valider la date enregistrement Article":null,
                    onSaved:(val)=>Date=value,
                    keyboardType: TextInputType.datetime,
                    autocorrect: true,
                    autofocus: true,
                  ),
                  ElevatedButton(
                    child: Text('Enregistrer',
                  style: TextStyle(fontSize:20, fontWeight: FontWeight.bold), ),
                    onPressed: enregistrerForm,
                  ),
                ],
              ),
               
                   ),
           )  
    );  
  }  
}  
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
         title: Text("Acceuil"),
        ),
        body: GridView.count(
         mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  crossAxisCount: 2,
          children: <Widget>[
            Column(children: <Widget>[
              const Text('Articles'),
              IconButton(
  icon: Icon(Icons.production_quantity_limits),
  color: Colors.blue,
  splashColor: Colors.blueGrey,
  iconSize: 80,
  onPressed: () {
    // Code à exécuter lorsque le bouton est pressé
     Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) => Articles()),
                    );
      },
      )  
            ]),   
             Column(children: <Widget>[
              const Text('Stock'),
              IconButton(
  icon: Icon(Icons.shop),
  color: Colors.blue,
  splashColor: Colors.blueGrey,
  iconSize: 80,
  onPressed: () {
    // Code à exécuter lorsque le bouton est pressé
     Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) => Articles()),
                    );
      },
      )  
            ]),
             Column(children: <Widget>[
             const Text('Paramètres'),
              IconButton(
  icon: Icon(Icons.settings),
  color: Colors.blue,
  splashColor: Colors.blueGrey,
  iconSize: 80,
  onPressed: () {
    // Code à exécuter lorsque le bouton est pressé
     Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) => ListViewBuilder()),
                    );
      },
      ) 
            ]),
             Column(children: <Widget>[
              const Text('Bilan ',) ,
              IconButton(
  icon: Icon(Icons.balance),
   color: Colors.blue,
  splashColor: Colors.blueGrey,
  iconSize: 80,
  onPressed: () {
    // Code à exécuter lorsque le bouton est pressé
     Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) => Articles()),
                    );
      },
      )  
            ]),
            Column(children: <Widget>[
              const Text('Paramètres'),
              IconButton(
  icon: Icon(Icons.settings),
   color: Colors.blue,
  splashColor: Colors.blueGrey,
  iconSize: 80,
  onPressed: () {
    // Code à exécuter lorsque le bouton est pressé
     Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) => ListViewBuilder()),
                    );
      },
      )  
            ]),
             Column(children: <Widget>[
              const Text('A Propos',) ,
              IconButton(
  icon: Icon(Icons.description),
    color: Colors.blue,
  splashColor: Colors.blueGrey,
  iconSize: 80,
  onPressed: () {
    // Code à exécuter lorsque le bouton est pressé
     Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) => Articles()),
                    );
      },
      )  
            ]),
          ],
        ));
  }
}
class ListViewBuilder extends StatelessWidget {
const ListViewBuilder({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(title: const Text("Paramètres")),
	body: ListView(
	    children: <Widget>[
      ListTile(title: Text("Profil"), 
         contentPadding: EdgeInsets.zero,
                leading: IconButton(
                  icon: Icon(Icons.login),
                  onPressed: () => print('select'),
                   ),
                    ),
           ListTile( title: Text("Thèmes"),
                 contentPadding: EdgeInsets.zero,
                leading: IconButton(
                  icon: Icon(Icons.wallpaper),
                  onPressed: () => print('select'),
                   ),),
        ListTile( title: Text("Langues"),
              contentPadding: EdgeInsets.zero,
                leading: IconButton(
                  icon: Icon(Icons.language),
                  onPressed: () => print('select'),
                   ),),
        ListTile( title: Text("Droits"), 
              contentPadding: EdgeInsets.zero,
                leading: IconButton(
                  icon: Icon(Icons.accessible),
                  onPressed: () => print('select'),
                   ),),
        ListTile( title: Text("Assistance"),
              contentPadding: EdgeInsets.zero,
                leading: IconButton(
                  icon: Icon(Icons.help_center),
                  onPressed: () => print('select'),
                   ),)
      ],),
	);
}
}