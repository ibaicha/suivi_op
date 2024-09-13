part of 'producteur_bloc.dart';

abstract class ProducteurEvent extends Equatable {
  const ProducteurEvent();
}

class LoadProducteurEvent extends ProducteurEvent {
  const LoadProducteurEvent();

  @override
  List<Object?> get props => [];
}

abstract class Producteur_idOpEvent extends Equatable {
  const Producteur_idOpEvent();
}

class LoadProducteur_idOpEvent extends Producteur_idOpEvent {
  const LoadProducteur_idOpEvent({
    required this.idOp,
  });
  final int idOp;

  @override
  List<Object?> get props => [idOp];
}
