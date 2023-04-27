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

    func testLogin() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com")
        let res = try await api.verify(code: "538917")
        print(api.token?.accessToken ?? "No Token")

        XCTAssertTrue(res)
    }

    func testGetiOSCount() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNjcxODMzLCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1ODU0MzN9XSwic2Vzc2lvbl9pZCI6IjVjMDgzMTA4LWQ3MGItNDRjYy1hN2E1LTczZTNjNjIwYWIzOCJ9.xtwVizdrSwVnObhZ4AClqqzsq-q0mn5UTsuYgShtF7E", refreshToken: ""))

        let appsCount = try await api.iOSAppsCount
        let screensCount = try await api.iOSScreensCount
        let flowsCount = try await api.iOSFlowCount

        XCTAssertEqual(appsCount, 402)
        XCTAssertEqual(screensCount, 97114)
        XCTAssertEqual(flowsCount, 14787)
    }

    func testGetiOSApps() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNjcxODMzLCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1ODU0MzN9XSwic2Vzc2lvbl9pZCI6IjVjMDgzMTA4LWQ3MGItNDRjYy1hN2E1LTczZTNjNjIwYWIzOCJ9.xtwVizdrSwVnObhZ4AClqqzsq-q0mn5UTsuYgShtF7E", refreshToken: ""))

        let apps = try await api.getAlliOSApps()

        XCTAssertEqual(apps.count, 401)
    }
}
