class Future<T> {
  bool _loaded = false;
  bool _failed = false;
  late T value;

  Future(this.value) : _loaded = true;

  bool isLoaded() {
    return (_loaded && !_failed);
  }

  bool hasFailed() {
    return _failed;
  }

  T? get() {
    return (_loaded) ? value : null;
  }

  void setValue(T value) {
    _loaded = false;
    this.value = value;
  }

  void setFailure(String message) {
    // TODO
    _failed = true;
  }
}
