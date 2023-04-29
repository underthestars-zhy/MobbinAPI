import Foundation

public class MobbinAPI {
    let email: String

    var token: Token? = nil
    var userInfo: UserInfo? = nil

    init(email: String, token: Token? = nil) {
        self.email = email
        self.token = token
    }

    init(userInfo: UserInfo, token: Token? = nil) {
        self.email = userInfo.email
        self.userInfo = userInfo
        self.token = token
    }
}
