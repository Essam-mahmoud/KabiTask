//
//  Bundle.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//
import Foundation
@testable import kabiTask

extension Bundle {
    public class var unitTest: Bundle {
        return Bundle(for: HomeInteractorTest.self)
    }
}
