import '../services/orm_request.dart';
import './tag.json.dart';

OrmRequest imagesOrm() {
    return OrmRequest(
        'https://www.rel.ttxsapp.com/api/miniprogram/keywords/recommend?type=0&page_num=1&page_size=1000&client_id=1',
        toModel: (json) => TagListJsonModel.fromJson(json).list
    );
}