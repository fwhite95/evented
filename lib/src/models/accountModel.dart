import 'package:csc413termprojectfwhite/src/entities/account_entity.dart';
import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String userId;
  final String email;
  final List<String> venuesFollowed;
  final List<String> eventsFollowed;

  Account(this.userId, this.email, this.eventsFollowed, this.venuesFollowed);

  Account copyWith(
      {String userId,
      String email,
      List<String> eventsFollowed,
      List<String> venuesFollowed}) {
    return Account(
      userId ?? this.userId,
      email ?? this.email,
      eventsFollowed ?? this.eventsFollowed,
      venuesFollowed ?? this.venuesFollowed,
    );
  }

  @override
  List<Object> get props => [userId, email, eventsFollowed, venuesFollowed];

  @override
  String toString() {
    return 'Account{userId: $userId, email: $email, '
        'EventsFollowed: $eventsFollowed, VenuesFollowed: $venuesFollowed}';
  }

  AccountEntity toEntity() {
    return AccountEntity(userId, email, eventsFollowed, venuesFollowed);
  }

  static Account fromEntity(AccountEntity entity) {
    return Account(
      entity.userId,
      entity.email,
      entity.eventsFollowed,
      entity.venuesFollowed,
    );
  }
}
