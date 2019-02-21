import 'package:flutter/material.dart';

class SlideAndFadeRoute extends PageRouteBuilder {
	final Widget widget;
	SlideAndFadeRoute({this.widget})
		: super(
		pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
			return widget;
		},
		transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
			return new SlideTransition(
				position: new Tween<Offset>(
					begin: const Offset(1.0, 0.0),
					end: Offset.zero,
				).animate(animation),
				child: FadeTransition(
					opacity: animation,
					child: child
				),
			);
		}
	);
}

class CreditsPage extends StatefulWidget {
	@override
	CreditsPageState createState() => new CreditsPageState();
}

class CreditsPageState extends State<CreditsPage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
			backgroundColor: Colors.white,
			title: Text("Credits page"),
		),
		body: Container(),
		);
	}
}

Widget settingsIcon(context) {
	List<Choice> _choices = <Choice>[
		Choice(title: 'Get Ad-Free', icon: Icons.monetization_on),
		Choice(title: 'Credits', icon: Icons.bookmark,),
	];

	return PopupMenuButton<Choice>(
		onSelected: null,
		itemBuilder: (BuildContext context) {
			return _choices.map((Choice choice) {
				return PopupMenuItem<Choice>(
					value: choice,
					child: GestureDetector(
					  child: Row(
					  	crossAxisAlignment: CrossAxisAlignment.center,
					  	children: <Widget>[
					  		Icon(choice.icon, color: Colors.black54,),
					  		Padding(
					  		  padding: const EdgeInsets.only(left: 7.0),
					  		  child: Text(choice.title, style: TextStyle(color: Colors.grey.shade800, inherit: false, fontSize: 20, fontWeight: FontWeight.w500),),
					  		),
					  	],
					  ),
					),
				);
			}).toList();
		},
	);
}

class Choice {
	const Choice({this.title, this.icon,});

	final String title;
	final IconData icon;
}

