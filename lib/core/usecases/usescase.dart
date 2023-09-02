import 'dart:async';

abstract class UseCase<Output, Input> {
  Future<Output> call(Input input);
}

class NoParams {}
