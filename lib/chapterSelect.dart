import 'package:flutter/material.dart';
import 'package:dqbuilders_companion/cantlinList.dart';

class ChapterSelect extends StatefulWidget {
	@override
	_ChapterSelectState createState() => _ChapterSelectState();
}

class _ChapterSelectState extends State<ChapterSelect> {
	@override
	Widget build(BuildContext context) {
		// This method is rerun every time setState is called, for instance as done
		// by the _incrementCounter method above.
		//
		// The Flutter framework has been optimized to make rerunning build methods
		// fast, so that you can just rebuild anything that needs updating rather
		// than having to individually change instances of widgets.
		return Scaffold(
			appBar: AppBar(
				// Here we take the value from the MyHomePage object that was created by
				// the App.build method, and use it to set our appbar title.
				title: Text("Chapter Select", style: Theme.of(context).textTheme.title,),
			),
			body: _buildChapterList(),
		);
	}

	Widget _buildChapterList() {
		List<Widget> rows = new List();
		rows.add(_buildChapterRow("Chapter 1", "Cantlin", "assets/grass.jpg"));
		rows.add(_buildChapterRow("Chapter 2", "Rimuldar", "assets/swamp.jpg"));
		rows.add(_buildChapterRow("Chapter 3", "Kol & Galenholm", "assets/fireice.jpg"));
		rows.add(_buildChapterRow("Chapter 4", "Tantegel", "assets/sand.jpg"));
		rows.add(_buildChapterRow("Freeplay", "Terra Incognita", "assets/buildingblocks.jpg"));
		return Container(
			decoration: BoxDecoration(
				image: DecorationImage(
					image: AssetImage("assets/gamePic.jpg"),
						fit: BoxFit.cover,
				)
			),
		  padding: EdgeInsets.symmetric(horizontal: 15.0),
		  child: Container(
			  color: Colors.white54,
		    child: ListView.separated(
		    	padding: const EdgeInsets.all(10.0),
		    	itemBuilder: (context, i) {
		    		return rows[i];
		    	},
		    	separatorBuilder: (context, i) {
		    		return Divider(height: 10.0, color: Colors.white70,);
		    	},
		    	itemCount: 5
		    ),
		  ),
		);
	}

	Widget _buildChapterRow(String chapterText, String locationText, String backgroundImage) {
		return Container(
			decoration: new BoxDecoration(
				border: Border(
					top: BorderSide(width: 4.0, color: Colors.white),
					bottom: BorderSide(width: 4.0, color: Colors.white),
					left: BorderSide(width: 4.0, color: Colors.white),
					right: BorderSide(width: 4.0, color: Colors.white),
				),
				borderRadius: BorderRadius.circular(8.0),
				image: new DecorationImage(
					fit: BoxFit.cover,
					image: new AssetImage(
						backgroundImage,
					)
				)
			),
			child: Material(
				type: MaterialType.transparency,
			  borderRadius: BorderRadius.circular(8.0),
			  child: InkWell(
				  borderRadius: BorderRadius.circular(8.0),
				  splashColor: Colors.white70,
			    onTap: () {
				  	print(chapterText + " selected.");
				  	Navigator.of(context).push(
						new MaterialPageRoute(
							builder: (BuildContext context) {
								return CantlinListPage();
							}
						)
					);
				 },
			    child: Padding(
			      padding: const EdgeInsets.all(8.0),
			      child: Column(
			      	crossAxisAlignment: CrossAxisAlignment.start,
			      	children: <Widget>[
			      		Text(chapterText + ':', style: Theme.of(context).textTheme.subtitle,),
			      		Text(locationText, style: Theme.of(context).textTheme.subhead,),
			      	],
			      ),
			    ),
			  ),
			),
		);
	}
}