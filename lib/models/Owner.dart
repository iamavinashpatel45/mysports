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


/** This is an auto generated class representing the Owner type in your schema. */
@immutable
class Owner extends Model {
  static const classType = const _OwnerModelType();
  final String id;
  final String? _l1;
  final String? _l2;
  final List<String>? _photos;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OwnerModelIdentifier get modelIdentifier {
      return OwnerModelIdentifier(
        id: id
      );
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
  
  List<String>? get photos {
    return _photos;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Owner._internal({required this.id, required l1, required l2, photos, createdAt, updatedAt}): _l1 = l1, _l2 = l2, _photos = photos, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Owner({String? id, required String l1, required String l2, List<String>? photos}) {
    return Owner._internal(
      id: id == null ? UUID.getUUID() : id,
      l1: l1,
      l2: l2,
      photos: photos != null ? List<String>.unmodifiable(photos) : photos);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Owner &&
      id == other.id &&
      _l1 == other._l1 &&
      _l2 == other._l2 &&
      DeepCollectionEquality().equals(_photos, other._photos);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Owner {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("l1=" + "$_l1" + ", ");
    buffer.write("l2=" + "$_l2" + ", ");
    buffer.write("photos=" + (_photos != null ? _photos!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Owner copyWith({String? l1, String? l2, List<String>? photos}) {
    return Owner._internal(
      id: id,
      l1: l1 ?? this.l1,
      l2: l2 ?? this.l2,
      photos: photos ?? this.photos);
  }
  
  Owner.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _l1 = json['l1'],
      _l2 = json['l2'],
      _photos = json['photos']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'l1': _l1, 'l2': _l2, 'photos': _photos, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'l1': _l1, 'l2': _l2, 'photos': _photos, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<OwnerModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<OwnerModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField L1 = QueryField(fieldName: "l1");
  static final QueryField L2 = QueryField(fieldName: "l2");
  static final QueryField PHOTOS = QueryField(fieldName: "photos");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Owner";
    modelSchemaDefinition.pluralName = "Owners";
    
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
      key: Owner.L1,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Owner.L2,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Owner.PHOTOS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
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

class _OwnerModelType extends ModelType<Owner> {
  const _OwnerModelType();
  
  @override
  Owner fromJson(Map<String, dynamic> jsonData) {
    return Owner.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Owner';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Owner] in your schema.
 */
@immutable
class OwnerModelIdentifier implements ModelIdentifier<Owner> {
  final String id;

  /** Create an instance of OwnerModelIdentifier using [id] the primary key. */
  const OwnerModelIdentifier({
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
  String toString() => 'OwnerModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OwnerModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}