abstract class PaymentStates {}
class InitialState extends PaymentStates{}
class PaymentAuthLoadingState extends PaymentStates{}
class PaymentAuthSuccessState extends PaymentStates{}
class PaymentAuthErrorState extends PaymentStates{}