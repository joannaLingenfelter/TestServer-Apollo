// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum ClientErrorCode: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case userNotFoundError
  case userNotAutheNtIcatedError
  case userNotAuthorizedError
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "USER_NOT_FOUND_ERROR": self = .userNotFoundError
      case "USER_NOT_AUTHENtICATED_ERROR": self = .userNotAutheNtIcatedError
      case "USER_NOT_AUTHORIZED_ERROR": self = .userNotAuthorizedError
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .userNotFoundError: return "USER_NOT_FOUND_ERROR"
      case .userNotAutheNtIcatedError: return "USER_NOT_AUTHENtICATED_ERROR"
      case .userNotAuthorizedError: return "USER_NOT_AUTHORIZED_ERROR"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ClientErrorCode, rhs: ClientErrorCode) -> Bool {
    switch (lhs, rhs) {
      case (.userNotFoundError, .userNotFoundError): return true
      case (.userNotAutheNtIcatedError, .userNotAutheNtIcatedError): return true
      case (.userNotAuthorizedError, .userNotAuthorizedError): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ClientErrorCode] {
    return [
      .userNotFoundError,
      .userNotAutheNtIcatedError,
      .userNotAuthorizedError,
    ]
  }
}

public enum InternalServerErrorCode: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case internalTimeout
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "INTERNAL_TIMEOUT": self = .internalTimeout
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .internalTimeout: return "INTERNAL_TIMEOUT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: InternalServerErrorCode, rhs: InternalServerErrorCode) -> Bool {
    switch (lhs, rhs) {
      case (.internalTimeout, .internalTimeout): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [InternalServerErrorCode] {
    return [
      .internalTimeout,
    ]
  }
}

public final class GetProfileQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getProfile {
      userProfile {
        __typename
        userProfile {
          __typename
          userId
        }
        userProfileErrors {
          __typename
          ... on ClientError {
            __typename
            clientErrorCode: errorCode
            clientErrorMessage: message
          }
          ... on InternalServerError {
            __typename
            serverErrorCode: errorCode
            serverErrorMessage: message
          }
        }
      }
    }
    """

  public let operationName: String = "getProfile"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("userProfile", type: .nonNull(.object(UserProfile.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userProfile: UserProfile) {
      self.init(unsafeResultMap: ["__typename": "Query", "userProfile": userProfile.resultMap])
    }

    public var userProfile: UserProfile {
      get {
        return UserProfile(unsafeResultMap: resultMap["userProfile"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "userProfile")
      }
    }

    public struct UserProfile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UserProfileResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("userProfile", type: .object(UserProfile.selections)),
          GraphQLField("userProfileErrors", type: .nonNull(.list(.nonNull(.object(UserProfileError.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userProfile: UserProfile? = nil, userProfileErrors: [UserProfileError]) {
        self.init(unsafeResultMap: ["__typename": "UserProfileResult", "userProfile": userProfile.flatMap { (value: UserProfile) -> ResultMap in value.resultMap }, "userProfileErrors": userProfileErrors.map { (value: UserProfileError) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userProfile: UserProfile? {
        get {
          return (resultMap["userProfile"] as? ResultMap).flatMap { UserProfile(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "userProfile")
        }
      }

      public var userProfileErrors: [UserProfileError] {
        get {
          return (resultMap["userProfileErrors"] as! [ResultMap]).map { (value: ResultMap) -> UserProfileError in UserProfileError(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: UserProfileError) -> ResultMap in value.resultMap }, forKey: "userProfileErrors")
        }
      }

      public struct UserProfile: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserProfile"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("userId", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(userId: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "UserProfile", "userId": userId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var userId: GraphQLID {
          get {
            return resultMap["userId"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }
      }

      public struct UserProfileError: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ClientError", "InternalServerError"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["ClientError": AsClientError.selections, "InternalServerError": AsInternalServerError.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeClientError(clientErrorCode: ClientErrorCode, clientErrorMessage: String) -> UserProfileError {
          return UserProfileError(unsafeResultMap: ["__typename": "ClientError", "clientErrorCode": clientErrorCode, "clientErrorMessage": clientErrorMessage])
        }

        public static func makeInternalServerError(serverErrorCode: InternalServerErrorCode, serverErrorMessage: String) -> UserProfileError {
          return UserProfileError(unsafeResultMap: ["__typename": "InternalServerError", "serverErrorCode": serverErrorCode, "serverErrorMessage": serverErrorMessage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asClientError: AsClientError? {
          get {
            if !AsClientError.possibleTypes.contains(__typename) { return nil }
            return AsClientError(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsClientError: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ClientError"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("errorCode", alias: "clientErrorCode", type: .nonNull(.scalar(ClientErrorCode.self))),
              GraphQLField("message", alias: "clientErrorMessage", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(clientErrorCode: ClientErrorCode, clientErrorMessage: String) {
            self.init(unsafeResultMap: ["__typename": "ClientError", "clientErrorCode": clientErrorCode, "clientErrorMessage": clientErrorMessage])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var clientErrorCode: ClientErrorCode {
            get {
              return resultMap["clientErrorCode"]! as! ClientErrorCode
            }
            set {
              resultMap.updateValue(newValue, forKey: "clientErrorCode")
            }
          }

          public var clientErrorMessage: String {
            get {
              return resultMap["clientErrorMessage"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "clientErrorMessage")
            }
          }
        }

        public var asInternalServerError: AsInternalServerError? {
          get {
            if !AsInternalServerError.possibleTypes.contains(__typename) { return nil }
            return AsInternalServerError(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsInternalServerError: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["InternalServerError"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("errorCode", alias: "serverErrorCode", type: .nonNull(.scalar(InternalServerErrorCode.self))),
              GraphQLField("message", alias: "serverErrorMessage", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(serverErrorCode: InternalServerErrorCode, serverErrorMessage: String) {
            self.init(unsafeResultMap: ["__typename": "InternalServerError", "serverErrorCode": serverErrorCode, "serverErrorMessage": serverErrorMessage])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var serverErrorCode: InternalServerErrorCode {
            get {
              return resultMap["serverErrorCode"]! as! InternalServerErrorCode
            }
            set {
              resultMap.updateValue(newValue, forKey: "serverErrorCode")
            }
          }

          public var serverErrorMessage: String {
            get {
              return resultMap["serverErrorMessage"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "serverErrorMessage")
            }
          }
        }
      }
    }
  }
}
