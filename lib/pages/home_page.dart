import 'package:deadline/model/color_model.dart';
import 'package:deadline/model/post_model.dart';
import 'package:deadline/pages/addpost_page.dart';
import 'package:deadline/pages/signin_page.dart';
import 'package:deadline/services/dial_service.dart';
import 'package:deadline/services/pref_service.dart';
import 'package:deadline/services/rtdb_service.dart';
import 'package:deadline/services/utils_service.dart';
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
  List<Post> items = [];
  // ===========================================================================


  // Load Posts
  // ===========================================================================
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  _apiGetPost() async {
    var id = await Prefs.getUserId();

    RTDBService.getPosts(id).then((posts) => {
      _respPost(posts),
    });
  }

  _respPost(List<Post> posts) {
    setState(() {
      items = posts;
    });
  }
  // ==========================================================================


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

              // Text : Diary || Button : Log out
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Diary', style: TextStyle(fontSize: 45, color: ColorsModel.kFontColor, fontWeight: FontWeight.bold),),

                  // Button : Log out
                  GestureDetector(
                    onTap: () {
                      Utils.fireToast('Press and hold longer.');
                    },
                    onLongPress: () {
                      var dialog = CustomAlertDialog(
                          title: "Logout",
                          message: "Are you sure, do you want to logout?",
                          onPostivePressed: () {
                            Prefs.removeUserId();
                            Navigator.pushReplacementNamed(context, SignInPage.id);
                          },
                          positiveBtnText: 'Yes',
                          negativeBtnText: 'No');
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => dialog);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.logout, color: ColorsModel.kFontColor,),

                        Text('Logout', style: TextStyle(color: ColorsModel.kFontColor, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30,),

              Expanded(
                child: ListView.builder(
                  itemCount: items.isEmpty ? 5 : items.length,
                  itemBuilder: (ctx, i) {
                    return _cardBuilder(items.isEmpty ? demoItems[i] : items[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // =======================================================================

      floatingActionButton: FloatingActionButton(
        onPressed: _openDetail,
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
          child: post.img_url != null ?
          Column(
            children: [
              Text(post.content, style: TextStyle(color: ColorsModel.kFontColor),),

              SizedBox(height: 5,),

              Divider(height: 5, color: ColorsModel.kCardColor,),

              SizedBox(height: 5,),

              Container(
                width: double.infinity,
                child: Image.network(
                  post.img_url,
                  loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 5,),
            ],
          ) :
          Text(post.content, style: TextStyle(color: ColorsModel.kFontColor),),
        )
      ],
    );
  }
  // ===========================================================================


  _openDetail() async {
    Map result = await Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return new AddPostPage();
      }
    ));

    if (result != null && result.containsKey('data')) {
      Utils.fireToast(result['data']);
      _apiGetPost();
    }
  }

  // Demo items
  // ===========================================================================
  List<Post> demoItems = [
    Post('', '(Demo) Add a new post.', DateTime.now().toString().replaceRange(16, 26, ''), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Khurshidddbek Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'https://kutskokitchen.com/wp-content/uploads/2020/06/Popular-Grey-And-White-Kitchen-Cabinet-Picture-from-Pinterest.jpg'),
    Post('', '(Demo) Add a new post.', DateTime.now().toString().replaceRange(16, 26, ''), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', ''),
    Post('', '(Demo) Add a new post.', DateTime.now().toString().replaceRange(16, 26, ''), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', ''),
    Post('', '(Demo) Add a new post.', DateTime.now().toString().replaceRange(16, 26, ''), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', ''),
    Post('', '(Demo) Add a new post.', DateTime.now().toString().replaceRange(16, 26, ''), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', ''),
  ];

}