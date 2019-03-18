// typedef FromJson<T> = T Function();

abstract class JsonModel<R> {
    R toJson();
}
