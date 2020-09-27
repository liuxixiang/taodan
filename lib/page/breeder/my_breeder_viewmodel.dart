import 'package:stacked/stacked.dart';
import 'package:taodan/common/apis/api_breeder.dart';
import 'package:taodan/model/breeder_entity.dart';
import 'package:taodan/model/check_exchange_breeder_entity.dart';

class MyBreederViewModel extends BaseViewModel {
  int _page = 1;
  List<BreederInfoEntity> _breederEntities = List();

  List<BreederInfoEntity> get breederEntities => _breederEntities;

  int get page => _page;

  findBreederInfo(bool isRefresh, type) async {
    await BreederApi.findBreederInfo(
        page: _page,
        pageSize: 20,
        type: type,
        onNetSuccess: (data) {
          if (isRefresh) {
            _breederEntities = data;
          } else {
            _breederEntities.addAll(data);
          }
        });
    return _breederEntities;
  }

  checkExchangeBreeder(String breederType,
      Function(CheckExchangeBreederEntity breeder) fun) async {
    await BreederApi.checkExchangeBreeder(
        breederType, (data) async => {fun(data)});
  }
}
