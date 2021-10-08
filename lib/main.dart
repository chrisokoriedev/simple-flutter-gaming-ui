import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamingui/lsit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d8dd7),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Image.asset(
              'assets/pad.png',
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Discover your best game this summer',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'get  ready to encounter the best summer of your'
              ' life this time with the ultimate game app store',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GameScreen())),
              child: Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xfff7b200),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  'Dive in!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.download_outlined,
                        color: Colors.grey,
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  child: TextFormField(
                style:
                    new TextStyle(fontSize: 18.0, color: CupertinoColors.white),
                decoration: InputDecoration(
                  hintText: 'search games',
                  contentPadding: EdgeInsets.only(top: 15),
                  filled: true,
                  fillColor: Color(0xfff7b200),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical:5),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: AssetImage('assets/logo.jpg'),
                            fit: BoxFit.contain)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10.7),
                  ),
                ),
              )),
              SizedBox(height: 20,),
              Container(
                child: TabBar(
                  controller: tabController,
                  labelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 15,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: Colors.transparent,
                  ),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Popular',
                    ),
                    Tab(
                      text: 'Recent',
                    ),
                    Tab(
                      text: 'My games',
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.9,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 4,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: gameContent.length,
                                itemBuilder: (BuildContext context, int index) {
                                  GameContent connect = gameContent[index];
                                  return GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GameDetails(
                                                  contentList: connect,
                                                ))),
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              connect.image,
                                            ))),
                                  );
                                })),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Recommended for you",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Expanded(
                          flex: 5,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: recommendedContent.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          recommendedContent[index].image,
                                        )));
                              }),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameDetails extends StatefulWidget {
  final GameContent contentList;

  const GameDetails({Key? key, required this.contentList}) : super(key: key);

  @override
  _GameDetailsState createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.contentList.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(widget.contentList.image),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.contentList.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            Text(
                              widget.contentList.gameType,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap:()=> Navigator.of(context).pop(),
                child: Container(
                  margin: EdgeInsets.only(bottom: 40),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xfff7b200).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    'Close',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
