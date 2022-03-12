
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bean/bean_video.dart';
import 'item/find_video_page.dart';

class MainFind3Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainFindPage3State();
  }
}

class MainFindPage3State extends State with SingleTickerProviderStateMixin {

  List<String> tabTextList = ["关注", "推荐"];
  List<Tab> tabWidgetList = [];
  late TabController tabController;

  ///推荐模拟数据
  List <VideoModel> videoList =[];
  ///关注模拟数据
  List <VideoModel> videoList2 =[];

  @override
  void initState() {
    super.initState();

    for (var value in tabTextList) {
      tabWidgetList.add(Tab(
        text: "$value",
      ));
    }
    tabController = new TabController(length: tabTextList.length, vsync: this);


    ///创建模拟数据

    for (int i = 0; i < 10; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoName = "推荐测试数据$i";
      videoModel.pariseCount = i * 22;
      if (i % 3 == 0) {
        videoModel.isAttention = true;
        videoModel.isLike = true;
      } else {
        videoModel.isAttention = false;
        videoModel.isLike = false;
      }
      videoModel.videoImag =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg9.doubanio.com%2Fview%2Frichtext%2Flarge%2Fpublic%2Fp151324064.jpg&refer=http%3A%2F%2Fimg9.doubanio.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1649688019&t=287e2650c4d26103d33e017605c20ff9";
      videoModel.videoUrl =
      "";

      videoList.add(videoModel);
    }

    for (int i = 0; i < 3; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoName = "关注测试数据$i";
      videoModel.pariseCount = i * 22;
      videoModel.isAttention = true;
      if (i % 3 == 0) {
        videoModel.isLike = true;
      } else {
        videoModel.isLike = false;
      }
      videoModel.videoImag =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg9.doubanio.com%2Fview%2Frichtext%2Flarge%2Fpublic%2Fp151324064.jpg&refer=http%3A%2F%2Fimg9.doubanio.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1649688019&t=287e2650c4d26103d33e017605c20ff9";
      videoModel.videoUrl =
      "";

      videoList2.add(videoModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildRootBody();
  }

  Widget buildRootBody() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: buildTableViewWidget(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 54,
            child: buildTabBarWidget(),
          ),
        ],
      ),
    );
  }
  ///构建 TabBarView
  buildTableViewWidget() {
    return TabBarView(
      controller: tabController,
      children: tabTextList
          .map((value) => buildTableViewItemWidget(value))
          .toList(),
    );
  }
  ///构建顶部标签部分
  buildTabBarWidget() {
    return Container(
      ///对齐在顶部中间
      alignment: Alignment.topCenter,
      child: TabBar(
        controller: tabController,
        tabs: tabWidgetList,
        ///指示器的颜色
        indicatorColor: Colors.white,
        ///指示器的高度
        indicatorWeight: 2.0,
        isScrollable: true,

        ///指示器的宽度与文字对齐
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  /// 用来创建上下滑动的页面
  Widget buildTableViewItemWidget(String value) {

    List<VideoModel> list =[];
    if(value == "推荐"){
      list= videoList;
    }else{
      list = videoList2;
    }
    return PageView.builder(
      /// pageview中 子条目的个数
      itemCount:list.length ,
      /// 上下滑动
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context,int index){
          VideoModel videoModel = list[index];
      return buildPageViewItemWidget(value,videoModel);
    });
  }

  buildPageViewItemWidget(String value, VideoModel videoModel) {
    return FindVideoItemPage(value,videoModel);
  }
}
