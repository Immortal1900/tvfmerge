import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' ;
import 'package:tvf/pickfiles/pickimage.dart';

import 'package:video_player/video_player.dart';

void main(){
  runApp(pvideo());
}
class pvideo extends StatefulWidget {
  @override
  _pickvideoState createState() => _pickvideoState();
}

List <VideoPlayerController> vcontroller=List <VideoPlayerController>();

bool videopicked=false;
String vurl="https://firebasestorage.googleapis.com/v0/b/sampletvf-8aa59.appspot.com/o/blogposts%2FUID%2Fvideos%2F75F046485.mp4?alt=media&token=72cd750a-a061-4c75-8497-8d4865ea23bd";
String vurl2="https://firebasestorage.googleapis.com/v0/b/sampletvf-8aa59.appspot.com/o/blogposts%2FUID%2Fvideos%2FTVBJAsX5Y.mp4?alt=media&token=48050d25-f7bb-47e4-b7c6-e78145ccca91";
List <String> vurlarr=new List();
//List <Future> futureController=new List();
class _pickvideoState extends State<pvideo> {

  void initState(){
    print("INITSTATE");
    vurlarr.add(vurl);
   // vurlarr.add(vurl2);
    setState(() {
      videopicked=true;
    });
    print(vurlarr);
    super.initState();
  }


  Future initializeplayer() async{
    print("INITIALIZEPLAYER CALLED");

    for(int i=0;i<vurlarr.length;i++){
      print('${vurlarr[0]}');
//     futureController[i]=vcontroller[i].initialize();
      vcontroller.add(VideoPlayerController.network(vurlarr[i])..initialize().then((_){setState(() {  });}));
      vcontroller[i].play();
      vcontroller[i].setVolume(0);
      vcontroller[i].setLooping(true);
      print(vcontroller[i]);
    }}
  @override
  Widget build(BuildContext context) {
    if(videopicked){
      initializeplayer();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Imagepicker"),
        ),
        body: FutureBuilder(builder:( BuildContext context, AsyncSnapshot snapshot){

          return  Center(
              child:vurlarr==null? Text("VIDEO is not SELECTED")
                  :        Container(
                height: 400,
                 width: MediaQuery. of(context). size. width,
                color: Colors.indigo,
                child:  GridView.builder(
                  gridDelegate:
                  new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: vurlarr.length,
                  itemBuilder: (context, index) {
                          return
                            Stack(
                              children: <Widget>[
                                AspectRatio(
                                  aspectRatio:vcontroller[index].value.aspectRatio ,
                                  child: VideoPlayer(vcontroller[index]),
                                ),
                                Center(
                                  child: RaisedButton(
                                    onPressed: (){


                                      setState(() {
                                      if(vcontroller[index].value.isPlaying){
                                        print(vcontroller[index]);
                                        print("PAUSED");
                                        vcontroller[index].pause();
                                      }
                                      else{
                                        vcontroller[index].play();
                                        print("PLAY");
                                      }
                                    });},
                                  child: Icon(vcontroller[index].value.isPlaying ?Icons.pause:Icons.play_arrow)
                                  ),
                                )

                              ],

                            )
                    ;

                                            },
                ),
              )
          );

        }
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10),
                child:FloatingActionButton(
                  onPressed: () {
                    print("POP CONTEXT");
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.check),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  heroTag: null,
                ),
              ),

            ],
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
