import 'package:csc413termprojectfwhite/src/entities/account_entity.dart';
import 'package:equatable/equatable.dart';

class Account extends Equatable{
  final String userId;
  final String email;

  Account(this.userId, this.email);

  Account copyWith({String userId, String email}){
    return Account(
      userId ?? this.userId,
      email ?? this.email,
    );
  }

  @override
  List<Object> get props => [userId, email];

  @override
  String toString() {
    return 'Venue{address: $userId, id: $email}';
  }

  AccountEntity toEntity() {
    return AccountEntity(userId, email);
  }

  static Account fromEntity(AccountEntity entity){
    return Account(
        entity.userId,
        entity.email,
    );
  }

}