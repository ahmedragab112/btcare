part of 'machine_cubit.dart';

abstract class MachineState extends Equatable {
  const MachineState();

  @override
  List<Object> get props => [];
}

class MachineInitial extends MachineState {}

class MachineSuccess extends MachineState {}

class MachineFailed extends MachineState {
  final String error;
 const MachineFailed({required this.error});
}

class MachineLoading extends MachineState {}

class UploadImage extends MachineState {
}