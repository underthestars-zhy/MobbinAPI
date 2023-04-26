import XCTest
@testable import MobbinAPI

final class MobbinAPITests: XCTestCase {
    func testShouldUsePassword() async throws {
        let res = try await MobbinAPI(email: "zhuhaoyu0909@icloud.com").shoudUsePassword()
        XCTAssertFalse(res)
    }

    func testSendEmail() async throws {
        try await MobbinAPI(email: "zhuhaoyu0909@icloud.com").sendEmail()
    }
}
