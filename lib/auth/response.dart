enum ResponseStatus {
  OK,
  INVALID_EMAIL,
  USER_EXISTS,
  CANT_CONNECT_TO_SERVER,
  NULL_FIELD,
  UNAUTHORIZED_ACCESS
}

class Response<T> {
  final ResponseStatus status;
  final T body;

  Response(this.status, this.body);
}
