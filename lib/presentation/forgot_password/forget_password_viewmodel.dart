import 'dart:async';

import 'package:advanced_ecommerce/app/functions.dart';
import 'package:advanced_ecommerce/domain/usecase/forget_password_usecase.dart';
import 'package:advanced_ecommerce/presentation/base/base_view_model.dart';
import 'package:advanced_ecommerce/presentation/commen/state_renderer/state_renderer.dart';
import 'package:advanced_ecommerce/presentation/commen/state_renderer/state_renderer_impl.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  var email = "";

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  forgotPassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _forgotPasswordUseCase.execute(email)).fold((failure) {
      inputState
          .add(ErrorState(StateRendererType.popupErrorState, failure.message));
    }, (supportMessage) {
      inputState.add(SuccessState(supportMessage));
    });
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream
          .map((isAllInputValid) => _isAllInputValid());

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }

  _isAllInputValid() {
    return isEmailValid(email);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }
}

abstract class ForgotPasswordViewModelInput {
  forgotPassword();

  setEmail(String email);

  Sink get inputEmail;

  Sink get inputIsAllInputValid;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsAllInputValid;
}
