// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum ErrorCode: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case userNotFoundError
  case userNotAutheNtIcatedError
  case userNotAuthorizedError
  case internalTimeout
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "USER_NOT_FOUND_ERROR": self = .userNotFoundError
      case "USER_NOT_AUTHENtICATED_ERROR": self = .userNotAutheNtIcatedError
      case "USER_NOT_AUTHORIZED_ERROR": self = .userNotAuthorizedError
      case "INTERNAL_TIMEOUT": self = .internalTimeout
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .userNotFoundError: return "USER_NOT_FOUND_ERROR"
      case .userNotAutheNtIcatedError: return "USER_NOT_AUTHENtICATED_ERROR"
      case .userNotAuthorizedError: return "USER_NOT_AUTHORIZED_ERROR"
      case .internalTimeout: return "INTERNAL_TIMEOUT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ErrorCode, rhs: ErrorCode) -> Bool {
    switch (lhs, rhs) {
      case (.userNotFoundError, .userNotFoundError): return true
      case (.userNotAutheNtIcatedError, .userNotAutheNtIcatedError): return true
      case (.userNotAuthorizedError, .userNotAuthorizedError): return true
      case (.internalTimeout, .internalTimeout): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ErrorCode] {
    return [
      .userNotFoundError,
      .userNotAutheNtIcatedError,
      .userNotAuthorizedError,
      .internalTimeout,
    ]
  }
}

public final class QueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Query {
      userProfile {
        __typename
        data {
          __typename
          userId
        }
        error {
          __typename
          message
          errorCode
        }
      }
    }
    """

  public let operationName: String = "Query"

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
          GraphQLField("data", type: .object(Datum.selections)),
          GraphQLField("error", type: .object(Error.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: Datum? = nil, error: Error? = nil) {
        self.init(unsafeResultMap: ["__typename": "UserProfileResult", "data": data.flatMap { (value: Datum) -> ResultMap in value.resultMap }, "error": error.flatMap { (value: Error) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var data: Datum? {
        get {
          return (resultMap["data"] as? ResultMap).flatMap { Datum(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "data")
        }
      }

      public var error: Error? {
        get {
          return (resultMap["error"] as? ResultMap).flatMap { Error(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "error")
        }
      }

      public struct Datum: GraphQLSelectionSet {
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

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Error"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("message", type: .nonNull(.scalar(String.self))),
            GraphQLField("errorCode", type: .nonNull(.scalar(ErrorCode.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(message: String, errorCode: ErrorCode) {
          self.init(unsafeResultMap: ["__typename": "Error", "message": message, "errorCode": errorCode])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }

        public var errorCode: ErrorCode {
          get {
            return resultMap["errorCode"]! as! ErrorCode
          }
          set {
            resultMap.updateValue(newValue, forKey: "errorCode")
          }
        }
      }
    }
  }
}
