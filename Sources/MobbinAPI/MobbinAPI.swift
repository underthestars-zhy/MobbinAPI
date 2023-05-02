import Foundation

public class MobbinAPI {
    let email: String

    var token: Token? = nil
    var userInfo: UserInfo? = nil

    public init(email: String, token: Token? = nil) {
        self.email = email
        self.token = token
    }

    public init(userInfo: UserInfo, token: Token? = nil) {
        self.email = userInfo.email
        self.userInfo = userInfo
        self.token = token
    }

    public func retriveToken() throws -> Token {
        guard let token else { throw MobbinError.noTokenFounded }
        return token
    }

    public func retriveUserInfo() throws -> UserInfo {
        guard let userInfo else { throw MobbinError.noUserInfoFounded }
        return userInfo
    }
}
