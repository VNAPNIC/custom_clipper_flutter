import 'package:custom_clipper_flutter/images.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: WaveSlider(),
      ),
    );
  }
}

class WaveSlider extends StatefulWidget {
  @override
  _WaveSliderState createState() => _WaveSliderState();
}

class _WaveSliderState extends State<WaveSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        child: Image.asset(mImage),
        clipper: MyClipper(),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    // Vẽ một đường thẳng từ điểm hiện tại đến góc dưới bên trái.
    path.lineTo(0.0, size.height/2);

    // áp dụng Bezier Curves
    // https://en.wikipedia.org/wiki/B%C3%A9zier_curve
    var firstControlPoint = new Offset(20, size.height);
    var firstEndPoint = new Offset(100, size.height);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    // Điểm dưới cùng bên phải cũng không cùng cấp với đối tác bên trái của nó,
    // vì vậy chúng tôi cũng sẽ điều chỉnh cái đó.
    path.lineTo(size.width, size.height);

    // Vẽ một đường thẳng từ điểm hiện tại đến góc trên bên phải.
    path.lineTo(size.width, 0.0);

    // Vẽ một đường thẳng từ điểm hiện tại đến điểm đầu tiên của đường dẫn.
    // Trong trường hợp này (0, 0), vì đó là nơi các đường dẫn bắt đầu theo mặc định.
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
