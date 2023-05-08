/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Sports type in your schema. */
@immutable
class Sports extends Model {
  static const classType = const _SportsModelType();
  final String id;
  final String? _name;
  final Cricket? _cricket;
  final Football? _football;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _sportsCricketId;
  final String? _sportsFootballId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  SportsModelIdentifier get modelIdentifier {
      return SportsModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Cricket? get cricket {
    return _cricket;
  }
  
  Football? get football {
    return _football;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get sportsCricketId {
    return _sportsCricketId;
  }
  
  String? get sportsFootballId {
    return _sportsFootballId;
  }
  
  const Sports._internal({required this.id, required name, cricket, football, createdAt, updatedAt, sportsCricketId, sportsFootballId}): _name = name, _cricket = cricket, _football = football, _createdAt = createdAt, _updatedAt = updatedAt, _sportsCricketId = sportsCricketId, _sportsFootballId = sportsFootballId;
  
  factory Sports({String? id, required String name, Cricket? cricket, Football? football, String? sportsCricketId, String? sportsFootballId}) {
    return Sports._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      cricket: cricket,
      football: football,
      sportsCricketId: sportsCricketId,
      sportsFootballId: sportsFootballId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sports &&
      id == other.id &&
      _name == other._name &&
      _cricket == other._cricket &&
      _football == other._football &&
      _sportsCricketId == other._sportsCricketId &&
      _sportsFootballId == other._sportsFootballId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Sports {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("sportsCricketId=" + "$_sportsCricketId" + ", ");
    buffer.write("sportsFootballId=" + "$_sportsFootballId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Sports copyWith({String? name, Cricket? cricket, Football? football, String? sportsCricketId, String? sportsFootballId}) {
    return Sports._internal(
      id: id,
      name: name ?? this.name,
      cricket: cricket ?? this.cricket,
      football: football ?? this.football,
      sportsCricketId: sportsCricketId ?? this.sportsCricketId,
      sportsFootballId: sportsFootballId ?? this.sportsFootballId);
  }
  
  Sports.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _cricket = json['cricket']?['serializedData'] != null
        ? Cricket.fromJson(new Map<String, dynamic>.from(json['cricket']['serializedData']))
        : null,
      _football = json['football']?['serializedData'] != null
        ? Football.fromJson(new Map<String, dynamic>.from(json['football']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _sportsCricketId = json['sportsCricketId'],
      _sportsFootballId = json['sportsFootballId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'cricket': _cricket?.toJson(), 'football': _football?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'sportsCricketId': _sportsCricketId, 'sportsFootballId': _sportsFootballId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'cricket': _cricket, 'football': _football, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'sportsCricketId': _sportsCricketId, 'sportsFootballId': _sportsFootballId
  };

  static final QueryModelIdentifier<SportsModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<SportsModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField CRICKET = QueryField(
    fieldName: "cricket",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Cricket'));
  static final QueryField FOOTBALL = QueryField(
    fieldName: "football",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Football'));
  static final QueryField SPORTSCRICKETID = QueryField(fieldName: "sportsCricketId");
  static final QueryField SPORTSFOOTBALLID = QueryField(fieldName: "sportsFootballId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Sports";
    modelSchemaDefinition.pluralName = "Sports";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Sports.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Sports.CRICKET,
      isRequired: false,
      ofModelName: 'Cricket',
      associatedKey: Cricket.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Sports.FOOTBALL,
      isRequired: false,
      ofModelName: 'Football',
      associatedKey: Football.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Sports.SPORTSCRICKETID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Sports.SPORTSFOOTBALLID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _SportsModelType extends ModelType<Sports> {
  const _SportsModelType();
  
  @override
  Sports fromJson(Map<String, dynamic> jsonData) {
    return Sports.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Sports';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Sports] in your schema.
 */
@immutable
class SportsModelIdentifier implements ModelIdentifier<Sports> {
  final String id;

  /** Create an instance of SportsModelIdentifier using [id] the primary key. */
  const SportsModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'SportsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is SportsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}