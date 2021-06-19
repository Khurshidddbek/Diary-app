import 'package:deadline/model/color_model.dart';
import 'package:flutter/material.dart';

class AddPostPage extends StatefulWidget {
  static final String id = 'addpost_page';

  const AddPostPage({Key key}) : super(key: key);

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.kBackgroundColor,

      // Body
      // =======================================================================
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),

                // Text : Add post
                Text('Add post', style: TextStyle(color: ColorsModel.kFontColor, fontWeight: FontWeight.bold, fontSize: 45),),

                SizedBox(height: 30,),

                // TextField : Title
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorsModel.kFontColor,),
                    color: ColorsModel.kCardColor,
                  ),
                  child: Center(
                    child: TextField(
                      style: TextStyle(fontWeight: FontWeight.bold, color: ColorsModel.kBlackColor, fontSize: 18),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                // TextField : Content
                Container(
                  height: 300,
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorsModel.kFontColor,),
                    color: ColorsModel.kCardColor,
                  ),
                  child: TextField(
                      maxLines: 100,
                      style: TextStyle(color: ColorsModel.kBlackColor, fontSize: 18),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Content',
                      ),
                    ),
                  ),

                SizedBox(height: 15,),

                // Button : Add post
                FlatButton(
                  onPressed: () {},
                  height: 45,
                  minWidth: double.infinity,
                  color: ColorsModel.kFontColor,
                  child: Text('ADD POST', style: TextStyle(color: ColorsModel.kBlackColor, fontWeight: FontWeight.bold, fontSize: 16),),
                ),

                SizedBox(height: 20,),

                // Text : Add
                Row(
                  children: [
                    Expanded(child: Divider(color: ColorsModel.kCardColor, thickness: 2,)),

                    Text('  Add  ', style: TextStyle(color: ColorsModel.kFontColor),),

                    Expanded(child: Divider(color: ColorsModel.kCardColor, thickness: 2, )),
                  ],
                ),

                SizedBox(height: 20,),

                // Buttons : Gallery || Camera
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Button : Camera
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.asset('assets/icons/tool_icons/instagram_logo_icon.png', height: 70, width: 70,),

                          Text('Camera', style: TextStyle(color: ColorsModel.kFontColor, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),

                    SizedBox(width: 30,),

                    // Button : Gallery
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.asset('assets/icons/tool_icons/image_icon.png', height: 70, width: 70,),

                          Text('Gallery', style: TextStyle(color: ColorsModel.kFontColor, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // =======================================================================

    );
  }
}
