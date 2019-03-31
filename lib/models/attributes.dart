import '../services/ormRequest.dart';
export 'attributes.json.dart';

OrmRequest attributesModel() {
  return OrmRequest('/miniprogram/attributes');
}
