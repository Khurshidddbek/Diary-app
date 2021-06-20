import 'dart:io';

import 'package:deadline/model/color_model.dart';
import 'package:deadline/model/post_model.dart';
import 'package:deadline/services/pref_service.dart';
import 'package:deadline/services/rtdb_service.dart';
import 'package:deadline/services/stor_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatefulWidget {
  static final String id = 'addpost_page';

  const AddPostPage({Key key}) : super(key: key);

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  // Variables
  // ===========================================================================
  var _titleController = TextEditingController();
  var _contentController = TextEditingController();

  final picker = ImagePicker();
  File _image;

  bool _imageFromTheGallery = true; // From the gallery
  // ===========================================================================


  // Get Image
  // ===========================================================================
  Future _getImage() async {
    final pickedFile = await picker.getImage(source:_imageFromTheGallery ? ImageSource.gallery : ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
  // ===========================================================================


  // Add Post
  // ===========================================================================
  _addPost() async {
    String title = _titleController.text.toString();
    String content = _contentController.text.toString();
    String date = DateTime.now().toString();

    if (title.isEmpty) return ;

    EasyLoading.show();

    if (_image != null) {
      StoreService.uploadImage(_image).then((img_url) => {
        _apiAddPost(title, content, date, img_url),
      });
    } else {
      _apiAddPost(title, content, date, null);
    }
  }

  _apiAddPost(String title, String content, String date, String img_url) async {
    var id = await Prefs.getUserId();

    RTDBService.addPost(Post(id.toString(), title, date, content, img_url)).then((_) => {
      EasyLoading.dismiss(),
      Navigator.of(context).pop({'data' : 'Done'}),
    });
  }
  // ===========================================================================

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
                      controller: _titleController,
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
                    controller: _contentController,
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
                  onPressed: _addPost,
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
                      onTap: () {
                        setState(() {
                          _imageFromTheGallery = false;
                        });
                        _getImage();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                              width: 70,
                              child: _image == null ? Image.asset('assets/icons/tool_icons/instagram_logo_icon.png', height: 70, width: 70,) : Image.file(_image, fit: BoxFit.cover,)
                          ),

                          Text('Camera', style: TextStyle(color: ColorsModel.kFontColor, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),

                    SizedBox(width: 30,),

                    // Button : Gallery
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _imageFromTheGallery = true;
                        });
                        _getImage();
                        },
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                              width: 70,
                              child: _image == null ? Image.asset('assets/icons/tool_icons/image_icon.png', height: 70, width: 70,) : Image.file(_image, fit: BoxFit.cover,)
                          ),

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


  //============================================================================
  @override
  void dispose() {
    // TODO: implement dispose
    _titleController = null;
    _contentController = null;
    _image = null;

    EasyLoading.dismiss();

    super.dispose();
  }
}
