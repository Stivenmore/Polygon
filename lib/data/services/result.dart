import 'package:equatable/equatable.dart';

abstract class Result<T, E> {
  Result();

  bool get isFail;

  bool get isSuccess;

  E? get failRes;

  T? get successRes;

  factory Result.fail(E e) = Fail;

  factory Result.success(T t) = Success;

  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  });
}

class Success<T, E> extends Result<T, E> {
  final T _success;

  Success(T success) : _success = success;

  @override
  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  }) =>
      success(_success);

  @override
  bool get isFail => false;

  @override
  bool get isSuccess => true;

  @override
  E? get failRes => null;

  @override
  T get successRes => _success;
}

/// Fail result implementation class
class Fail<T, E> extends Result<T, E> {
  final E _fail;

  Fail(E e) : _fail = e;

  @override
  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  }) =>
      fail(_fail);

  @override
  bool get isFail => true;

  @override
  bool get isSuccess => false;

  @override
  E? get failRes => _fail;

  @override
  T? get successRes => null;
}

/// This class create the base to handle the errors.
abstract class Error extends Equatable {
  final String? description;
  final String? err;
  final Map? data;

  const Error({
    this.data,
    required this.description,
    required this.err,
  });
}

/// Error handler for the backend responde errors
class BackendError extends Error {
  final int statusCode;

  const BackendError({
    Map? data,
    String? description,
    String? err,
    required this.statusCode,
  }) : super(data: data, description: description, err: err);

  BackendError copyWith({
    Map? data,
    String? description,
    String? err,
    int? statusCode,
  }) {
    return BackendError(
      data: data ?? this.data,
      description: description ?? this.description,
      err: err ?? this.err,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  @override
  List<Object?> get props => [
        data,
        description,
        err,
        statusCode,
      ];
}
