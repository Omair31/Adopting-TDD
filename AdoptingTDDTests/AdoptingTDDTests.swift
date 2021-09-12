//
//  AdoptingTDDTests.swift
//  AdoptingTDDTests
//
//  Created by VenD-Omeir on 12/09/2021.
//

import XCTest
@testable import AdoptingTDD

class AdoptingTDDTests: XCTestCase {

    func makeSUT() -> ViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut = sb.instantiateViewController(identifier: "ViewController") as! ViewController
        sut.service = FetchUsersAPIAdapter(api: FetchUsersAPIStub(), select: { (user) in
            print(user)
        })
        return sut
    }
    
    func test_Initial_VC() throws {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut = sb.instantiateInitialViewController()
        _ = try XCTUnwrap((sut as? UINavigationController)?.topViewController as? ViewController)
    }
    
    func test_Initial_Title() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        XCTAssert(sut.title == "Users")
    }
    
    func test_Users() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        XCTAssert(sut.itemViewModels[0].id == "1")
        XCTAssert(sut.itemViewModels[0].name == "Leanne Graham")
    }
    
    func testing_delegates_and_datasources() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView.delegate, "tableview delegate not nil")
        XCTAssertNotNil(sut.tableView.dataSource, "tableview datasource not nil")
    }
    
    func test_number_of_sections() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        XCTAssertTrue(sut.tableView.numberOfSections == 1)
    }
    
    func test_number_of_rows() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        XCTAssertTrue(sut.tableView.numberOfRows(inSection: 0) == 8)
    }
    

}


private class FetchUsersAPIStub: APIManagerProtocol {
    
    func loadUsers(completion: @escaping ([User]) -> Void) {
        completion([User(id: 1, name: "Leanne Graham", email: "Sincere@april.biz"), User(id: 2, name: "Ervin Howell", email: "Shanna@melissa.tv"), User(id: 3, name: "Clementine Bauch", email: "Nathan@yesenia.net"), User(id: 4, name: "Patricia Lebsack", email: "Julianne.OConner@kory.org"), User(id: 5, name: "Chelsey Dietrich", email: "Lucio_Hettinger@annie.ca"), User(id: 6, name: "Mrs. Dennis Schulist", email: "Karley_Dach@jasper.info"), User(id: 7, name: "Kurtis Weissnat", email: "Telly.Hoeger@billy.biz"), User(id: 8, name: "Nicholas Runolfsdottir V", email: "Sherwood@rosamond.me")])
    }
    
}
