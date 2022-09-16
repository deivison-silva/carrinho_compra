import '../../../models/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ProductModel> products;

  HomeLoaded({required this.products});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
