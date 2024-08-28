part of 'machine_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class MachineInitial extends HomeState {}

class MachineSuccess extends HomeState {
  final MachineResponse data;
  const MachineSuccess({required this.data});
}

class MachineFailed extends HomeState {
  final String error;
  const MachineFailed({required this.error});
}

class MachineLoading extends HomeState {}

class UploadImage extends HomeState {}

class UploadImageFailed extends HomeState {
  final String error;
  const UploadImageFailed({required this.error});
}

class GetAllProfileLoading extends HomeState {}

class GetAllProfileSuccess extends HomeState {}

class GetAllProfileError extends HomeState {
  final String error;
  const GetAllProfileError({required this.error});
}
class GetDoctorDetailsLoading extends HomeState {}

class GetDoctorDetailSuccess extends HomeState {}

class GetDoctorDetailsError extends HomeState {
  final String error;
  const GetDoctorDetailsError({required this.error});
}
class AddChatLoading extends HomeState {}

class AddChatSuccess extends HomeState {}

class AddChatError extends HomeState {
  final String error;
  const AddChatError({required this.error});
}
class GetAllChatsLoading extends HomeState {}

class GetAllChatsSuccess extends HomeState {}

class GetAllChatsError extends HomeState {
  final String error;
  const GetAllChatsError({required this.error});
}
class SendMessageLoading extends HomeState {}

class SendMessageSuccess extends HomeState {}

class SendMessageError extends HomeState {
  final String error;
  const SendMessageError({required this.error});
}
class GetChatMessagesLoading extends HomeState {}

class GetChatMessagesSuccess extends HomeState {}

class GetChatMessagesError extends HomeState {
  final String error;
  const GetChatMessagesError({required this.error});
}