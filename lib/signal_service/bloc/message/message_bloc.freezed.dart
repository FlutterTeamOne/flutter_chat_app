// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

// part of 'message_bloc.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

// /// @nodoc
// mixin _$MessageEvent {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(User user) onSubscribed,
//     required TResult Function(Message message) sent,
//     required TResult Function(Message message) recieved,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(User user)? onSubscribed,
//     TResult? Function(Message message)? sent,
//     TResult? Function(Message message)? recieved,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(User user)? onSubscribed,
//     TResult Function(Message message)? sent,
//     TResult Function(Message message)? recieved,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_MessageEventOnSubscribed value) onSubscribed,
//     required TResult Function(_MessageEventSent value) sent,
//     required TResult Function(_MessageEventRecieved value) recieved,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_MessageEventOnSubscribed value)? onSubscribed,
//     TResult? Function(_MessageEventSent value)? sent,
//     TResult? Function(_MessageEventRecieved value)? recieved,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_MessageEventOnSubscribed value)? onSubscribed,
//     TResult Function(_MessageEventSent value)? sent,
//     TResult Function(_MessageEventRecieved value)? recieved,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $MessageEventCopyWith<$Res> {
//   factory $MessageEventCopyWith(
//           MessageEvent value, $Res Function(MessageEvent) then) =
//       _$MessageEventCopyWithImpl<$Res, MessageEvent>;
// }

// /// @nodoc
// class _$MessageEventCopyWithImpl<$Res, $Val extends MessageEvent>
//     implements $MessageEventCopyWith<$Res> {
//   _$MessageEventCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;
// }

// /// @nodoc
// abstract class _$$_MessageEventOnSubscribedCopyWith<$Res> {
//   factory _$$_MessageEventOnSubscribedCopyWith(
//           _$_MessageEventOnSubscribed value,
//           $Res Function(_$_MessageEventOnSubscribed) then) =
//       __$$_MessageEventOnSubscribedCopyWithImpl<$Res>;
//   @useResult
//   $Res call({User user});
// }

// /// @nodoc
// class __$$_MessageEventOnSubscribedCopyWithImpl<$Res>
//     extends _$MessageEventCopyWithImpl<$Res, _$_MessageEventOnSubscribed>
//     implements _$$_MessageEventOnSubscribedCopyWith<$Res> {
//   __$$_MessageEventOnSubscribedCopyWithImpl(_$_MessageEventOnSubscribed _value,
//       $Res Function(_$_MessageEventOnSubscribed) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? user = null,
//   }) {
//     return _then(_$_MessageEventOnSubscribed(
//       user: null == user
//           ? _value.user
//           : user // ignore: cast_nullable_to_non_nullable
//               as User,
//     ));
//   }
// }

// /// @nodoc

// class _$_MessageEventOnSubscribed implements _MessageEventOnSubscribed {
//   const _$_MessageEventOnSubscribed({required this.user});

//   @override
//   final User user;

//   @override
//   String toString() {
//     return 'MessageEvent.onSubscribed(user: $user)';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$_MessageEventOnSubscribed &&
//             (identical(other.user, user) || other.user == user));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, user);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$_MessageEventOnSubscribedCopyWith<_$_MessageEventOnSubscribed>
//       get copyWith => __$$_MessageEventOnSubscribedCopyWithImpl<
//           _$_MessageEventOnSubscribed>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(User user) onSubscribed,
//     required TResult Function(Message message) sent,
//     required TResult Function(Message message) recieved,
//   }) {
//     return onSubscribed(user);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(User user)? onSubscribed,
//     TResult? Function(Message message)? sent,
//     TResult? Function(Message message)? recieved,
//   }) {
//     return onSubscribed?.call(user);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(User user)? onSubscribed,
//     TResult Function(Message message)? sent,
//     TResult Function(Message message)? recieved,
//     required TResult orElse(),
//   }) {
//     if (onSubscribed != null) {
//       return onSubscribed(user);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_MessageEventOnSubscribed value) onSubscribed,
//     required TResult Function(_MessageEventSent value) sent,
//     required TResult Function(_MessageEventRecieved value) recieved,
//   }) {
//     return onSubscribed(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_MessageEventOnSubscribed value)? onSubscribed,
//     TResult? Function(_MessageEventSent value)? sent,
//     TResult? Function(_MessageEventRecieved value)? recieved,
//   }) {
//     return onSubscribed?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_MessageEventOnSubscribed value)? onSubscribed,
//     TResult Function(_MessageEventSent value)? sent,
//     TResult Function(_MessageEventRecieved value)? recieved,
//     required TResult orElse(),
//   }) {
//     if (onSubscribed != null) {
//       return onSubscribed(this);
//     }
//     return orElse();
//   }
// }

// abstract class _MessageEventOnSubscribed implements MessageEvent {
//   const factory _MessageEventOnSubscribed({required final User user}) =
//       _$_MessageEventOnSubscribed;

//   User get user;
//   @JsonKey(ignore: true)
//   _$$_MessageEventOnSubscribedCopyWith<_$_MessageEventOnSubscribed>
//       get copyWith => throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class _$$_MessageEventSentCopyWith<$Res> {
//   factory _$$_MessageEventSentCopyWith(
//           _$_MessageEventSent value, $Res Function(_$_MessageEventSent) then) =
//       __$$_MessageEventSentCopyWithImpl<$Res>;
//   @useResult
//   $Res call({Message message});
// }

// /// @nodoc
// class __$$_MessageEventSentCopyWithImpl<$Res>
//     extends _$MessageEventCopyWithImpl<$Res, _$_MessageEventSent>
//     implements _$$_MessageEventSentCopyWith<$Res> {
//   __$$_MessageEventSentCopyWithImpl(
//       _$_MessageEventSent _value, $Res Function(_$_MessageEventSent) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? message = null,
//   }) {
//     return _then(_$_MessageEventSent(
//       message: null == message
//           ? _value.message
//           : message // ignore: cast_nullable_to_non_nullable
//               as Message,
//     ));
//   }
// }

// /// @nodoc

// class _$_MessageEventSent implements _MessageEventSent {
//   const _$_MessageEventSent({required this.message});

//   @override
//   final Message message;

//   @override
//   String toString() {
//     return 'MessageEvent.sent(message: $message)';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$_MessageEventSent &&
//             (identical(other.message, message) || other.message == message));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, message);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$_MessageEventSentCopyWith<_$_MessageEventSent> get copyWith =>
//       __$$_MessageEventSentCopyWithImpl<_$_MessageEventSent>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(User user) onSubscribed,
//     required TResult Function(Message message) sent,
//     required TResult Function(Message message) recieved,
//   }) {
//     return sent(message);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(User user)? onSubscribed,
//     TResult? Function(Message message)? sent,
//     TResult? Function(Message message)? recieved,
//   }) {
//     return sent?.call(message);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(User user)? onSubscribed,
//     TResult Function(Message message)? sent,
//     TResult Function(Message message)? recieved,
//     required TResult orElse(),
//   }) {
//     if (sent != null) {
//       return sent(message);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_MessageEventOnSubscribed value) onSubscribed,
//     required TResult Function(_MessageEventSent value) sent,
//     required TResult Function(_MessageEventRecieved value) recieved,
//   }) {
//     return sent(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_MessageEventOnSubscribed value)? onSubscribed,
//     TResult? Function(_MessageEventSent value)? sent,
//     TResult? Function(_MessageEventRecieved value)? recieved,
//   }) {
//     return sent?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_MessageEventOnSubscribed value)? onSubscribed,
//     TResult Function(_MessageEventSent value)? sent,
//     TResult Function(_MessageEventRecieved value)? recieved,
//     required TResult orElse(),
//   }) {
//     if (sent != null) {
//       return sent(this);
//     }
//     return orElse();
//   }
// }

// abstract class _MessageEventSent implements MessageEvent {
//   const factory _MessageEventSent({required final Message message}) =
//       _$_MessageEventSent;

//   Message get message;
//   @JsonKey(ignore: true)
//   _$$_MessageEventSentCopyWith<_$_MessageEventSent> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class _$$_MessageEventRecievedCopyWith<$Res> {
//   factory _$$_MessageEventRecievedCopyWith(_$_MessageEventRecieved value,
//           $Res Function(_$_MessageEventRecieved) then) =
//       __$$_MessageEventRecievedCopyWithImpl<$Res>;
//   @useResult
//   $Res call({Message message});
// }

// /// @nodoc
// class __$$_MessageEventRecievedCopyWithImpl<$Res>
//     extends _$MessageEventCopyWithImpl<$Res, _$_MessageEventRecieved>
//     implements _$$_MessageEventRecievedCopyWith<$Res> {
//   __$$_MessageEventRecievedCopyWithImpl(_$_MessageEventRecieved _value,
//       $Res Function(_$_MessageEventRecieved) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? message = null,
//   }) {
//     return _then(_$_MessageEventRecieved(
//       message: null == message
//           ? _value.message
//           : message // ignore: cast_nullable_to_non_nullable
//               as Message,
//     ));
//   }
// }

// /// @nodoc

// class _$_MessageEventRecieved implements _MessageEventRecieved {
//   const _$_MessageEventRecieved({required this.message});

//   @override
//   final Message message;

//   @override
//   String toString() {
//     return 'MessageEvent.recieved(message: $message)';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$_MessageEventRecieved &&
//             (identical(other.message, message) || other.message == message));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, message);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$_MessageEventRecievedCopyWith<_$_MessageEventRecieved> get copyWith =>
//       __$$_MessageEventRecievedCopyWithImpl<_$_MessageEventRecieved>(
//           this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(User user) onSubscribed,
//     required TResult Function(Message message) sent,
//     required TResult Function(Message message) recieved,
//   }) {
//     return recieved(message);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(User user)? onSubscribed,
//     TResult? Function(Message message)? sent,
//     TResult? Function(Message message)? recieved,
//   }) {
//     return recieved?.call(message);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(User user)? onSubscribed,
//     TResult Function(Message message)? sent,
//     TResult Function(Message message)? recieved,
//     required TResult orElse(),
//   }) {
//     if (recieved != null) {
//       return recieved(message);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_MessageEventOnSubscribed value) onSubscribed,
//     required TResult Function(_MessageEventSent value) sent,
//     required TResult Function(_MessageEventRecieved value) recieved,
//   }) {
//     return recieved(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_MessageEventOnSubscribed value)? onSubscribed,
//     TResult? Function(_MessageEventSent value)? sent,
//     TResult? Function(_MessageEventRecieved value)? recieved,
//   }) {
//     return recieved?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_MessageEventOnSubscribed value)? onSubscribed,
//     TResult Function(_MessageEventSent value)? sent,
//     TResult Function(_MessageEventRecieved value)? recieved,
//     required TResult orElse(),
//   }) {
//     if (recieved != null) {
//       return recieved(this);
//     }
//     return orElse();
//   }
// }

// abstract class _MessageEventRecieved implements MessageEvent {
//   const factory _MessageEventRecieved({required final Message message}) =
//       _$_MessageEventRecieved;

//   Message get message;
//   @JsonKey(ignore: true)
//   _$$_MessageEventRecievedCopyWith<_$_MessageEventRecieved> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// mixin _$MessageState {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() initial,
//     required TResult Function(Message message) sentSuccess,
//     required TResult Function(Message message) receivedSuccess,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? initial,
//     TResult? Function(Message message)? sentSuccess,
//     TResult? Function(Message message)? receivedSuccess,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? initial,
//     TResult Function(Message message)? sentSuccess,
//     TResult Function(Message message)? receivedSuccess,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_MessageStateInitial value) initial,
//     required TResult Function(_MessageStateSentSuccess value) sentSuccess,
//     required TResult Function(_MessageStateReceivedSuccess value)
//         receivedSuccess,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_MessageStateInitial value)? initial,
//     TResult? Function(_MessageStateSentSuccess value)? sentSuccess,
//     TResult? Function(_MessageStateReceivedSuccess value)? receivedSuccess,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_MessageStateInitial value)? initial,
//     TResult Function(_MessageStateSentSuccess value)? sentSuccess,
//     TResult Function(_MessageStateReceivedSuccess value)? receivedSuccess,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $MessageStateCopyWith<$Res> {
//   factory $MessageStateCopyWith(
//           MessageState value, $Res Function(MessageState) then) =
//       _$MessageStateCopyWithImpl<$Res, MessageState>;
// }

// /// @nodoc
// class _$MessageStateCopyWithImpl<$Res, $Val extends MessageState>
//     implements $MessageStateCopyWith<$Res> {
//   _$MessageStateCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;
// }

// /// @nodoc
// abstract class _$$_MessageStateInitialCopyWith<$Res> {
//   factory _$$_MessageStateInitialCopyWith(_$_MessageStateInitial value,
//           $Res Function(_$_MessageStateInitial) then) =
//       __$$_MessageStateInitialCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$_MessageStateInitialCopyWithImpl<$Res>
//     extends _$MessageStateCopyWithImpl<$Res, _$_MessageStateInitial>
//     implements _$$_MessageStateInitialCopyWith<$Res> {
//   __$$_MessageStateInitialCopyWithImpl(_$_MessageStateInitial _value,
//       $Res Function(_$_MessageStateInitial) _then)
//       : super(_value, _then);
// }

// /// @nodoc

// class _$_MessageStateInitial implements _MessageStateInitial {
//   const _$_MessageStateInitial();

//   @override
//   String toString() {
//     return 'MessageState.initial()';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is _$_MessageStateInitial);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() initial,
//     required TResult Function(Message message) sentSuccess,
//     required TResult Function(Message message) receivedSuccess,
//   }) {
//     return initial();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? initial,
//     TResult? Function(Message message)? sentSuccess,
//     TResult? Function(Message message)? receivedSuccess,
//   }) {
//     return initial?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? initial,
//     TResult Function(Message message)? sentSuccess,
//     TResult Function(Message message)? receivedSuccess,
//     required TResult orElse(),
//   }) {
//     if (initial != null) {
//       return initial();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_MessageStateInitial value) initial,
//     required TResult Function(_MessageStateSentSuccess value) sentSuccess,
//     required TResult Function(_MessageStateReceivedSuccess value)
//         receivedSuccess,
//   }) {
//     return initial(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_MessageStateInitial value)? initial,
//     TResult? Function(_MessageStateSentSuccess value)? sentSuccess,
//     TResult? Function(_MessageStateReceivedSuccess value)? receivedSuccess,
//   }) {
//     return initial?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_MessageStateInitial value)? initial,
//     TResult Function(_MessageStateSentSuccess value)? sentSuccess,
//     TResult Function(_MessageStateReceivedSuccess value)? receivedSuccess,
//     required TResult orElse(),
//   }) {
//     if (initial != null) {
//       return initial(this);
//     }
//     return orElse();
//   }
// }

// abstract class _MessageStateInitial implements MessageState {
//   const factory _MessageStateInitial() = _$_MessageStateInitial;
// }

// /// @nodoc
// abstract class _$$_MessageStateSentSuccessCopyWith<$Res> {
//   factory _$$_MessageStateSentSuccessCopyWith(_$_MessageStateSentSuccess value,
//           $Res Function(_$_MessageStateSentSuccess) then) =
//       __$$_MessageStateSentSuccessCopyWithImpl<$Res>;
//   @useResult
//   $Res call({Message message});
// }

// /// @nodoc
// class __$$_MessageStateSentSuccessCopyWithImpl<$Res>
//     extends _$MessageStateCopyWithImpl<$Res, _$_MessageStateSentSuccess>
//     implements _$$_MessageStateSentSuccessCopyWith<$Res> {
//   __$$_MessageStateSentSuccessCopyWithImpl(_$_MessageStateSentSuccess _value,
//       $Res Function(_$_MessageStateSentSuccess) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? message = null,
//   }) {
//     return _then(_$_MessageStateSentSuccess(
//       message: null == message
//           ? _value.message
//           : message // ignore: cast_nullable_to_non_nullable
//               as Message,
//     ));
//   }
// }

// /// @nodoc

// class _$_MessageStateSentSuccess implements _MessageStateSentSuccess {
//   const _$_MessageStateSentSuccess({required this.message});

//   @override
//   final Message message;

//   @override
//   String toString() {
//     return 'MessageState.sentSuccess(message: $message)';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$_MessageStateSentSuccess &&
//             (identical(other.message, message) || other.message == message));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, message);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$_MessageStateSentSuccessCopyWith<_$_MessageStateSentSuccess>
//       get copyWith =>
//           __$$_MessageStateSentSuccessCopyWithImpl<_$_MessageStateSentSuccess>(
//               this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() initial,
//     required TResult Function(Message message) sentSuccess,
//     required TResult Function(Message message) receivedSuccess,
//   }) {
//     return sentSuccess(message);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? initial,
//     TResult? Function(Message message)? sentSuccess,
//     TResult? Function(Message message)? receivedSuccess,
//   }) {
//     return sentSuccess?.call(message);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? initial,
//     TResult Function(Message message)? sentSuccess,
//     TResult Function(Message message)? receivedSuccess,
//     required TResult orElse(),
//   }) {
//     if (sentSuccess != null) {
//       return sentSuccess(message);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_MessageStateInitial value) initial,
//     required TResult Function(_MessageStateSentSuccess value) sentSuccess,
//     required TResult Function(_MessageStateReceivedSuccess value)
//         receivedSuccess,
//   }) {
//     return sentSuccess(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_MessageStateInitial value)? initial,
//     TResult? Function(_MessageStateSentSuccess value)? sentSuccess,
//     TResult? Function(_MessageStateReceivedSuccess value)? receivedSuccess,
//   }) {
//     return sentSuccess?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_MessageStateInitial value)? initial,
//     TResult Function(_MessageStateSentSuccess value)? sentSuccess,
//     TResult Function(_MessageStateReceivedSuccess value)? receivedSuccess,
//     required TResult orElse(),
//   }) {
//     if (sentSuccess != null) {
//       return sentSuccess(this);
//     }
//     return orElse();
//   }
// }

// abstract class _MessageStateSentSuccess implements MessageState {
//   const factory _MessageStateSentSuccess({required final Message message}) =
//       _$_MessageStateSentSuccess;

//   Message get message;
//   @JsonKey(ignore: true)
//   _$$_MessageStateSentSuccessCopyWith<_$_MessageStateSentSuccess>
//       get copyWith => throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class _$$_MessageStateReceivedSuccessCopyWith<$Res> {
//   factory _$$_MessageStateReceivedSuccessCopyWith(
//           _$_MessageStateReceivedSuccess value,
//           $Res Function(_$_MessageStateReceivedSuccess) then) =
//       __$$_MessageStateReceivedSuccessCopyWithImpl<$Res>;
//   @useResult
//   $Res call({Message message});
// }

// /// @nodoc
// class __$$_MessageStateReceivedSuccessCopyWithImpl<$Res>
//     extends _$MessageStateCopyWithImpl<$Res, _$_MessageStateReceivedSuccess>
//     implements _$$_MessageStateReceivedSuccessCopyWith<$Res> {
//   __$$_MessageStateReceivedSuccessCopyWithImpl(
//       _$_MessageStateReceivedSuccess _value,
//       $Res Function(_$_MessageStateReceivedSuccess) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? message = null,
//   }) {
//     return _then(_$_MessageStateReceivedSuccess(
//       message: null == message
//           ? _value.message
//           : message // ignore: cast_nullable_to_non_nullable
//               as Message,
//     ));
//   }
// }

// /// @nodoc

// class _$_MessageStateReceivedSuccess implements _MessageStateReceivedSuccess {
//   const _$_MessageStateReceivedSuccess({required this.message});

//   @override
//   final Message message;

//   @override
//   String toString() {
//     return 'MessageState.receivedSuccess(message: $message)';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$_MessageStateReceivedSuccess &&
//             (identical(other.message, message) || other.message == message));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, message);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$_MessageStateReceivedSuccessCopyWith<_$_MessageStateReceivedSuccess>
//       get copyWith => __$$_MessageStateReceivedSuccessCopyWithImpl<
//           _$_MessageStateReceivedSuccess>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() initial,
//     required TResult Function(Message message) sentSuccess,
//     required TResult Function(Message message) receivedSuccess,
//   }) {
//     return receivedSuccess(message);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? initial,
//     TResult? Function(Message message)? sentSuccess,
//     TResult? Function(Message message)? receivedSuccess,
//   }) {
//     return receivedSuccess?.call(message);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? initial,
//     TResult Function(Message message)? sentSuccess,
//     TResult Function(Message message)? receivedSuccess,
//     required TResult orElse(),
//   }) {
//     if (receivedSuccess != null) {
//       return receivedSuccess(message);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_MessageStateInitial value) initial,
//     required TResult Function(_MessageStateSentSuccess value) sentSuccess,
//     required TResult Function(_MessageStateReceivedSuccess value)
//         receivedSuccess,
//   }) {
//     return receivedSuccess(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_MessageStateInitial value)? initial,
//     TResult? Function(_MessageStateSentSuccess value)? sentSuccess,
//     TResult? Function(_MessageStateReceivedSuccess value)? receivedSuccess,
//   }) {
//     return receivedSuccess?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_MessageStateInitial value)? initial,
//     TResult Function(_MessageStateSentSuccess value)? sentSuccess,
//     TResult Function(_MessageStateReceivedSuccess value)? receivedSuccess,
//     required TResult orElse(),
//   }) {
//     if (receivedSuccess != null) {
//       return receivedSuccess(this);
//     }
//     return orElse();
//   }
// }

// abstract class _MessageStateReceivedSuccess implements MessageState {
//   const factory _MessageStateReceivedSuccess({required final Message message}) =
//       _$_MessageStateReceivedSuccess;

//   Message get message;
//   @JsonKey(ignore: true)
//   _$$_MessageStateReceivedSuccessCopyWith<_$_MessageStateReceivedSuccess>
//       get copyWith => throw _privateConstructorUsedError;
// }
