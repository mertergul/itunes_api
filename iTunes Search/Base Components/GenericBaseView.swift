//
//  GenericBaseView.swift
//  iTunes Search
//
//  Created by Mert Ergul on 31.10.2021.
//

import Foundation

import UIKit

class GenericBaseView<T>: BaseView {
    
    private var data: T?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect = .zero, data: T? = nil) {
        self.data = data
        super.init(frame: frame)
        loadDataView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadDataView() {
        
    }
    
    func setData(by value: T?) {
        self.data = value
        loadDataView()
    }
    
    func returnData() -> T? {
        return data
    }
}
