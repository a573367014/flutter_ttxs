import '../services/ormRequest.dart';

OrmRequest templatesModel({pathParams}) {
    return OrmRequest(
//        '/:keywords?/materials/:material_id?client_id=1',
        '/materials?client_id=1',
        pathParams: pathParams
    );
}
