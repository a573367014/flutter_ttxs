// typedef FromJson<T> = T Function();

abstract class JsonModel<R> {
    // factory JsonModel.fromJson(a) => a;
    R toJson();
}