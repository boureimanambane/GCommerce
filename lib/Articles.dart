class Articles extends StatelessWidget {
  @override
  final ReferenceDatabase = FirebaseFirestore.instance;
  final IdArticleController = TextEditingController();
  final NomController = TextEditingController();
  final TypeArticleController = TextEditingController();
  final UniteGestionController = TextEditingController();
  final QuantiteArticleController = TextEditingController();
  final PrixUnitaireController = TextEditingController();
  final DateController = TextEditingController();
  String value = '';
  String IdArticle = '';
  String Nom = '';
  String TypeArticle = '';
  String UniteGestion = '';
  String QuantiteArticle = '';
  String PrixUnitaire = '';
  String Date = '';
  //Articles(this.IdArticle, this.Nom, this.TypeArticle,  this.UniteGestion, this.QuantiteArticle, this.PrixUnitaire, this.Date);
  final formkey = new GlobalKey<FormState>();
  enregistrerForm() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      debugPrint('$IdArticle');
      debugPrint('$Nom');
      debugPrint('$TypeArticle');
      formkey.currentState!.reset();
    } else {
      debugPrint('Erreur');
    }
  }

  Widget build(BuildContext context) {
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
          key: formkey,
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
                    FirebaseFirestore.instance
                        .collection('Articles')
                        .doc("Id")
                        .set({
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
