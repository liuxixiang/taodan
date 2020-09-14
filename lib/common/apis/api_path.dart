class ApiPath {
  static const baseUrl = 'http://120.24.243.205';
  static Member member = Member();
  static Common common = Common();
  // static const BASE_URL = 'http://api-qa.joy.beekuaibao.com/';
  // static const LOGIN = '/account/account/login';

}

class Member {
  ///member
  static const _path = "/member";
  final String login = _path + '/user/login';
  final String findUser = _path + '/user/findUser';
  final String bindInvite = _path + '/user/bindInvite';
  final String updateUserInfo = _path + '/user/updateUserInfo';
  final String checkTask = _path + "/task/byUserIdGetTask";
  final String saveTask = _path + "/task/saveUserTask";
}

class Common {
  static const _path = "/commons";

  ///common
  final String configs = _path + '/common/getConfigs';
  final String config = _path + '/common/getConfig';

  //game
  final String game = _path + '/gameLogin';

  //upload
  final String upload = _path + '/common/oss/upload';
}
