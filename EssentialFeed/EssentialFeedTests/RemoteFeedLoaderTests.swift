//
//  RemoteFeedLoaderTests.swift
//  EssentialFeed
//
//  Created by Temur on 11/03/2025.
//
import XCTest
@testable
import EssentialFeed

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() { }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    override class func tearDown() {
        HTTPClient.shared.requestedURL = nil
    }
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
