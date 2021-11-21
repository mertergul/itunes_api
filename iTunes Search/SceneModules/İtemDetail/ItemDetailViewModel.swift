//
//  ItemDetailViewModel.swift
//  iTunes Search
//
//  Created by Mert Ergul on 21.11.2021.
//

import Foundation
import DefaultNetworkOperationPackage

typealias ItemDetailDataBlock = (ItemDetailViewData) -> Void

class ItemDetailViewModel {
    
   
    private let formatter: ItemDetailDataFormatterProtocol
    private let data: ItemDetailViewRequest
    private var dataState: ItemDetailDataBlock?
    
    init(data: ItemDetailViewRequest,
         
         formatter: ItemDetailDataFormatterProtocol) {
        self.data = data
        self.formatter = formatter
    }
    
    func getData() {
        do {
            guard let urlRequest = try? CharacterDetailServiceProvider(request: getCharacterDetailRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: dataListener)
        }
        
    }
    
    func subscribeViewState(with completion: @escaping ItemDetailDataBlock) {
        dataState = completion
    }
    
    // MARK: - Private Methods
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<ResultArray, ErrorResponse>) -> Void) {
        
        ApiManagerBuilder.build().executeRequest(urlRequest: request, completion: completion)
        
    }
    
    private func getCharacterDetailRequest() -> CharacterDetailRequest {
        return CharacterDetailRequest(
            id: data.id)
        
    }
    
    private func loggedInListenerHandler(with value: Bool) {
        if value {
            getData()
        }
    }
    
    private func apiCallHandler(from response: ResultArray) {
        let data = response.results[0]
        dataState?(formatter.convertItemDetailView(from: data))
    }
    
    // MARK: - Listener Handlers
    private lazy var dataListener: (Result<ResultArray, ErrorResponse>) -> Void = { [weak self] result in
        
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            self?.apiCallHandler(from: response)
        }
    }
    
}

