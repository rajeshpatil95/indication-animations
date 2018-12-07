import 'package:flutter/material.dart';

class Blinking extends StatefulWidget {
  @override
  _BlinkingState createState() => new _BlinkingState();
}

class _BlinkingState extends State<Blinking> with TickerProviderStateMixin {
  Animation<Color> animation;
  AnimationController controller;
  AnimationController _controller;
  Animation<double> transitionTween;

  initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.linear);
    animation =
        ColorTween(begin: Colors.white, end: Colors.red).animate(curve);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
      setState(() {});
    });
   // controller.forward();


    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    transitionTween = Tween<double>(
      begin: 200.0,
      end: 230.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
   // _controller.forward();
    
  }
  

  @override
  void dispose() {
    controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Animation'),
      ),
      body: new Center(
        child:new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Column(
              children: <Widget>[

                new Container(
                  width: 200.0,
                  height: 200.0,
                  color: animation.value,
                  child: new RaisedButton(
                    color: animation.value,
                    onPressed: () {
                     // controller.forward();
                    },
                    child: Text(' '),
                  ),
                ),
                
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),

                new Container(
                   width: transitionTween.value,
                   height: transitionTween.value,
                  child: new RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                     // controller.forward();
                    },
                    child: Text(' '),
                  ),
                ),
               

              ],
            );


          },
        ),
      ),
         floatingActionButton:  new Container(
                  child: new RaisedButton(
                    color: Colors.yellow,
                    onPressed: () {
                      controller.forward();
                      _controller.forward();
                    },
                    child: Text('Animate'),
                  ),
                ),
    );
  }
}