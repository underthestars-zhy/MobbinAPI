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
        let res = try await api.verify(code: "827080")
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
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyODY2MDg4LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI3Nzk2ODh9XSwic2Vzc2lvbl9pZCI6IjlhMGUwNzQwLTZhZGItNGJlMy1hNGFmLWQ5MDE0Y2FmNDYyZiJ9.nWNXx2FMjtzbEx7Ddr9LKC2v2NrP7Jbd2_b8tymkGho", refreshToken: ""))

        let apps = try await api.getAlliOSApps()

        XCTAssertEqual(apps.count, 401)
    }

    func testGetiOSScreens() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let apps = try await api.queryNextPage(nil)

        let screens = try await api.getiOSScreens(of: apps[0])

        XCTAssertEqual(screens.count, 155)
    }

    func testGetiOSDownloadURL() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyODY2MDg4LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI3Nzk2ODh9XSwic2Vzc2lvbl9pZCI6IjlhMGUwNzQwLTZhZGItNGJlMy1hNGFmLWQ5MDE0Y2FmNDYyZiJ9.nWNXx2FMjtzbEx7Ddr9LKC2v2NrP7Jbd2_b8tymkGho", refreshToken: ""))

        let apps = try await api.queryNextPage(nil)

        let url = try await api.downloadURL(of: apps[0])

        print(url)
    }

    func testGetVersions() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyOTU1Nzk5LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI4NjkzOTl9XSwic2Vzc2lvbl9pZCI6Ijc3MmM5YmQxLTY2NWEtNGVmMS1hNjkxLWZkYWNhNDQyMGI5NCJ9.ffaXhHJtn45KUHSs3uI8LaRik1MSVUdIIjRsZAyVil0", refreshToken: ""))

        let apps = try await api.queryNextPage(nil)

        let versions = try await api.versions(of: apps[1])

        XCTAssertEqual(versions.count, 2)
    }

    func testGetiOSFlows() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let apps = try await api.queryNextPage(nil)

        let flows = try await api.getiOSFlows(of: apps[0])

        XCTAssertEqual(flows.count, 30)
    }

    func testGetiOSScreensByVersion() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyOTU1Nzk5LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI4NjkzOTl9XSwic2Vzc2lvbl9pZCI6Ijc3MmM5YmQxLTY2NWEtNGVmMS1hNjkxLWZkYWNhNDQyMGI5NCJ9.ffaXhHJtn45KUHSs3uI8LaRik1MSVUdIIjRsZAyVil0", refreshToken: ""))

        let apps = try await api.queryNextPage(nil)

        let version = try await api.versions(of: apps[1])[1]

        let flows = try await api.getiOSFlows(by: version)

        XCTAssertEqual(flows.count, 39)
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

    func testQueryFlowsInCollection() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let collection = try await api.queryCollections().first!

        let flows = try await api.queryFlows(in: collection)

        XCTAssertEqual(flows.count, 4)
    }

    func testEditCollection() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let collection = try await api.queryCollections().first!

        let newCollection = try await api.edit(collection: collection, name: "Edited", description: nil)

        XCTAssertEqual(newCollection.name, "Edited")
    }

    func testFetchWorkspace() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let workspace = try await api.fetchWorkspace()

        XCTAssertEqual(workspace.name, "Zhuhaoyu 0909")
    }

    func testCreateCollection() async throws {
        let api = MobbinAPI(userInfo: .init(id: "d2b41590-53a4-4c4d-9d94-06f5d71807c3", aud: "", role: "", email: "zhuhaoyu0909@icloud.com", emailConfirmedAt: Date(), recoverySentAt: Date(), lastSignInAt: Date(), avatarUrl: URL(string: "https://ujasntkfphywizsdaapi.supabase.co/storage/v1/object/public/user/user_avatars/a72e8064-f7eb-4b0a-841c-39a3a10dfca4.jpeg")!, fullName: ""), token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let workspace = try await api.fetchWorkspace()

        try await api.createCollection(in: workspace, name: "Hello", description: "hi")
    }

    func testDeleteCollections() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyNzc3MTQ0LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI1MjE1OTR9XSwic2Vzc2lvbl9pZCI6ImNjMzI3ZDMzLWVkODAtNDM1Mi05NTRlLTI5OWZiNzQ1YmM5ZiJ9.s4eXeIaY9OBKT_-TxAPeWtnivxdRO1yM9K7gT68jAac", refreshToken: ""))

        let collection = try await api.queryCollections().first(where: { c in
            c.name == "Hello"
        })!

        try await api.delete(collection: collection)
    }

    func testGetiOSTreeFlows() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyODY2MDg4LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI3Nzk2ODh9XSwic2Vzc2lvbl9pZCI6IjlhMGUwNzQwLTZhZGItNGJlMy1hNGFmLWQ5MDE0Y2FmNDYyZiJ9.nWNXx2FMjtzbEx7Ddr9LKC2v2NrP7Jbd2_b8tymkGho", refreshToken: ""))

        let apps = try await api.queryNextPage(nil)

        let flows = try await api.getiOSFlows(of: apps[0])

        let tree = api.generateTreeSturctureFlow(from: flows)

        XCTAssertEqual(tree.count, 7)
    }

    func testGetMobbinQueryToken() async throws {
        let api = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjgyODY2MDg4LCJzdWIiOiJkMmI0MTU5MC01M2E0LTRjNGQtOWQ5NC0wNmY1ZDcxODA3YzMiLCJlbWFpbCI6InpodWhhb3l1MDkwOUBpY2xvdWQuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly91amFzbnRrZnBoeXdpenNkYWFwaS5zdXBhYmFzZS5jby9zdG9yYWdlL3YxL29iamVjdC9wdWJsaWMvdXNlci91c2VyX2F2YXRhcnMvYTcyZTgwNjQtZjdlYi00YjBhLTg0MWMtMzlhM2ExMGRmY2E0LmpwZWciLCJmdWxsX25hbWUiOiJVVFN6aHkifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2ODI3Nzk2ODh9XSwic2Vzc2lvbl9pZCI6IjlhMGUwNzQwLTZhZGItNGJlMy1hNGFmLWQ5MDE0Y2FmNDYyZiJ9.nWNXx2FMjtzbEx7Ddr9LKC2v2NrP7Jbd2_b8tymkGho", refreshToken: ""))

        let token = try await api.getMobbinQueryToken()

        print(token)
    }
}
