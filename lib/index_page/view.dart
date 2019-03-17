import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../components/template.dart';

import 'dart:math';
import 'state.dart';

final List<Map<String, dynamic>> linkData = [
  {'title': '按图片分类查找'},
  {'title': '按视频分类查找'},
  {'title': '按标签查找'},
  {'title': '提供模板建议'},
  {
    'title': '返回顶部',
    'callback': (IndexPageState state) {
      state.sController1.animateTo(0,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    }
  }
];

// 顶部导航条
Widget getAppBar(ViewService service) {
  return PreferredSize(
    child: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: Column(children: <Widget>[
              service.buildComponent('topBar'),
              service.buildComponent('navBar'),
            ]),
            preferredSize: Size.infinite)),
    preferredSize: Size.fromHeight(125),
  );
}

// 标签
Widget getTagItem() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(6)),
    child: Stack(alignment: Alignment(0, 0.7), children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
              'https://picsum.photos/200/300?image=' +
                  Random().nextInt(1000).toString(),
              width: 80,
              height: 80,
              fit: BoxFit.cover)),
      Text(
        '做活动',
        style: new TextStyle(fontSize: 13, color: Colors.white),
      ),
    ]),
  );
}

// 标签列表
Widget getTagList() {
  return Container(
    height: 80,
    child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int position) {
          return getTagItem();
        }),
  );
}

// 标题
Widget getTitle(String title) {
  return Container(
    padding: EdgeInsets.only(left: 16, right: 12, top: 46, bottom: 17),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Color(0xff333333), fontSize: 16),
        ),
        Row(
          children: <Widget>[
            Text('查看更多',
                style: TextStyle(color: Color(0xFF666666), fontSize: 14)),
            Icon(IconData(0xe601, fontFamily: 'iconfont'), size: 18),
          ],
        )
      ],
    ),
  );
}

// 模板列表
Widget getTemplateList(double width, double height) {
  return Container(
    height: height,
    child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int position) {
          return getBaseTemplate(width, height);
        }),
  );
}

// 底部跳转链接
Widget getBottomlinkItem(int index, IndexPageState state) {
  final arrowIcon = Icon(IconData(0xe601, fontFamily: 'iconfont'), size: 22);
  final transformArrowIcon = Transform.rotate(
      // 旋转270度
      angle: pi * 1.5,
      child: arrowIcon);
  return GestureDetector(
      onTap: () {
        if (linkData[index]['callback'] != null) {
          linkData[index]['callback'](state);
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xffeeeeee)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              linkData[index]['title'],
              style: TextStyle(color: Color(0xff666666), fontSize: 16),
            ),
            index == 4 ? transformArrowIcon : arrowIcon
          ],
        ),
      ));
}

Widget getBottomLinkList(IndexPageState state) => Container(
    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
    child: Column(
        children: Iterable<int>.generate(linkData.length)
            .map((index) => getBottomlinkItem(index, state))
            .toList()));

Widget buildView(IndexPageState state, Dispatch dispatch, ViewService service) {
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(service),
      body: DefaultTabController(
        length: 3, // This is the number of tabs.
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                // This widget takes the overlapping behavior of the SliverAppBar,
                // and redirects it to the SliverOverlapInjector below. If it is
                // missing, then it is possible for the nested "inner" scroll view
                // below to end up under the SliverAppBar even when the inner
                // scroll view thinks it has not been scrolled.
                // This is not necessary if the "headerSliverBuilder" only builds
                // widgets that do not overlap the next sliver.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  backgroundColor: Color(0x0e000000),
                  title:
                      const Text('Books'), // This is the title in the app bar.
                  pinned: true,
                  expandedHeight: 250.0,
                  // The "forceElevated" property causes the SliverAppBar to show
                  // a shadow. The "innerBoxIsScrolled" parameter is true when the
                  // inner scroll view is scrolled beyond its "zero" point, i.e.
                  // when it appears to be scrolled below the SliverAppBar.
                  // Without this, there are cases where the shadow would appear
                  // or not appear inappropriately, because the SliverAppBar is
                  // not actually aware of the precise position of the inner
                  // scroll views.
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    // These are the widgets to put in each tab in the tab bar.
                    tabs: ['1', '2', '3']
                        .map((String name) => Tab(text: name))
                        .toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: ['1', '2', '3'].map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 48.0,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              // The childCount of the SliverChildBuilderDelegate
                              // specifies how many children this inner list
                              // has. In this example, each tab has a list of
                              // exactly 30 items, but this is arbitrary.
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ),
  );
}
