import '../model/index_cell.dart';
import 'dart:async' show Future;
import '../apis/api.dart';
import '../util/net_utils.dart';
class DataUtils {
  
  // 首页列表数据
  static Future<List<IndexCell>> getIndexListData(Map<String, dynamic> params) async {
    print('$params============================================>');
    var response = await NetUtils.get(Api.RANK_LIST, params: params);
    print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<============================================>$response');
    var responseList = response['d']['entrylist'];

    List<IndexCell> resultList = new List();
    for (int i = 0; i < responseList.length; i++) {
      try {
        IndexCell cellData = new IndexCell.fromJson(responseList[i]);
        resultList.add(cellData);
      } catch (e) {
        // No specified type, handles all
        print('Something really unknown: $i');
      }
    }

    return resultList;
  }
}