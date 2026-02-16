abstract class CreateCarState {}

class SignupInitial extends CreateCarState {}

class AvailableToCreateCarChanged extends CreateCarState {
  final bool value;

  AvailableToCreateCarChanged(this.value);
}
