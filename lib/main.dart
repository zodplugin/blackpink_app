import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:blackpink_app/detailpage.dart';
import 'package:blackpink_app/detailpagealbum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blackpink_app/model/blackpink_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLACKPINK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: LayoutBuilder(builder : (BuildContext context, BoxConstraints constraints){
        if (constraints.maxWidth <= 1000){
          return HomePage();
        }else {
          return WebHomePage(gridCount: 5);
        }
      }),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late AnimationController iconController;
    bool isAnimated = false;
    bool showPlay = true;
    bool showPause = false;

    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

    @override
    void initState(){
      super.initState();
      iconController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      );

      audioPlayer.open(Audio('music/prettysavage.mp3'),autoStart: false,showNotification: true,volume: 0.2);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.pinkAccent,
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: Text(
              "BLACKPINK",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.pinkAccent,
              )
          ),
          // leading: IconButton(
          //   icon: Icon(Icons.menu, color: Colors.pinkAccent,),
          //   onPressed: (){},
          // ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("WELCOME",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff7f7f7f),
                          )
                      ),
                      Text('#BlackpinkInYourArea',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.pinkAccent,
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('images/groupblackpink1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Blackpink (Korean: 블랙핑크; commonly stylized as BLACKPINK or BLΛƆKPIИK) is a South Korean girl group formed by YG Entertainment, consisting of members Jisoo, Jennie, Rosé, and Lisa. The group debuted in August 2016 with their single album Square One,"
                            "which featured 'Whistle' and 'Boombayah', their first number-one entries on South Korea's Gaon Digital Chart and the Billboard World Digital Song Sales chart, respectively.",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.pinkAccent,
                        ),
                        textAlign: TextAlign.justify,
                      ),

                      Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: <Widget>[
                              Text('LATEST SONG',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                              Container(
                                height: 300.0,
                                margin: EdgeInsets.only(top: 20),
                                child: Column(
                                    children: <Widget>[
                                      Card(
                                        color: Colors.pinkAccent,
                                        child: Column(
                                          children: [
                                            Image.asset('images/lovesickgirl.jpg',
                                              width: 200,
                                              height: 200,
                                              fit: BoxFit.cover,
                                            ),
                                            Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
                                              child: Text('Pretty Savage',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                          InkWell(child: Icon(CupertinoIcons.backward_fill,color: Colors.pinkAccent),onTap: (){
                                            audioPlayer.seekBy(Duration(seconds: -10));
                                          },),
                                          GestureDetector(
                                            onTap: () {
                                              AnimateIcon();
                                            },
                                            child: AnimatedIcon(
                                              icon: AnimatedIcons.play_pause,
                                              progress: iconController,
                                              size: 50,
                                              color: Colors.pinkAccent,
                                            ),
                                          ),
                                          InkWell(child: Icon(CupertinoIcons.forward_fill,color: Colors.pinkAccent),onTap: (){
                                            audioPlayer.seekBy(Duration(seconds: 10));
                                            audioPlayer.seek(Duration(seconds: 10));
                                            audioPlayer.next();
                                          },
                                        ),
                                    ],
                                  ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 0, bottom: 20),
                          child: Column(
                            children: <Widget>[
                              Text('Members',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                              Container(
                                height: 250.0,
                                margin: EdgeInsets.only(top: 20),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: DataBlackpinkList.map((item){
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return Screen(item: item);
                                            }));
                                          },
                                          child: Card(
                                            color: Colors.pinkAccent,
                                            child: Column(
                                              children: [
                                                Image.asset(item.imageAsset,
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                                Padding(padding: EdgeInsets.only(top: 5),
                                                  child: Text(item.name,
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: <Widget>[
                              Text('Albums',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                              Container(
                                height: 250.0,
                                margin: EdgeInsets.only(top: 20),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: DataAlbumBlackpinkList.map((item){
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return DetailPageAlbum(item: item);
                                            }));
                                          },
                                          child: Card(
                                            color: Colors.pinkAccent,
                                            child: Column(
                                              children: [
                                                Image.asset(item.imageAsset,
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                                Padding(padding: EdgeInsets.only(top: 5),
                                                  child: Text(item.name,
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text('AGENCY',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                                Container(
                                    height: 250.0,
                                    margin: EdgeInsets.only(top: 20),
                                    child: InkWell(
                                        onTap: (){
                                        },
                                        child: Card(
                                          color: Colors.pinkAccent,
                                          child: Column(
                                            children: [
                                              Image.asset('images/yg.jpg',
                                                width: 500,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(padding: EdgeInsets.only(top: 5),
                                                child: Text('YG ENTERTAINMENT',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    )
                                ),
                              ],
                            ),
                          )
                      ),
                    ]
                )
            )
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text('BLACKPINK',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Member',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.pinkAccent,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Album',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.pinkAccent,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    }

  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;
      if(isAnimated)
      {
        iconController.forward();
        audioPlayer.play();
      }else{
        iconController.reverse();
        audioPlayer.pause();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    iconController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }



}


class WebHomePage extends StatefulWidget{
  final int gridCount;
  WebHomePage({required this.gridCount});
  @override
  _WebHomePageState createState() => _WebHomePageState(gridCount: gridCount);
}

class _WebHomePageState extends State<WebHomePage> with SingleTickerProviderStateMixin{

  late AnimationController iconController;
  bool isAnimated = false;
  bool showPlay = true;
  bool showPause = false;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  final int gridCount;
  _WebHomePageState({required this.gridCount});

  get weightheigh => (gridCount==5 ? (MediaQuery.of(context).size.height/4)+50 : MediaQuery.of(context).size.height/6);



  @override
  void initState(){
    super.initState();
    iconController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    audioPlayer.open(Audio('music/prettysavage.mp3'),autoStart: false,showNotification: true,volume: 0.2);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.pinkAccent,
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
            "BLACKPINK",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.pinkAccent,
            )
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.menu, color: Colors.pinkAccent,),
        //   onPressed: (){
        //     Scaffold.of(context).openDrawer();
        //   },
        //   tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        // ),
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("WELCOME",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff7f7f7f),
                        )
                    ),
                    Text('#BlackpinkInYourArea',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.pinkAccent,
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'images/groupblackpink1.jpg',
                            fit: BoxFit.cover,
                          ),
                        )
                      ),
                    Text(
                      "Blackpink (Korean: 블랙핑크; commonly stylized as BLACKPINK or BLΛƆKPIИK) is a South Korean girl group formed by YG Entertainment, consisting of members Jisoo, Jennie, Rosé, and Lisa. The group debuted in August 2016 with their single album Square One,"
                          "which featured 'Whistle' and 'Boombayah', their first number-one entries on South Korea's Gaon Digital Chart and the Billboard World Digital Song Sales chart, respectively.",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.pinkAccent,
                      ),
                      textAlign: TextAlign.justify,
                    ),

                    Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          children: <Widget>[
                            Text('LATEST SONG',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            Container(
                              height: 500.0,
                              margin: EdgeInsets.only(top: 20),
                              child: Column(
                                children: <Widget>[
                                  Card(
                                    color: Colors.pinkAccent,
                                    child: Column(
                                      children: [
                                        Image.asset('images/lovesickgirl.jpg',
                                          width: 300,
                                          height: 300,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
                                          child: Text('Pretty Savage',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(child: Icon(CupertinoIcons.backward_fill,color: Colors.pinkAccent),onTap: (){
                                        audioPlayer.seekBy(Duration(seconds: -10));
                                      },),
                                      GestureDetector(
                                        onTap: () {
                                          AnimateIcon();
                                        },
                                        child: AnimatedIcon(
                                          icon: AnimatedIcons.play_pause,
                                          progress: iconController,
                                          size: 50,
                                          color: Colors.pinkAccent,
                                        ),
                                      ),
                                      InkWell(child: Icon(CupertinoIcons.forward_fill,color: Colors.pinkAccent),onTap: (){
                                        audioPlayer.seekBy(Duration(seconds: 10));
                                        audioPlayer.seek(Duration(seconds: 10));
                                        audioPlayer.next();
                                      },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 0, bottom: 20),
                        child: Column(
                          children: <Widget>[
                            Text('Members',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            Container(
                              height: 550.0,
                              margin: EdgeInsets.only(top: 20),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: GridView.count(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  shrinkWrap: true,
                                  primary: true,
                                  physics: BouncingScrollPhysics(),
                                  children: DataBlackpinkList.map((item) {
                                    return InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return Screen(item: item);
                                          }));
                                        },
                                        child: Card(
                                          color: Colors.pinkAccent,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Image.asset(item.imageAsset,
                                                    fit: BoxFit.cover,
                                                  )

                                              ),
                                              SizedBox(height: 5),
                                              Padding(padding: EdgeInsets.only(top: 5),
                                                  child: Center(
                                                    child: Text(item.name,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  )
                                              ),
                                              SizedBox(height: 7)
                                            ],
                                          ),
                                        )
                                    );
                                  }).toList(),
                                ),
                              )
                            ),
                          ],
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          children: <Widget>[
                            Text('Albums',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            Container(
                              height: 850.0,
                              margin: EdgeInsets.only(top: 20),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: GridView.count(
                                  crossAxisCount: gridCount,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  shrinkWrap: true,
                                  primary: true,
                                  physics: BouncingScrollPhysics(),
                                  children: DataAlbumBlackpinkList.map((item) {
                                    return InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return DetailPageAlbum(item: item);
                                          }));
                                        },
                                        child: Card(
                                          color: Colors.pinkAccent,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Image.asset(item.imageAsset,
                                                  fit: BoxFit.cover,
                                                )

                                              ),
                                              SizedBox(height: 5),
                                              Padding(padding: EdgeInsets.only(top: 5),
                                                child: Center(
                                                  child: Text(item.name,
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                )
                                              ),
                                              SizedBox(height: 7)
                                            ],
                                          ),
                                        )
                                    );
                                  }).toList(),
                                ),
                              )
                            ),
                          ],
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text('AGENCY',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                              Container(
                                  height: 250.0,
                                  margin: EdgeInsets.only(top: 20),
                                  child: InkWell(
                                      onTap: (){
                                      },
                                      child: Card(
                                        color: Colors.pinkAccent,
                                        child: Column(
                                          children: [
                                            Image.asset('images/yg.jpg',
                                              width: 500,
                                              height: 200,
                                              fit: BoxFit.cover,
                                            ),
                                            Padding(padding: EdgeInsets.only(top: 5),
                                              child: Text('YG ENTERTAINMENT',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  )
                              ),
                            ],
                          ),
                        )
                    ),
                  ]
              )
          )
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text('BLACKPINK',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Member',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.pinkAccent,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Album',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.pinkAccent,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;
      if(isAnimated)
      {
        iconController.forward();
        audioPlayer.play();
      }else{
        iconController.reverse();
        audioPlayer.pause();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    iconController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }



}