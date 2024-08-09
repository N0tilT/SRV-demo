// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return _ItemModel.fromJson(json);
}

/// @nodoc
mixin _$ItemModel {
  @JsonKey(name: 'Id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Image')
  @HiveField(3)
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsFavourite')
  @HiveField(4)
  bool get isFavourite => throw _privateConstructorUsedError;
  @JsonKey(name: 'Price')
  @HiveField(5)
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemModelCopyWith<ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemModelCopyWith<$Res> {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) then) =
      _$ItemModelCopyWithImpl<$Res, ItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') @HiveField(0) int id,
      @JsonKey(name: 'Title') @HiveField(1) String title,
      @JsonKey(name: 'Description') @HiveField(2) String description,
      @JsonKey(name: 'Image') @HiveField(3) String image,
      @JsonKey(name: 'IsFavourite') @HiveField(4) bool isFavourite,
      @JsonKey(name: 'Price') @HiveField(5) double price});
}

/// @nodoc
class _$ItemModelCopyWithImpl<$Res, $Val extends ItemModel>
    implements $ItemModelCopyWith<$Res> {
  _$ItemModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ItemModelImplCopyWith<$Res>
    implements $ItemModelCopyWith<$Res> {
  factory _$$ItemModelImplCopyWith(
          _$ItemModelImpl value, $Res Function(_$ItemModelImpl) then) =
      __$$ItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') @HiveField(0) int id,
      @JsonKey(name: 'Title') @HiveField(1) String title,
      @JsonKey(name: 'Description') @HiveField(2) String description,
      @JsonKey(name: 'Image') @HiveField(3) String image,
      @JsonKey(name: 'IsFavourite') @HiveField(4) bool isFavourite,
      @JsonKey(name: 'Price') @HiveField(5) double price});
}

/// @nodoc
class __$$ItemModelImplCopyWithImpl<$Res>
    extends _$ItemModelCopyWithImpl<$Res, _$ItemModelImpl>
    implements _$$ItemModelImplCopyWith<$Res> {
  __$$ItemModelImplCopyWithImpl(
      _$ItemModelImpl _value, $Res Function(_$ItemModelImpl) _then)
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
    return _then(_$ItemModelImpl(
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
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'ItemModelAdapter')
class _$ItemModelImpl extends _ItemModel {
  _$ItemModelImpl(
      {@JsonKey(name: 'Id') @HiveField(0) required this.id,
      @JsonKey(name: 'Title') @HiveField(1) required this.title,
      @JsonKey(name: 'Description') @HiveField(2) required this.description,
      @JsonKey(name: 'Image') @HiveField(3) required this.image,
      @JsonKey(name: 'IsFavourite') @HiveField(4) required this.isFavourite,
      @JsonKey(name: 'Price') @HiveField(5) required this.price})
      : super._();

  factory _$ItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'Id')
  @HiveField(0)
  final int id;
  @override
  @JsonKey(name: 'Title')
  @HiveField(1)
  final String title;
  @override
  @JsonKey(name: 'Description')
  @HiveField(2)
  final String description;
  @override
  @JsonKey(name: 'Image')
  @HiveField(3)
  final String image;
  @override
  @JsonKey(name: 'IsFavourite')
  @HiveField(4)
  final bool isFavourite;
  @override
  @JsonKey(name: 'Price')
  @HiveField(5)
  final double price;

  @override
  String toString() {
    return 'ItemModel(id: $id, title: $title, description: $description, image: $image, isFavourite: $isFavourite, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, image, isFavourite, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemModelImplCopyWith<_$ItemModelImpl> get copyWith =>
      __$$ItemModelImplCopyWithImpl<_$ItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemModelImplToJson(
      this,
    );
  }
}

abstract class _ItemModel extends ItemModel {
  factory _ItemModel(
          {@JsonKey(name: 'Id') @HiveField(0) required final int id,
          @JsonKey(name: 'Title') @HiveField(1) required final String title,
          @JsonKey(name: 'Description')
          @HiveField(2)
          required final String description,
          @JsonKey(name: 'Image') @HiveField(3) required final String image,
          @JsonKey(name: 'IsFavourite')
          @HiveField(4)
          required final bool isFavourite,
          @JsonKey(name: 'Price') @HiveField(5) required final double price}) =
      _$ItemModelImpl;
  _ItemModel._() : super._();

  factory _ItemModel.fromJson(Map<String, dynamic> json) =
      _$ItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'Id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'Title')
  @HiveField(1)
  String get title;
  @override
  @JsonKey(name: 'Description')
  @HiveField(2)
  String get description;
  @override
  @JsonKey(name: 'Image')
  @HiveField(3)
  String get image;
  @override
  @JsonKey(name: 'IsFavourite')
  @HiveField(4)
  bool get isFavourite;
  @override
  @JsonKey(name: 'Price')
  @HiveField(5)
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$ItemModelImplCopyWith<_$ItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
