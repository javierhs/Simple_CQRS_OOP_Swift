//
//  TestingTests.swift
//  TestingTests
//
//  Created by Javier Hernandez Sansalvador on 2/7/24.
//

import XCTest
@testable import Testing

final class TestingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCustomerChoosesToPayOnCollection() throws {
        givenTheCustomerHasChosenToCollectTheirOrder()
        whenTheyProceedToPaymentInstructions()
        thenTheyShouldBeAbleToChooseToPayOnCollection()
    }

}

// MARK: - Steps
extension TestingTests {
    private func givenTheCustomerHasChosenToCollectTheirOrder() {
        //TODO
    }
    
    private func whenTheyProceedToPaymentInstructions() {
        //TODO
    }
    
    private func thenTheyShouldBeAbleToChooseToPayOnCollection() {
        //TODO
    }
}
