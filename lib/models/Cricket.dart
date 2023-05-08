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

import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Cricket type in your schema. */
@immutable
class Cricket extends Model {
  static const classType = const _CricketModelType();
  final String id;
  final List<String>? _photos;
  final String? _l1;
  final String? _l2;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CricketModelIdentifier get modelIdentifier {
      return CricketModelIdentifier(
        id: id
      );
  }
  
  List<String>? get photos {
    return _photos;
  }
  
  String get l1 {
    try {
      return _l1!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get l2 {
    try {
      return _l2!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Cricket._internal({required this.id, photos, required l1, required l2, createdAt, updatedAt}): _photos = photos, _l1 = l1, _l2 = l2, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Cricket({String? id, List<String>? photos, required String l1, required String l2}) {
    return Cricket._internal(
      id: id == null ? UUID.getUUID() : id,
      photos: photos != null ? List<String>.unmodifiable(photos) : photos,
      l1: l1,
      l2: l2);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cricket &&
      id == other.id &&
      DeepCollectionEquality().equals(_photos, other._photos) &&
      _l1 == other._l1 &&
      _l2 == other._l2;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Cricket {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("photos=" + (_photos != null ? _photos!.toString() : "null") + ", ");
    buffer.write("l1=" + "$_l1" + ", ");
    buffer.write("l2=" + "$_l2" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Cricket copyWith({List<String>? photos, String? l1, String? l2}) {
    return Cricket._internal(
      id: id,
      photos: photos ?? this.photos,
      l1: l1 ?? this.l1,
      l2: l2 ?? this.l2);
  }
  
  Cricket.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _photos = json['photos']?.cast<String>(),
      _l1 = json['l1'],
      _l2 = json['l2'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'photos': _photos, 'l1': _l1, 'l2': _l2, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'photos': _photos, 'l1': _l1, 'l2': _l2, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<CricketModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<CricketModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField PHOTOS = QueryField(fieldName: "photos");
  static final QueryField L1 = QueryField(fieldName: "l1");
  static final QueryField L2 = QueryField(fieldName: "l2");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Cricket";
    modelSchemaDefinition.pluralName = "Crickets";
    
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
      key: Cricket.PHOTOS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Cricket.L1,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Cricket.L2,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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
  });
}

class _CricketModelType extends ModelType<Cricket> {
  const _CricketModelType();
  
  @override
  Cricket fromJson(Map<String, dynamic> jsonData) {
    return Cricket.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Cricket';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Cricket] in your schema.
 */
@immutable
class CricketModelIdentifier implements ModelIdentifier<Cricket> {
  final String id;

  /** Create an instance of CricketModelIdentifier using [id] the primary key. */
  const CricketModelIdentifier({
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
  String toString() => 'CricketModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CricketModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}