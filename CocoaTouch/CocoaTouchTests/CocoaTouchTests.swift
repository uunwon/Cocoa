//
//  CocoaTouchTests.swift
//  CocoaTouchTests
//
//  Created by uunwon on 4/5/24.
//

import XCTest
@testable import CocoaTouch

final class CocoaTouchTests: XCTestCase {
    
    var viewControllerUnderTest: ReposTableViewController? // optional value
    
    // 테스트 함수에 불러오는거 오버라이딩 🏇 할 거임
    override func setUp() {
        viewControllerUnderTest = ReposTableViewController()
    }
    
    override func tearDown() {
        viewControllerUnderTest = nil
        super.tearDown()
    }
    
    // 테스트 코드 이름은 내가 하려고 하는 일을 최대한 써주는게 좋음 🫧
    // ‼️ 레포(테스트할 대상)가 not nil 이길 바람 ~
    func testThatRepoIsNotNil() {
        XCTAssertNotNil(viewControllerUnderTest?.repos)
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
