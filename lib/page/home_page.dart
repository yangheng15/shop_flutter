import 'dart:io';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  List<Map> navgatorList = [
      {
        'name': '秋季推荐',
        'image': 'images/huoguo.png'
      },
      {
        'name': '精选优品',
        'image': 'images/pangxie.png'
      },
      {
        'name': '甄选生鲜',
        'image': 'images/shuiguo.png'
      },
      {
        'name': '零食茶饮',
        'image': 'images/chayinpng.png'
      },
      {
        'name': '补贴秋膘',
        'image': 'images/roulei.png'
      },
      {
        'name': '秋季推荐',
        'image': 'images/huoguo.png'
      },
      {
        'name': '精选优品',
        'image': 'images/pangxie.png'
      },
      {
        'name': '甄选生鲜',
        'image': 'images/shuiguo.png'
      },
      {
        'name': '零食茶饮',
        'image': 'images/chayinpng.png'
      },
      {
        'name': '补贴秋膘',
        'image': 'images/roulei.png'
      },
  ];
  List<Map> recommendList = [
    {
      'image': 'images/gaoliangjiu.jpg',
      'text': '高粱酒',
      'price': '￥888'
    },
    {
      'image': 'images/gaoliangjiu.jpg',
      'text': '高粱酒',
      'price': '￥888'
    },
    {
      'image': 'images/gaoliangjiu.jpg',
      'text': '高粱酒',
      'price': '￥888'
    },
  ];
  List<Map> floorData = [
    {
      'image': 'images/floor_big_02.jpg'
    },
    {
      'image': 'images/floor_02.jpg'
    },
    {
      'image': 'images/floor_03.jpg'
    },
    {
      'image': 'images/floor_03.jpg'
    },
    {
      'image': 'images/floor_02.jpg'
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+'),),
      body: SingleChildScrollView( // 和listview 组件冲突 如果里面有listview组件 外面就不能用了
        child: Column(
          children: <Widget>[
            SwiperDiy(),
            TopNavigator(navgatorList: navgatorList,),
            LeaderPhone('images/leaderImg.png', '18940991076'),
            Recommend(recommendList),
            FloorTitle('images/floor_jiushui.png'),
            FloorContent(floorData),
            FloorTitle('images/floor_jiushui.png'),
            FloorContent(floorData),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('首页初始化。。。');
  }
}

// 轮播图
class SwiperDiy extends StatelessWidget {
  final List swiperDataList = [
    'http://pic.netbian.com/uploads/allimg/190917/183634-15687165942ef2.jpg',
    'http://pic.netbian.com/uploads/allimg/190824/212516-1566653116f355.jpg',
    'http://pic.netbian.com/uploads/allimg/191115/235357-157383323781ac.jpg'
  ];
  SwiperDiy({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
//    print('设备像素密度${ScreenUtil.pixelRatio}');
//    print('设备高度${ScreenUtil.screenHeight}');
//    print('设备宽度${ScreenUtil.screenWidth}');
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network(swiperDataList[index],fit: BoxFit.cover,);
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// 分类组件
class TopNavigator extends StatelessWidget {
  final List navgatorList; // 数据
  TopNavigator({Key key, this.navgatorList}): super(key: key);
  Widget _gridViewItemUi(BuildContext context, item) {
    print(item);
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.asset(item['image'],width: ScreenUtil().setWidth(95), fit: BoxFit.cover,),
          Text(item['name']),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(280),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navgatorList.map((item) {
          return _gridViewItemUi(context, item);
        }).toList(),
      ),
    );
  }
}

// AdBanner
class AdBanner extends StatelessWidget {
  final String adPicture;
  AdBanner(this.adPicture);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(adPicture),
    );
  }
}

//拨打电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage;//图片
  final String leaderPhone;//电话

  LeaderPhone(this.leaderImage,this.leaderPhone);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.asset(leaderImage, width: ScreenUtil().setWidth(750), fit: BoxFit.cover,),
      ),
    );
  }

//
  void _launchURL() async {
    String url = 'tel:' + leaderPhone;
//    String url = 'http://www.baidu.com';
    print(url);
    if(await canLaunch(url)) {
      await launch(url);
    }else {
      throw 'url不能进行访问';
    }
  }
}

//商品推荐
class Recommend extends StatelessWidget {
  final List recommendList;
  Recommend(this.recommendList);

  //title
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12,)
        )
      ),
      child: Text('商品推荐', style: TextStyle(fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(30)),),
    );
  }
  
  //商品
  Widget _item(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: .5, color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.asset(recommendList[index]['image']),
            Text(recommendList[index]['text']),
            Text(
              recommendList[index]['price'],
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey
              )
            )
          ],
        ),
      ),
    );
  }

  //横向列表
  Widget _recommedList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList()
        ],
      ),

    );
  }
}

//楼层标题
class FloorTitle extends StatelessWidget {
  final String picUrl;
  FloorTitle(this.picUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.asset(picUrl, fit: BoxFit.fill, width: ScreenUtil().setWidth(750),),
    );
  }
}

//楼层商品
class FloorContent extends StatelessWidget {
  final List<Map> floorGoodsList;
  FloorContent(this.floorGoodsList);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherGoods()
        ],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: (){},
        child: Image.asset(goods['image'], fit: BoxFit.cover,),
      ),
    );
  }

}
