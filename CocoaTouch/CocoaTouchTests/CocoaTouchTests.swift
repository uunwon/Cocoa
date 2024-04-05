//
//  CocoaTouchTests.swift
//  CocoaTouchTests
//
//  Created by uunwon on 4/5/24.
//

import XCTest
@testable import CocoaTouch


class MockURLSession: URLSession {
    // 가짜 데이터를 만들어줄거임
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask(completionHandler: completionHandler, request: request)
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
    var request: URLRequest
    
    init(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void, request: URLRequest) {
        self.completionHandler = completionHandler
        self.request = request
        super.init()
    }
    
    var calledResume = false
    
    override func resume() {
        calledResume = true
    }
    
}

final class CocoaTouchTests: XCTestCase {
    
    var viewControllerUnderTest: ReposTableViewController? // optional value
    
    // 테스트 함수에 불러오는거 오버라이딩 🏇 할 거임
    override func setUp() {
        viewControllerUnderTest = ReposTableViewController()
    }
    
    // ‼️ 종료, 테스트 시동 끄기
    override func tearDown() {
        viewControllerUnderTest = nil
        super.tearDown()
    }
    
    // 테스트 코드 이름은 내가 하려고 하는 일을 최대한 써주는게 좋음 🫧
    // ‼️ 레포(테스트할 대상)가 not nil 이길 바람 ~
    func testThatRepoIsNotNil() {
        XCTAssertNotNil(viewControllerUnderTest?.repos)
    }
    
    var mockData: Data {
        if let path = Bundle.main.path(forResource: "mock_Data", ofType: "json"),
           let contents = FileManager.default.contents(atPath: path) {
            return contents
        }
        return Data()
    }
    
    // 원격지에 있는 정보가 올바르게 들어오는지 확인하는 함수
    func testThatFetchRepoParsesSuccessfulData() {
        viewControllerUnderTest?.session = MockURLSession()
        
        var responseObject: FetchReposResult?
        
        let result = viewControllerUnderTest?.fetchRepos(forUsername: "", completionHandler: { (response) in
            responseObject = response
        }) as? MockURLSessionDataTask
        
        result?.completionHandler(mockData, nil, nil)
        
        switch responseObject {
        case .success(let repos):
            XCTAssertEqual(repos.count, 9)
            XCTAssertEqual(repos.first?.name, "aerogear-ios-oauth2")
        case .failure(let error):
            print("\(error)")
        default:
            XCTFail()
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
