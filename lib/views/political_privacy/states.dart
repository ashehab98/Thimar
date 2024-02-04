class PolicyStates {}

class PolicyLoadingState extends PolicyStates {}

class PolicySuccessState extends PolicyStates {
  final String data;

  PolicySuccessState({required this.data});
}

class PolicyFailedState extends PolicyStates {
  final String msg;

  PolicyFailedState({required this.msg});
}
