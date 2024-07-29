import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class UnknownFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NullResponseFailure extends Failure {
  @override
  List<Object?> get props => [];
}
