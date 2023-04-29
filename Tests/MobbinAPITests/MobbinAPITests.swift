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

    func testGetiOSScreens() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let apps = try await api.queryNextPage(nil)

        let screens = try await api.getiOSScreens(of: apps[0])

        XCTAssertEqual(screens.count, 155)
    }

    func testGetiOSFlows() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let apps = try await api.queryNextPage(nil)

        let flows = try await api.getiOSFlows(of: apps[0])

        XCTAssertEqual(flows.count, 30)
    }

    func testQueryCollections() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let collections = try await api.queryCollections()

        print(collections)

        XCTAssertEqual(collections.count, 1)
    }

    func testQueryAppsInCollection() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let collection = try await api.queryCollections().first!

        let app = try await api.queryApps(in: collection)

        XCTAssertEqual(app.count, 2)
    }

    func testGetCollectionPlatfromCount() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let collection = try await api.queryCollections().first!

        let platfrom = try await api.platformCount(of: collection)

        XCTAssertEqual(platfrom, PlatformCount(mobileAppsCount: 2, webAppsCount: 0, mobileScreensCount: 2, webScreensCount: 0, mobileFlowsCount: 1, webFlowsCount: 0))
    }

    func testQueryScreensInCollection() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let collection = try await api.queryCollections().first!

        let screens = try await api.queryScreens(in: collection)

        XCTAssertEqual(screens.count, 2)
    }
}
