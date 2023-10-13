class BaseUrl {
  static const domainBase = 'http://10.0.2.2:5000';
  static const authLogin = '$domainBase/api/user/login';
  static const authSignUp = '$domainBase/api/user/signup';
  static const getAllCategory = '$domainBase/api/categories';
  static const imgCategory = '$domainBase/img/categories/';
  static const getAllArrivalProduct = '$domainBase/api/products/top-arrival';
  static const getAllTrendProduct = '$domainBase/api/products/top-trending';
  static const getAllSaleProduct = '$domainBase/api/products/top-sale';
  static const getAllHotProduct = '$domainBase/api/products/top-hot';
  static const imgProduct = '$domainBase/img/products/';
  static const refreshToken = '$domainBase/api/user/refresh';
  static const imgUser = '$domainBase/img/users/';
  static reviewsProduct(String idProduct) =>
      '$domainBase/api/products/$idProduct/reviews/';
  static getInfoProduct(String idProduct) =>
      '$domainBase/api/products/$idProduct';
}
