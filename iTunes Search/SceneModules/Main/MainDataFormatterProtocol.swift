//
//  MainDataFormatterProtocol.swift
//  iTunes Search
//
//  Created by Mert Ergul on 1.11.2021.
//

import Foundation

protocol MainDataFormatterProtocol: AnyObject {
    
//1    func getItem(from data: SearchResult) -> CustomTableViewCellData
    
    
    var paginationData: PaginationInfo { get set }
    
    func getNumberOfSection() -> Int
    
    func getNumbeOfItem(in section: Int) -> Int
    
    func getCount() -> Int
    
    func setData(with response: ResultArray)
    
    func getItem(at index: Int) -> GenericDataProtocol?
    
    func getItemId(at index: Int) -> Int
    func reset()
    
    
}


