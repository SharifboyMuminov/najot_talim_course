class AppConstants {
  static  RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  static  RegExp passwordRegExp = RegExp( r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  static  RegExp textRegExp = RegExp("[a-zA-Z]");
  static  RegExp phoneRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  static const String categoryTableName = "category";
  static const String userTable = "user";
  static const String productTableName = "products";
  static const String productRequestTableName = "request_products";
  static const String messageKey = "AAAAjP4X3S4:APA91bHqICYGLH67pSf3DPpL4xHoc0TIgqf2XCWreNGXzhYLUMdpbTQdfwXPLqX47vb8IRrOLb3AhWBij7OUq2cXeRCKSsQM71zb3nZSolfE-uetHVo125IfZAX4u-CW4HmZxIA3HgYd";
}