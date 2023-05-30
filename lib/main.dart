import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(home: MyApp()));
}

class Themes {
  final ThemeData theme1 = ThemeData(
    primaryColor: Color(0xFFee6a59),
    fontFamily: "Quicksand",
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
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

class Connexion extends State<MyApp> {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => Home(),
                        // builder: (context) => Interfaces(),
                        // builder: (context) => Articles(),
                        builder: (context) => MyHomePage(),
                      ));
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // builder: (context) => Home()//Exception on this line.
                          //builder: (context) => Interfaces()
                          //builder: (context) => Articles()
                          builder: (context) => MyHomePage()));
                },
                child: const Text("NEXT"),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class Articles extends StatelessWidget {
  // const Article ({Key? key}) : super(key: key);

  String value = '';
  String? IdArticle = '';
  String? Nom = '';
  String? TypeArticle = '';
  String? UniteGestion = '';
  int? QuantiteArticle;
  String? PrixUnitaire = '';
  int? Date;
  final ReferenceDatabase = FirebaseFirestore.instance;
  final IdArticleController = TextEditingController();
  final NomController = TextEditingController();
  final TypeArticleController = TextEditingController();
  final UniteGestionController = TextEditingController();
  final QuantiteArticleController = TextEditingController();
  final PrixUnitaireController = TextEditingController();
  final DateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference Articles =
        FirebaseFirestore.instance.collection('Articles');
    home:
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Nouveau Article',
          ),
          backgroundColor: Color(0xFFee6a59),
        ),
        body: Form(
          // key: formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: TextStyle(fontSize: 20, color: Colors.blue),
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
                  controller: IdArticleController,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      hintText: 'Nom Article',
                      icon: Icon(
                        Icons.backup,
                        color: Color(0xFFee6a59),
                        size: 25,
                      ),
                    ),
                    controller: NomController),
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
                    controller: TypeArticleController),
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
                    controller: UniteGestionController),
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
                    controller: QuantiteArticleController),
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
                    controller: PrixUnitaireController),
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
                    controller: DateController),
                ElevatedButton(
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance.collection('Articles').add({
                      'Identifiant': IdArticleController.value.text,
                      'Nom': NomController.value.text,
                      'Type': TypeArticleController.value.text,
                      'Unité de Gestion': UniteGestionController.value.text,
                      'Quantité': QuantiteArticleController.value.text,
                      'Prix Article': PrixUnitaireController.value.text,
                      'Date': DateController.value.text,
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ));
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
                    MaterialPageRoute(builder: (context) => Articles()),
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
                    MaterialPageRoute(builder: (context) => Stock()),
                    //builder: (context) => Articles()),
                  );
                },
              )
            ]),
            Column(children: <Widget>[
              const Text('Vente'),
              IconButton(
                icon: Icon(Icons.manage_accounts),
                color: Colors.blue,
                splashColor: Colors.blueGrey,
                iconSize: 80,
                onPressed: () {
                  // Code à exécuter lorsque le bouton est pressé
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Parametres()),
                  );
                },
              )
            ]),
            Column(children: <Widget>[
              const Text(
                'Bilan ',
              ),
              IconButton(
                icon: Icon(Icons.balance),
                color: Colors.blue,
                splashColor: Colors.blueGrey,
                iconSize: 80,
                onPressed: () {
                  // Code à exécuter lorsque le bouton est pressé
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Articles()),
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
                    MaterialPageRoute(builder: (context) => Parametres()),
                  );
                },
              )
            ]),
            Column(children: <Widget>[
              const Text(
                'A Propos',
              ),
              IconButton(
                icon: Icon(Icons.description),
                color: Colors.blue,
                splashColor: Colors.blueGrey,
                iconSize: 80,
                onPressed: () {
                  // Code à exécuter lorsque le bouton est pressé
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Apropos()),
                  );
                },
              )
            ]),
          ],
        ));
  }
}

class Parametres extends StatelessWidget {
  const Parametres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paramètres")),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Profil"),
            contentPadding: EdgeInsets.zero,
            leading: IconButton(
              icon: Icon(Icons.login),
              onPressed: () => print('select'),
            ),
          ),
          ListTile(
            title: Text("Thèmes"),
            contentPadding: EdgeInsets.zero,
            leading: IconButton(
              icon: Icon(Icons.wallpaper),
              //onPressed: () => Ecran1(),
              onPressed: () => print('select'),
            ),
          ),
          ListTile(
            title: Text("Langues"),
            contentPadding: EdgeInsets.zero,
            leading: IconButton(
              icon: Icon(Icons.language),
              onPressed: () => print('select'),
            ),
          ),
          ListTile(
            title: Text("Droits"),
            contentPadding: EdgeInsets.zero,
            leading: IconButton(
              icon: Icon(Icons.accessible),
              onPressed: () => print('select'),
            ),
          ),
          ListTile(
            title: Text("Assistance"),
            contentPadding: EdgeInsets.zero,
            leading: IconButton(
              icon: Icon(Icons.help_center),
              onPressed: () => print('select'),
            ),
          )
        ],
      ),
    );
  }
}

class Apropos extends StatelessWidget {
  const Apropos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Description")),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Concepteur"),
            contentPadding: EdgeInsets.zero,
            leading: IconButton(
              icon: Icon(Icons.developer_board),
              onPressed: () => print('select'),
            ),
          ),
          ListTile(
            title: Text("Version"),
            contentPadding: EdgeInsets.zero,
            leading: IconButton(
              icon: Icon(Icons.update),
              onPressed: () => print('select'),
            ),
          ),
        ],
      ),
    );
  }
}

class Ecran1 extends StatelessWidget {
  final String title1, value;
  const Ecran1({Key? key, required this.title1, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title1,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
/*
//COMPTEUR//

// counters/${ID}
class Counter {
  final int QuantiteArticle;

  Counter(this.QuantiteArticle);
}

// counters/${ID}/Articles/${NUM}
class Shard {
  final int count;

  Shard(this.count);
}
//Le code suivant initialise un compteur distribué

Future<void> createCounter(DocumentReference ref, int QuantiteArticle) async {
  WriteBatch batch = FirebaseFirestore.instance.batch();

  // Initialize the counter document
  batch.set(ref, {'QuantiteArticle': QuantiteArticle});

  // Initialize each shard with count=0
  for (var i = 0; i < QuantiteArticle; i++) {
    final shardRef = ref.collection('Articles').doc(i.toString());
    batch.set(shardRef, {'count': 0});
  }

  // Commit the write batch
  await batch.commit();
}
//Pour incrémenter le compteur, choisissez un fragment aléatoire et incrémentez le nombre :

Future<void> incrementCounter(DocumentReference ref, int QuantiteArticle) async {
  // Select a shard of the counter at random

  final shardId = Random().nextInt(QuantiteArticle).toString();
  final shardRef = ref.collection('Articles').doc(shardId);

  // Update count
  await shardRef.update({'count': FieldValue.increment(1)});
}
//Pour obtenir le nombre total, interrogez toutes les partitions et additionnez leurs champs de nombre :

Future<int> getCount(DocumentReference ref) async {
  // Sum the count of each shard in the subcollection
  final Articles = await ref.collection('Articles').get();

  int totalCount = 0;

  Articles.docs.forEach(
    (doc) {
      totalCount += doc.data()['count'] as int;
    },
  );

  return totalCount;
}
*/

class Stock extends StatefulWidget {
  const Stock({Key? key}) : super(key: key);
  @override
  RetourStockState createState() => RetourStockState();
}

class RetourStockState extends State<Stock> {
  final Stream<QuerySnapshot> Afficher =
      FirebaseFirestore.instance.collection('Articles').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Afficher,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Erreur');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Chargement"),
          );
        }

        return Column(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> value =
                document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value['IdArticle'].toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ), /*
                          Text(
                            value['Nom'].toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            value['TypeArticle'].toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            value['UniteGestion'].toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            value['QuantiteArticle'].toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            value['PrixUnitaire'].toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            value['Date'].toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
