import 'package:dio/dio.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'network.dart';

class OrmRequest{
  String _path;
  Dio _http = dio;

  OrmRequest(restPath, {Map pathParams, Dio http}) {
    final urlTokens = parse(restPath);

    this._path = tokensToFunction(urlTokens)(pathParams);
    this._http = _http ?? this._http;
  }

  Future find(Map<String, dynamic> data, {Options options, CancelToken cancelToken}) {
    return _http.get(_path,
        queryParameters: data, options: options, cancelToken: cancelToken);
  }

  Future select(Map<String, dynamic> data, {Options options, CancelToken cancelToken}) {
    return _http.get(_path,
        queryParameters: data, options: options, cancelToken: cancelToken);
  }

  Future add(data, {Options options, CancelToken cancelToken}) {
    return _http.post(_path,
        data: data, options: options, cancelToken: cancelToken);
  }

  Future save(data, {Options options, CancelToken cancelToken}) {
    return _http.post(_path,
        data: data, options: options, cancelToken: cancelToken);
  }

  Future delete({data, Options options, CancelToken cancelToken}) {
    return _http.delete(_path,
        data: data, options: options, cancelToken: cancelToken);
  }
}
