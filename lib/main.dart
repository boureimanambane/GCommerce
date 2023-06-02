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
  //Initialisation de Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(home: MyApp()));
}

//Thème pour l'application
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

//Classe principal(Widget)
class MyApp extends StatefulWidget {
  @override
  Connexion createState() => Connexion();
}

//Widget Connexion
class Connexion extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes().theme1,
      //Zone de recherche
      title: "Connexion",
      home: Scaffold(
        appBar: AppBar(
          //Nom de la page
          title: Text("G_COMMERCE"),
        ),
        //Vue un seul Widget
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
                  decoration: InputDecoration(hintText: "Articlesname"),
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
                // Text du button,
                child: Text("Login"),
                onPressed: () {
                  // Action du button
                  Navigator.push(
                      context,
                      MaterialPageRoute(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
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

// Widget Article
class Articles extends StatelessWidget {
  //Declaration des variables
  String value = '';
  String? IdArticle = '';
  String? Nom = '';
  String? TypeArticle = '';
  String? UniteGestion = '';
  int? QuantiteArticle;
  String? PrixUnitaire = '';
  int? Date;
  //Declaration des variables controleurs
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
    // Créez une CollectionReference appelée Articles qui fait référence à la collection firestore
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
        //Formulaire d'enregistrement des données
        body: Form(
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
                  //Affectation du controleur
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
                    //Affectation du controleur
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
                    //Affectation du controleur
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
                    //Affectation du controleur
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
                    //Affectation du controleur
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
                    //Affectation du controleur
                    controller: DateController),
                ElevatedButton(
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //Ajout des données la collection Articles
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
                    //Sortie du formulaire après l'evnoi des données
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

//Classe MyHomePage
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text("Acceuil"),
        ),
        //Vue en Layout(Grid)
        body: GridView.count(
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          crossAxisCount: 2,
          //Interface graphique
          children: <Widget>[
            Column(children: <Widget>[
              const Text('Articles'),
              IconButton(
                icon: Icon(Icons.production_quantity_limits),
                color: Colors.blue,
                splashColor: Colors.blueGrey,
                iconSize: 80,
                onPressed: () {
                  // Widget de sortie Articles()
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
                  //Widget de sortie Stock()
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Stock()),
                    // builder: (context) => Recuperer()),
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
                  //Widget de sortie Vente()
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
                  //Widget de sortie Articles()
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
                  //Widget de sortie Parametres()
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
                  //Widget de sortie Apropos()
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

//Classe Parametres
class Parametres extends StatelessWidget {
  const Parametres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paramètres")),
      //Vue en mode liste
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
          //Liste des composants de paramètres
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

//Widget Apropos
class Apropos extends StatelessWidget {
  const Apropos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Description")),
      //Vue en mode liste
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

//Classe Ecran
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
//Widget Stock
class Stock extends StatefulWidget {
  const Stock({Key? key}) : super(key: key);
  @override
  RetourStockState createState() => RetourStockState();
}

//Widget de recuperation deStock
class RetourStockState extends State<Stock> {
  final Stream<QuerySnapshot> Afficher =
      FirebaseFirestore.instance.collection('Articles').snapshots();
  @override
  Widget build(BuildContext context) {
    final List<Articles> list = [];

    getArticles() async {
      final snapshot =
          await FirebaseFirestore.instance.collection('Articles').get();
    }

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
                          ),
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
                          ),
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
/*
class Recuperer extends StatefulWidget {
  const Recuperer({Key? key}) : super(key: key);
  @override
  RetourRecupererState createState() => RetourRecupererState();
}

class RetourRecupererState extends State<Recuperer> {
  final Stream<QuerySnapshot> Afficher =
      FirebaseFirestore.instance.collection('Articles').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Afficher,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          print('myString');
          return CircularProgressIndicator();
        }

        return Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text('Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Age',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Gender',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Birthday',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Phone Number',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Triage Result',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Full Information',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                  ],
                  rows: snapshot.data!.docs.map((DocumentSnapshot doc) {
                    final rowData = doc.data() as Map<String, dynamic>;

                    // Return the corresponding string based on the value of "Triage Result"
                    String triageResult = rowData['triage_result'].toString();
                    List<String> listSymptoms =
                        List<String>.from(rowData['Symptoms']);

                    if (rowData['triage_result'] == 'A') {
                      triageResult = 'Emergency Case';
                      //print(triageResult);
                    } else if (rowData['triage_result'] == 'B') {
                      triageResult = 'Priority Case';
                    } else if (rowData['triage_result'] == 'C') {
                      triageResult = 'Non-urgent Case';
                    }

                    // create view button widget
                    final viewButton = Afficher(
                        context, rowData, doc, triageResult, listSymptoms);

                    return DataRow(cells: [
                      DataCell(Center(child: Text(rowData['Name']))),
                      DataCell(Center(child: Text(rowData['Age'].toString()))),
                      DataCell(Center(child: Text(rowData['Sex']))),
                      DataCell(Center(child: Text(rowData['Birthday']))),
                      DataCell(Center(child: Text(rowData['Contact Number']))),
                      DataCell(Center(child: Text(triageResult))),
                      DataCell(Center(child: viewButton)),
                    ]);
                  }).toList(), //.sublist(0, numberOfRows),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('5'),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('10'),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('All'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}*/
