import 'package:blackpink_app/model/blackpink_model.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Screen extends StatelessWidget{
  final DataBlackpink item;
  Screen({required this.item});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      if (constraints.maxWidth <= 1000){
        return DetailPageMobile(item: item);
      }else {
        return DetailPageWeb(item: item);
      }
    }
    );
  }
}



class DetailPageMobile extends StatefulWidget {
  final DataBlackpink item;
  const DetailPageMobile({required this.item});

  @override
  State<DetailPageMobile> createState() => _DetailPageMobileState();
}

class _DetailPageMobileState extends State<DetailPageMobile> {
  bool _isFavorited = true;
  int _favoriteCount = 100;
  final _scrollController = ScrollController();
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
                        image: AssetImage(widget.item.imageAsset),
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
                              widget.item.fullName,
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
                          widget.item.description,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.pinkAccent
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: <Widget>[
                                Text('FAVORITE',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      alignment: Alignment.centerRight,
                                      icon: (_isFavorited
                                          ? const Icon(Icons.star, color: Colors.pinkAccent,)
                                          : const Icon(Icons.star_border,color: Colors.pinkAccent)),
                                      color: Colors.pinkAccent,
                                      onPressed: _toggleFavorite,
                                    ),
                                    Text('$_favoriteCount Favorite',
                                        style: const TextStyle(
                                            color: Colors.pinkAccent,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18
                                        )
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: <Widget>[
                                Text('MUSIC/FILM',
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
                                    children: IterableZip([widget.item.namaList,widget.item.gambarList]).map((url){
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: InkWell(
                                            onTap: (){
                                            },
                                            child: Card(
                                              color: Colors.pinkAccent,
                                              child: Column(
                                                children: [
                                                  Image.network(url[1],
                                                    width: 200,
                                                    height: 200,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Padding(padding: EdgeInsets.only(top: 5),
                                                    child: Text(url[0],
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
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleFavorite(){
    setState((){
      if (_isFavorited){
        _favoriteCount -=  1;
        _isFavorited = false;
      } else{
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}

class DetailPageWeb extends StatefulWidget {
  final DataBlackpink item;
  const DetailPageWeb({required this.item});

  @override
  State<DetailPageWeb> createState() => _DetailPageWebState();
}

class _DetailPageWebState extends State<DetailPageWeb> {
  bool _isFavorited = true;
  int _favoriteCount = 100;
  final _scrollController = ScrollController();
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.item.imageAsset),
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
                              widget.item.fullName,
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
                          widget.item.description,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.pinkAccent
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: <Widget>[
                                Text('FAVORITE',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      alignment: Alignment.centerRight,
                                      icon: (_isFavorited
                                          ? const Icon(Icons.star, color: Colors.pinkAccent,)
                                          : const Icon(Icons.star_border,color: Colors.pinkAccent)),
                                      color: Colors.pinkAccent,
                                      onPressed: _toggleFavorite,
                                    ),
                                    Text('$_favoriteCount Favorite',
                                        style: const TextStyle(
                                            color: Colors.pinkAccent,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18
                                        )
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: <Widget>[
                                Text('MUSIC/FILM',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: GridView.count(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      shrinkWrap: true,
                                      primary: true,
                                      physics: BouncingScrollPhysics(),
                                      children: IterableZip([widget.item.namaList,widget.item.gambarList]).map((data) {
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
                                                      child: Image.network(data[1],
                                                        fit: BoxFit.cover,
                                                      )

                                                  ),
                                                  SizedBox(height: 5),
                                                  Padding(padding: EdgeInsets.only(top: 5),
                                                      child: Center(
                                                        child: Text(data[0],
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
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleFavorite(){
    setState((){
      if (_isFavorited){
        _favoriteCount -=  1;
        _isFavorited = false;
      } else{
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}





// class DetailPage extends StatefulWidget{
//   final DataBlackpink item;
//   DetailPage({required this.item})
//
//   @override
//   State<DetailPage> createState() => _DetailPageState();
//
// }
//
// class _DetailPageState extends State<DetailPage>{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.item.name),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 200,
//               width: 200,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(widget.item.imageAsset),
//                   fit: BoxFit.cover
//                 )
//               ),
//             ),
//             Text(widget.item.name),
//             Text(widget.item.description)
//           ],
//         ),
//       ),
//     );
//   }
// }
