import 'package:deadline/model/color_model.dart';
import 'package:deadline/model/post_model.dart';
import 'package:deadline/pages/addpost_page.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Variables
  // ===========================================================================
  //List<Post> items = [];
  // ===========================================================================


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.kBackgroundColor,

      // Body
      // =======================================================================
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),

              // Text : Deadlines
              Text('Diary', style: TextStyle(fontSize: 45, color: ColorsModel.kFontColor, fontWeight: FontWeight.bold),),

              SizedBox(height: 30,),

              Expanded(
                child: ListView.builder(
                  itemCount: demoItems.length,
                  itemBuilder: (ctx, i) {
                    return _cardBuilder(demoItems[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // =======================================================================

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddPostPage.id);
        },
        backgroundColor: ColorsModel.kFontColor,
        child: Icon(Icons.add, size: 35, color: ColorsModel.kBlackColor,),
      ),
    );
  }

  // Card Builder
  // ===========================================================================
  Widget _cardBuilder(Post post) {
    return ExpansionCard(
      //backgroundColor: ColorsModel.kCardColor,
      borderRadius: 20,
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text : Title
            Text(post.title, style: TextStyle(color: ColorsModel.kBlackColor, fontWeight: FontWeight.bold),),

            // Text : Date
            Text(post.date, style: TextStyle(color: ColorsModel.kFontColor),),
          ],
        ),
      ),
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          child: Text(post.content, style: TextStyle(color: ColorsModel.kFontColor),)
        )
      ],
    );
  }
  // ===========================================================================


  // Demo items
  // ===========================================================================
  List<Post> demoItems = [
    Post('(Demo) Add a new post.', DateTime.now().toString().replaceRange(16, 26, ''), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    Post('(Demo) Add a new post.', DateTime.now().toString().replaceRange(16, 26, ''), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    Post('(Demo) Add a new post.', DateTime.now().toString().replaceRange(16, 26, ''), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    Post('(Demo) Add a new post.', DateTime.now().toString().replaceRange(16, 26, ''), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    Post('(Demo) Add a new post.', DateTime.now().toString().replaceRange(16, 26, ''), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
  ];

}