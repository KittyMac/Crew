import XCTest
import CLib

@testable import Crew

final class CrewTests: XCTestCase {
    func testCBlock() throws {
        var success = false
        CBlock.call(simpleCallback0_0) { _, _, _, _, _, _, _ in
            success = true
        }
        XCTAssertEqual(success, true)
    }
}
