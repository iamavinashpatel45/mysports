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


/** This is an auto generated class representing the Mysports type in your schema. */
@immutable
class Mysports extends Model {
  static const classType = const _MysportsModelType();
  final String id;
  final String? _name;
  final String? _phone;
  final bool? _user;
  final Owner? _owner;
  final Sports? _sports;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _mysportsOwnerId;
  final String? _mysportsSportsId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  MysportsModelIdentifier get modelIdentifier {
      return MysportsModelIdentifier(
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
  
  String get phone {
    try {
      return _phone!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get user {
    try {
      return _user!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Owner? get owner {
    return _owner;
  }
  
  Sports? get sports {
    return _sports;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get mysportsOwnerId {
    return _mysportsOwnerId;
  }
  
  String? get mysportsSportsId {
    return _mysportsSportsId;
  }
  
  const Mysports._internal({required this.id, required name, required phone, required user, owner, sports, createdAt, updatedAt, mysportsOwnerId, mysportsSportsId}): _name = name, _phone = phone, _user = user, _owner = owner, _sports = sports, _createdAt = createdAt, _updatedAt = updatedAt, _mysportsOwnerId = mysportsOwnerId, _mysportsSportsId = mysportsSportsId;
  
  factory Mysports({String? id, required String name, required String phone, required bool user, Owner? owner, Sports? sports, String? mysportsOwnerId, String? mysportsSportsId}) {
    return Mysports._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      phone: phone,
      user: user,
      owner: owner,
      sports: sports,
      mysportsOwnerId: mysportsOwnerId,
      mysportsSportsId: mysportsSportsId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Mysports &&
      id == other.id &&
      _name == other._name &&
      _phone == other._phone &&
      _user == other._user &&
      _owner == other._owner &&
      _sports == other._sports &&
      _mysportsOwnerId == other._mysportsOwnerId &&
      _mysportsSportsId == other._mysportsSportsId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Mysports {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("mysportsOwnerId=" + "$_mysportsOwnerId" + ", ");
    buffer.write("mysportsSportsId=" + "$_mysportsSportsId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Mysports copyWith({String? name, String? phone, bool? user, Owner? owner, Sports? sports, String? mysportsOwnerId, String? mysportsSportsId}) {
    return Mysports._internal(
      id: id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      user: user ?? this.user,
      owner: owner ?? this.owner,
      sports: sports ?? this.sports,
      mysportsOwnerId: mysportsOwnerId ?? this.mysportsOwnerId,
      mysportsSportsId: mysportsSportsId ?? this.mysportsSportsId);
  }
  
  Mysports.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _phone = json['phone'],
      _user = json['user'],
      _owner = json['owner']?['serializedData'] != null
        ? Owner.fromJson(new Map<String, dynamic>.from(json['owner']['serializedData']))
        : null,
      _sports = json['sports']?['serializedData'] != null
        ? Sports.fromJson(new Map<String, dynamic>.from(json['sports']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _mysportsOwnerId = json['mysportsOwnerId'],
      _mysportsSportsId = json['mysportsSportsId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'phone': _phone, 'user': _user, 'owner': _owner?.toJson(), 'sports': _sports?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'mysportsOwnerId': _mysportsOwnerId, 'mysportsSportsId': _mysportsSportsId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'phone': _phone, 'user': _user, 'owner': _owner, 'sports': _sports, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'mysportsOwnerId': _mysportsOwnerId, 'mysportsSportsId': _mysportsSportsId
  };

  static final QueryModelIdentifier<MysportsModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<MysportsModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField USER = QueryField(fieldName: "user");
  static final QueryField OWNER = QueryField(
    fieldName: "owner",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Owner'));
  static final QueryField SPORTS = QueryField(
    fieldName: "sports",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Sports'));
  static final QueryField MYSPORTSOWNERID = QueryField(fieldName: "mysportsOwnerId");
  static final QueryField MYSPORTSSPORTSID = QueryField(fieldName: "mysportsSportsId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Mysports";
    modelSchemaDefinition.pluralName = "Mysports";
    
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
      key: Mysports.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Mysports.PHONE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Mysports.USER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Mysports.OWNER,
      isRequired: false,
      ofModelName: 'Owner',
      associatedKey: Owner.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Mysports.SPORTS,
      isRequired: false,
      ofModelName: 'Sports',
      associatedKey: Sports.ID
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
      key: Mysports.MYSPORTSOWNERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Mysports.MYSPORTSSPORTSID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _MysportsModelType extends ModelType<Mysports> {
  const _MysportsModelType();
  
  @override
  Mysports fromJson(Map<String, dynamic> jsonData) {
    return Mysports.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Mysports';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Mysports] in your schema.
 */
@immutable
class MysportsModelIdentifier implements ModelIdentifier<Mysports> {
  final String id;

  /** Create an instance of MysportsModelIdentifier using [id] the primary key. */
  const MysportsModelIdentifier({
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
  String toString() => 'MysportsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is MysportsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}