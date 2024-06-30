import 'package:equatable/equatable.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_type.dart';

class StatusTypes extends Equatable {
  final List<StatusType> statusTypes;

  const StatusTypes({
    this.statusTypes = const [],
  });

  @override
  List<Object?> get props => [
        statusTypes,
      ];
}
