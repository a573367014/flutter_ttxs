import '../services/orm_request.dart';

OrmRequest templetsModel() {
    return OrmRequest(
        '/:keywords?/materials/:material_id?'
    );
}
