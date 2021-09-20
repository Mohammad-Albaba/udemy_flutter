// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries country=eg&category=business&apiKey=1de04cf6f9ce4ce683c474a2bb10d67a
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=1de04cf6f9ce4ce683c474a2bb10d67a

// Search
// https://newsapi.org/v2/everything?q=tesla&from=2021-05-09&sortBy=publishedAt&apiKey=1de04cf6f9ce4ce683c474a2bb10d67a



//ShopApp
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/cache_helper.dart';

void signOut(context){
  CacheHelper.removeData(key: 'token').then((value){
    if(value){
      navigateAndFinish(context, ShopLoginScreen(),);
    }
  });
}

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';
String uId = '';