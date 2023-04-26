import Foundation

public class MobbinAPI {
    let email: String

    var token: Token? = nil
    var userInfo: UserInfo? = nil

    init(email: String) {
        self.email = email
    }

    init(userInfo: UserInfo) {
        self.email = userInfo.email
        self.userInfo = userInfo
    }
}
