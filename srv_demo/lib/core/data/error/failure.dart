import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  const Failure({required this.message});
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure{
  const CacheFailure({required super.message});
}
