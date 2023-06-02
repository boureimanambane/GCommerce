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

//widget compteur
class Counter {
  final int numShards;

  Counter(this.numShards);
}

// compteurs/${ID}/shards/${NUM}
class Shard {
  final int count;

  Shard(this.count);
}
//Le code suivant initialise un compteur

Future<void> createCounter(DocumentReference ref, int numShards) async {
  WriteBatch batch = FirebaseFirestore.instance.batch();
// Initialise le document compteur

  batch.set(ref, {'numShards': numShards});

  // Initialise chaque fragment avec count=0
  for (var i = 0; i < numShards; i++) {
    final shardRef = ref.collection('shards').doc(i.toString());
    batch.set(shardRef, {'count': 0});
  }
  // Valide le batch d'écriture
  await batch.commit();
}
//Pour incrémenter le compteur, choisissez un fragment aléatoire et incrémentez le nombre :

Future<void> incrementCounter(DocumentReference ref, int numShards) async {
// Sélection aléatoire d'un fragment du compteur

  final shardId = Random().nextInt(numShards).toString();
  final shardRef = ref.collection('shards').doc(shardId);
// Mettre à jour le nombre
  await shardRef.update({'count': FieldValue.increment(1)});
}

//Pour obtenir le nombre total, interrogez toutes les partitions et additionnez leurs champs de nombre
Future<int> getCount(DocumentReference ref) async {
  // Somme du nombre de chaque fragment dans la sous-collection
  final shards = await ref.collection('shards').get();

  int totalCount = 0;

  shards.docs.forEach(
    (doc) {
      totalCount += doc.data()['count'] as int;
    },
  );

  return totalCount;
}
