import 'package:bloc/bloc.dart';
import 'package:bookia_application/feature/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login({required String email,required String password})async{
    emit(LoginLoadingState());
    final response =await AuthRepo.login(email: email, password: password);

    if(response is String){
      emit(LoginErrorState(response));
    }else{
      emit(LoginSuccessState());
    }
  }

  register({required String name,required String email,required String password,required String passwordConfirmation}){
    emit(registerLoadingState());
   final response = AuthRepo.register(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation);

   if(response is String){
     emit(registerErrorState(response));
   }else{
     emit(registerSuccessState());
   }

  }
}
