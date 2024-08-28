// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetQrModelCollection on Isar {
  IsarCollection<int, QrModel> get qrModels => this.collection();
}

const QrModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'QrModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'qrCode',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'bank',
        type: IsarType.object,
        target: 'BankModel',
      ),
      IsarPropertySchema(
        name: 'bankNumber',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'createdAt',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, QrModel>(
    serialize: serializeQrModel,
    deserialize: deserializeQrModel,
    deserializeProperty: deserializeQrModelProp,
  ),
  embeddedSchemas: [BankModelSchema],
);

@isarProtected
int serializeQrModel(IsarWriter writer, QrModel object) {
  IsarCore.writeString(writer, 1, object.qrCode);
  {
    final value = object.bank;
    final objectWriter = IsarCore.beginObject(writer, 2);
    serializeBankModel(objectWriter, value);
    IsarCore.endObject(writer, objectWriter);
  }
  IsarCore.writeString(writer, 3, object.bankNumber);
  IsarCore.writeLong(
      writer, 4, object.createdAt.toUtc().microsecondsSinceEpoch);
  return object.id;
}

@isarProtected
QrModel deserializeQrModel(IsarReader reader) {
  final object = QrModel();
  object.id = IsarCore.readId(reader);
  object.qrCode = IsarCore.readString(reader, 1) ?? '';
  {
    final objectReader = IsarCore.readObject(reader, 2);
    if (objectReader.isNull) {
      object.bank = BankModel();
    } else {
      final embedded = deserializeBankModel(objectReader);
      IsarCore.freeReader(objectReader);
      object.bank = embedded;
    }
  }
  object.bankNumber = IsarCore.readString(reader, 3) ?? '';
  return object;
}

@isarProtected
dynamic deserializeQrModelProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      {
        final objectReader = IsarCore.readObject(reader, 2);
        if (objectReader.isNull) {
          return BankModel();
        } else {
          final embedded = deserializeBankModel(objectReader);
          IsarCore.freeReader(objectReader);
          return embedded;
        }
      }
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    case 4:
      {
        final value = IsarCore.readLong(reader, 4);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _QrModelUpdate {
  bool call({
    required int id,
    String? qrCode,
    String? bankNumber,
    DateTime? createdAt,
  });
}

class _QrModelUpdateImpl implements _QrModelUpdate {
  const _QrModelUpdateImpl(this.collection);

  final IsarCollection<int, QrModel> collection;

  @override
  bool call({
    required int id,
    Object? qrCode = ignore,
    Object? bankNumber = ignore,
    Object? createdAt = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (qrCode != ignore) 1: qrCode as String?,
          if (bankNumber != ignore) 3: bankNumber as String?,
          if (createdAt != ignore) 4: createdAt as DateTime?,
        }) >
        0;
  }
}

sealed class _QrModelUpdateAll {
  int call({
    required List<int> id,
    String? qrCode,
    String? bankNumber,
    DateTime? createdAt,
  });
}

class _QrModelUpdateAllImpl implements _QrModelUpdateAll {
  const _QrModelUpdateAllImpl(this.collection);

  final IsarCollection<int, QrModel> collection;

  @override
  int call({
    required List<int> id,
    Object? qrCode = ignore,
    Object? bankNumber = ignore,
    Object? createdAt = ignore,
  }) {
    return collection.updateProperties(id, {
      if (qrCode != ignore) 1: qrCode as String?,
      if (bankNumber != ignore) 3: bankNumber as String?,
      if (createdAt != ignore) 4: createdAt as DateTime?,
    });
  }
}

extension QrModelUpdate on IsarCollection<int, QrModel> {
  _QrModelUpdate get update => _QrModelUpdateImpl(this);

  _QrModelUpdateAll get updateAll => _QrModelUpdateAllImpl(this);
}

sealed class _QrModelQueryUpdate {
  int call({
    String? qrCode,
    String? bankNumber,
    DateTime? createdAt,
  });
}

class _QrModelQueryUpdateImpl implements _QrModelQueryUpdate {
  const _QrModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<QrModel> query;
  final int? limit;

  @override
  int call({
    Object? qrCode = ignore,
    Object? bankNumber = ignore,
    Object? createdAt = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (qrCode != ignore) 1: qrCode as String?,
      if (bankNumber != ignore) 3: bankNumber as String?,
      if (createdAt != ignore) 4: createdAt as DateTime?,
    });
  }
}

extension QrModelQueryUpdate on IsarQuery<QrModel> {
  _QrModelQueryUpdate get updateFirst =>
      _QrModelQueryUpdateImpl(this, limit: 1);

  _QrModelQueryUpdate get updateAll => _QrModelQueryUpdateImpl(this);
}

class _QrModelQueryBuilderUpdateImpl implements _QrModelQueryUpdate {
  const _QrModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<QrModel, QrModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? qrCode = ignore,
    Object? bankNumber = ignore,
    Object? createdAt = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (qrCode != ignore) 1: qrCode as String?,
        if (bankNumber != ignore) 3: bankNumber as String?,
        if (createdAt != ignore) 4: createdAt as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension QrModelQueryBuilderUpdate
    on QueryBuilder<QrModel, QrModel, QOperations> {
  _QrModelQueryUpdate get updateFirst =>
      _QrModelQueryBuilderUpdateImpl(this, limit: 1);

  _QrModelQueryUpdate get updateAll => _QrModelQueryBuilderUpdateImpl(this);
}

extension QrModelQueryFilter
    on QueryBuilder<QrModel, QrModel, QFilterCondition> {
  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition>
      qrCodeGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> qrCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bankNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bankNumberGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition>
      bankNumberGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bankNumberLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition>
      bankNumberLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bankNumberBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bankNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bankNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bankNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bankNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bankNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bankNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition>
      createdAtGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> createdAtLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition>
      createdAtLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension QrModelQueryObject
    on QueryBuilder<QrModel, QrModel, QFilterCondition> {
  QueryBuilder<QrModel, QrModel, QAfterFilterCondition> bank(
      FilterQuery<BankModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 2);
    });
  }
}

extension QrModelQuerySortBy on QueryBuilder<QrModel, QrModel, QSortBy> {
  QueryBuilder<QrModel, QrModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> sortByQrCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> sortByQrCodeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> sortByBankNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> sortByBankNumberDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }
}

extension QrModelQuerySortThenBy
    on QueryBuilder<QrModel, QrModel, QSortThenBy> {
  QueryBuilder<QrModel, QrModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> thenByQrCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> thenByQrCodeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> thenByBankNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> thenByBankNumberDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }
}

extension QrModelQueryWhereDistinct
    on QueryBuilder<QrModel, QrModel, QDistinct> {
  QueryBuilder<QrModel, QrModel, QAfterDistinct> distinctByQrCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterDistinct> distinctByBankNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QrModel, QrModel, QAfterDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }
}

extension QrModelQueryProperty1 on QueryBuilder<QrModel, QrModel, QProperty> {
  QueryBuilder<QrModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<QrModel, String, QAfterProperty> qrCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<QrModel, BankModel, QAfterProperty> bankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<QrModel, String, QAfterProperty> bankNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<QrModel, DateTime, QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }
}

extension QrModelQueryProperty2<R> on QueryBuilder<QrModel, R, QAfterProperty> {
  QueryBuilder<QrModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<QrModel, (R, String), QAfterProperty> qrCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<QrModel, (R, BankModel), QAfterProperty> bankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<QrModel, (R, String), QAfterProperty> bankNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<QrModel, (R, DateTime), QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }
}

extension QrModelQueryProperty3<R1, R2>
    on QueryBuilder<QrModel, (R1, R2), QAfterProperty> {
  QueryBuilder<QrModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<QrModel, (R1, R2, String), QOperations> qrCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<QrModel, (R1, R2, BankModel), QOperations> bankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<QrModel, (R1, R2, String), QOperations> bankNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<QrModel, (R1, R2, DateTime), QOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }
}
