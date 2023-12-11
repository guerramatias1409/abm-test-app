class FetchDataException {
  FetchDataException({this.message});

  final String? message;

  @override
  String toString() {
    if (message == null) return "Exception";
    return message!;
  }
}
