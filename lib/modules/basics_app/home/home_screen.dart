import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: Icon(
            Icons.menu,
          ),
          title: Text(
            'First App'
          ),
          actions: [
            IconButton(icon:
            Icon(Icons.notification_important,
            ),
              onPressed: (){
                print('Notification');
            },
            ),
            IconButton(icon:
            Icon(Icons.search,
            ),
              onPressed: (){
                print('hello');
              },

                ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20.0),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 200.0,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                        image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
                        ),
                         height: 200.0,
                         width: 200.0,
                         fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black.withOpacity(.7),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Text(
                        'Flower',
                        textAlign: TextAlign.center ,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

}