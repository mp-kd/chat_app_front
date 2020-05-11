enum ResponseStatus {
  OK,
}

class Response<T> {
  final ResponseStatus status;
  final T body;

  Response(this.status, this.body);
}
