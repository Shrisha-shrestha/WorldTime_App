import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/loading.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Map data={};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data :ModalRoute.of(context)!.settings.arguments as Map;
       String  homet = data['time'];
   String loc=data['location'];
   String img = data['daytime'] ? 'sun.jpg' : 'night.jpg';
        return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 13, 13, 1),
        title: Text("WORLD TIME",
                style: TextStyle(
          letterSpacing: 2.5,
        ),),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/earth.jpg'),
                fit: BoxFit.cover,
              ),),
          ),
                    //

          Container(decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
                 color: Color.fromRGBO(20,20,20,1),
          ),

            width: 455.0,

            margin: EdgeInsets.fromLTRB(30.0, 300.0, 30.0, 245.0),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                // create a about page
              },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //new Image.asset('assets/$img',
                    if(img=='sun.jpg')...[ Image.asset('assets/sun.jpg',
                          width: 80.0,
                          height: 40.0,
                          //fit: BoxFit.cover,
                        )]
                        else...[Image.asset('assets/moon.jpg',
                          width: 80.0,
                          height: 80.0,
                          //fit: BoxFit.cover,
                        ),],
                        Column(
                          children: <Widget>[
                            Text(loc,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 15.0,
                                letterSpacing: 3.0,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 15.0,),

                         Text(homet,
                                      style: TextStyle(
                                        fontSize: 35.0,
                                        letterSpacing: 3.0,
                                        color: Colors.white,
                                      ),
                                    ),

                          ],
                        )
                      ],
                    )

                  ],),
              ),
            ),

          Card(
            color: Color.fromRGBO(20,20,20,1),
    shadowColor: Colors.grey,
    elevation: 2.0,
    margin: EdgeInsets.fromLTRB(30.0, 470.0, 30.0, 90.0),
    child: InkWell(
    splashColor: Colors.blue.withAlpha(30),
    onTap: () {
      // create a about page
    },
    child: Padding(
       padding: EdgeInsets.all(15.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(
    "Using World Time",
    style: TextStyle(
    fontSize: 25.0,
    color: Colors.white,
      letterSpacing: 2.0,
    ),
    ),
    SizedBox(height: 15.0),
    Text('Find out what the exact time is right now at any of 7 million locations around the world',
      textAlign: TextAlign.justify,
    style: TextStyle(
    fontSize: 15.0,
    letterSpacing: 2.0,
      color: Colors.grey,
    ),
    ),
    ],),
    ),
    ),
    ),

    ],),
      floatingActionButton: FloatingActionButton.extended(

        backgroundColor: Color.fromRGBO(20,20,20,1),
    onPressed: () async {
          dynamic result = await Navigator.pushNamed(context, '/location');
    if(result != null){
    setState(() {
    data = {
    'time': result['time'],
    'location': result['location'],
    'daytime': result['daytime'],
    'flag': result['flag']
    };
    });
    }
        },
        icon: const Icon(Icons.add_location_alt),
        label: const Text('   Choose a location',
          style: TextStyle(
            letterSpacing: 2.0,
          ),
                  ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

