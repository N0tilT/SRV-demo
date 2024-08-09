// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ItemEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  bool get isFavourite => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemEntityCopyWith<ItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEntityCopyWith<$Res> {
  factory $ItemEntityCopyWith(
          ItemEntity value, $Res Function(ItemEntity) then) =
      _$ItemEntityCopyWithImpl<$Res, ItemEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String image,
      bool isFavourite,
      double price});
}

/// @nodoc
class _$ItemEntityCopyWithImpl<$Res, $Val extends ItemEntity>
    implements $ItemEntityCopyWith<$Res> {
  _$ItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? isFavourite = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemEntityImplCopyWith<$Res>
    implements $ItemEntityCopyWith<$Res> {
  factory _$$ItemEntityImplCopyWith(
          _$ItemEntityImpl value, $Res Function(_$ItemEntityImpl) then) =
      __$$ItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String image,
      bool isFavourite,
      double price});
}

/// @nodoc
class __$$ItemEntityImplCopyWithImpl<$Res>
    extends _$ItemEntityCopyWithImpl<$Res, _$ItemEntityImpl>
    implements _$$ItemEntityImplCopyWith<$Res> {
  __$$ItemEntityImplCopyWithImpl(
      _$ItemEntityImpl _value, $Res Function(_$ItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? isFavourite = null,
    Object? price = null,
  }) {
    return _then(_$ItemEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ItemEntityImpl implements _ItemEntity {
  const _$ItemEntityImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.isFavourite,
      required this.price});

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;
  @override
  final bool isFavourite;
  @override
  final double price;

  @override
  String toString() {
    return 'ItemEntity(id: $id, title: $title, description: $description, image: $image, isFavourite: $isFavourite, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, image, isFavourite, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemEntityImplCopyWith<_$ItemEntityImpl> get copyWith =>
      __$$ItemEntityImplCopyWithImpl<_$ItemEntityImpl>(this, _$identity);
}

abstract class _ItemEntity implements ItemEntity {
  const factory _ItemEntity(
      {required final int id,
      required final String title,
      required final String description,
      required final String image,
      required final bool isFavourite,
      required final double price}) = _$ItemEntityImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get image;
  @override
  bool get isFavourite;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$ItemEntityImplCopyWith<_$ItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
