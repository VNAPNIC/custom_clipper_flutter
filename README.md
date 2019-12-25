# custom_clipper_flutter
CustomClipper Flutter


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
    
<img src="https://github.com/VNAPNIC/custom_clipper_flutter/blob/master/Screenshot_20191225-144204.jpg" width="350" height="730">
