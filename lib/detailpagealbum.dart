import 'package:flutter/material.dart';
import 'model/blackpink_model.dart';

class DetailPageAlbum extends StatelessWidget{
  final DataAlbumBlackpink item;
  const DetailPageAlbum({required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(builder: (BuildContext builder, BoxConstraints constraints){
        if (constraints.maxWidth <= 1000) {
          return DetailPageAlbumMobile(item: item);
        } else {
          return DetailPageAlbumWeb(item: item);
        }
    });
  }
}


class DetailPageAlbumMobile extends StatelessWidget{
  final DataAlbumBlackpink item;
  const DetailPageAlbumMobile({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.pinkAccent),
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
      ),
      body: SingleChildScrollView(
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item.imageAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              item.name,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pinkAccent
                              ),
                            ),
                          ),
                        ),

                        Text(
                          'Release Date : '+item.dateRelease,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.pinkAccent
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: <Widget>[
                                Text('Song',
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
                                    children: item.songList.map((data){
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: InkWell(
                                            onTap: (){
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
                                                    child: Text(data,
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

                      ],
                    ),
                  ),

                ]
            ),
          )
      ),
    );
  }
}


class DetailPageAlbumWeb extends StatelessWidget{
  final DataAlbumBlackpink item;
  const DetailPageAlbumWeb({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.pinkAccent),
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
      ),
      body: SingleChildScrollView(
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item.imageAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              item.name,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pinkAccent
                              ),
                            ),
                          ),
                        ),

                        Text(
                          'Release Date : '+item.dateRelease,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.pinkAccent
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: <Widget>[
                                Text('Song',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: GridView.count(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      shrinkWrap: true,
                                      primary: true,
                                      physics: BouncingScrollPhysics(),
                                      children: item.songList.map((data) {
                                        return InkWell(
                                            onTap: (){
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
                                                        child: Text(data,
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
                                  ),
                                ),
                              ],
                            )
                        ),

                      ],
                    ),
                  ),

                ]
            ),
          )
      ),
    );
  }
}
