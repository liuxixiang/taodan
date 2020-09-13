class ApiPath {
  static const baseUrl = 'http://120.24.243.205';

  ///member
  static const login = '/member/user/login';
  static const findUser = '/member/user/findUser';
  static const bindInvite = '/member/user/bindInvite';
  static const updateUserInfo = '/member/user/updateUserInfo';

  // static const BASE_URL = 'http://api-qa.joy.beekuaibao.com/';
  // static const LOGIN = '/account/account/login';

  ///common
  static const configs = '/commons/common/getConfigs';
  static const config = '/commons/common/getConfig';

  //game
  static const game = '/commons/gameLogin';

  //upload
  static const upload = '/commons/common/oss/upload';
}
