int q = 0;

    final snapShot = await Firestore.instance.collection('cart').document("LIihBLtbfuJ8Dy640DPd").get();
    if(snapShot.exists){
      q=q+1;


    }
    Firestore.instance.runTransaction((Transaction transaction) async {
      await transaction.update(
          Firestore.instance
              .collection("cart")
              .document("LIihBLtbfuJ8Dy640DPd"),
          {
            foodItem.name: {
              'itemName': foodItem.name,
              'imgUrl': foodItem.imageAssetPath,
              'itemPrice': foodItem.price,
              'quantity': q,
            }
          });

    });