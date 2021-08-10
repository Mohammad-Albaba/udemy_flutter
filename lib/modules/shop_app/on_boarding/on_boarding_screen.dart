import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/cache_helper.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;

  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
  });
}
class OnBoardingScreen extends StatefulWidget
{
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  bool isLast = false;

  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value)
    {
      if(value)
      {
        navigateAndFinish(
            context,
            ShopLoginScreen()
        );
      }
    });
  }

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onboard.jpg',
        title: 'Shop App',
        body: 'Fun shopping'
    ),
    BoardingModel(
        image: 'assets/images/onboard.jpg',
        title: 'Ease of shopping',
        body: 'effortless shopping'
    ),
    BoardingModel(
        image: 'assets/images/onboard.jpg',
        title: 'Don\'t think and don\'t be confused',
        body: 'effortless shopping'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
            function: submit,
            text: 'skip',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index == boarding.length-1){
                    setState(() {
                      isLast = true;
                    });
                  }else{
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context , index) => buildBoardingItem(boarding[index]),
                itemCount: 3,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
               SmoothPageIndicator(
                   controller: boardController,
                   effect: ExpandingDotsEffect(
                     dotColor: Colors.grey,
                     activeDotColor: defaultColor,
                     dotHeight: 10,
                     expansionFactor: 4.0,
                     dotWidth: 10,
                     spacing: 5.0,
                   ),
                   count: boarding.length
               ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: (){
                  if(isLast){
                    submit();
                  }else{
                    boardController.nextPage(duration: Duration(
                      milliseconds: 750,
                    ),
                      curve: Curves.fastLinearToSlowEaseIn,);
                  }

                },
                child: Icon(
                  Icons.arrow_forward_ios,
                ),),
              ],
            ),


          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
    ],
  );
}
