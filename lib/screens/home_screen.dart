import 'package:flutter/material.dart';
import 'package:social_ui/data/data.dart';
import 'package:social_ui/widgets/custom_draw.dart';
import 'package:social_ui/widgets/following_user.dart';
import 'package:social_ui/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        title: Text(
          'FRENZY',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          tabs: <Widget>[
            Tab(text: 'Trending'),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          FollowingUsers(),
          PostsCarousel(
              pageController: _pageController, title: 'Posts', posts: posts),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
