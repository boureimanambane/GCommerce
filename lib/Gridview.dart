import 'package:flutter/material.dart';

void main() {
runApp(GeeksForGeeks());
}

class Interfaces extends StatelessWidget {

// This widget is the root of your application
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
		backgroundColor: Colors.black,
		appBar: AppBar(
		backgroundColor: Colors.blueGrey[900],
		title: Center(
			child: Text(
			'Flutter GridView Demo',
			style: TextStyle(
				color: Colors.blueAccent,
				fontWeight: FontWeight.bold,
				fontSize: 30.0,
			),
			),
		),
		),
		body: GridView.count(
		crossAxisCount: 2,
		crossAxisSpacing: 10.0,
		mainAxisSpacing: 10.0,
		shrinkWrap: true,
		children: List.generate(20, (index) {
			return Padding(
				padding: const EdgeInsets.all(10.0),
				child: Container(
				decoration: BoxDecoration(
					image: DecorationImage(
					image: AssetImage('assets/images/Produit.png'),
					fit: BoxFit.cover,
					),
					borderRadius:
					BorderRadius.all(Radius.circular(20.0),),
          
				),
				),
			);
			},),
		),
	),
	);
}
}
