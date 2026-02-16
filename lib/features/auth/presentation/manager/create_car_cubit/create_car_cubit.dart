import 'package:bloc/bloc.dart';
import 'package:qent/features/auth/presentation/manager/create_car_cubit/create_car_state.dart';


class CreateCarCubit extends Cubit<CreateCarState> {
  CreateCarCubit() : super(SignupInitial());
  bool availableToCreateCar = false;
  void changeAvailable(bool value) {
    availableToCreateCar = value;
    emit(AvailableToCreateCarChanged(value));
  }
}
