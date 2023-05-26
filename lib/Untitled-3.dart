class GetUserName étend StatelessWidget {    
  chaîne finale IDdocument ; 

  GetUserName ( this . documentId ) ;

  @passer outre
  Génération de widget ( contexte BuildContext ) {  
    Utilisateurs de CollectionReference = FirebaseFirestore . exemple . collection ( 'utilisateurs' ) ; 

    return FutureBuilder < DocumentSnapshot > ( 
      futur : les utilisateurs . doc ( IDdocument ) . obtenir ( ) ,
      constructeur :
          ( contexte BuildContext , AsyncSnapshot < DocumentSnapshot > instantané ) {  

        if ( instantané . hasError ) {  
          return Text ( "Quelque chose s'est mal passé" ) ; 
        }

        if ( instantané . hasData && ! instantané . données ! . existe ) {   
          return Text ( "Le document n'existe pas" ) ; 
        }

        if ( instantané . connectionState == ConnectionState . done ) {   
          Map < String , dynamic > data = snapshot . données ! . data ( ) as Map < String , dynamic > ;    
          return Text ( "Nom complet : ${ data [ 'full_name' ] } ${ data [ 'last_name' ] } " ) ;  
        }

        return Text ( "chargement" ) ; 
      } ,
    ) ;
  }
}