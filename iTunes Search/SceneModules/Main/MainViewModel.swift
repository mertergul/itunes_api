//
//  MainViewModel.swift
//  iTunes Search
//
//  Created by Mert Ergul on 25.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage


class MainViewModel{
    
    private var mainViewState: ((ViewState) -> Void)?
    private var detailViewState: ItemDetailRequestBlock?
    

    private var dataFormatter: MainDataFormatterProtocol
    
    init(
         dataFormatter: MainDataFormatterProtocol) {
        self.dataFormatter = dataFormatter
    }
    public func getData() {
        mainViewState?(.loading)
        do {
            guard let urlRequest = try? CharacterListServiceProvider(request: getCharacterListRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: dataListener)
        }
        
    }
    func subscribeViewState(with completion: @escaping (ViewState) -> Void) {
        mainViewState = completion
    }
    
    func subscribeDetailViewState(with completion: @escaping ItemDetailRequestBlock) {
        detailViewState = completion
    }
    
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<ResultArray, ErrorResponse>) -> Void) {

        ApiManagerBuilder.build().executeRequest(urlRequest: request, completion: completion)
    }
    func getCharacterListRequest() -> CharacterDataRequest {
        return CharacterDataRequest(
            
            limit: dataFormatter.paginationData.limit,
            offset: dataFormatter.paginationData.offset,
            term: dataFormatter.paginationData.term,
            media: dataFormatter.paginationData.media
            
        )
    }
    private func apiCallHandler(from response: ResultArray) {
        dataFormatter.setData(with: response)
        mainViewState?(.done)
    }
    // MARK: - Listener Handlers
  
    
    private lazy var dataListener: (Result<ResultArray, ErrorResponse>) -> Void = { [weak self] result in
        
        self?.dataFormatter.paginationData.fetching = false
        
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            self?.apiCallHandler(from: response)
        }
    }
    
    
}
extension MainViewModel: ItemProviderProtocol {
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func sendsearch(with Value: String, with scopeIndex: Int) {
        dataFormatter.reset()
        dataFormatter.paginationData.newTerm(with: Value)
        dataFormatter.paginationData.newScope(with: scopeIndex)
    }
    
 
    
    func askNumberOfItem(in section: Int) -> Int {
        return dataFormatter.getNumbeOfItem(in: section)
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return dataFormatter.getItem(at: index)
    }
    func isLoadingCell(for index: Int) -> Bool {
        return index >= dataFormatter.getCount()
    }
    
    func getMoreData() {
        // check to get more data
        guard dataFormatter.paginationData.checkLoadingMore() else { return }
        dataFormatter.paginationData.nextOffset()
        
        getData()
    }
    
    func selectedItem(at index: Int) {
        detailViewState?(ItemDetailViewRequest(id: dataFormatter.getItemId(at: index), type: .present))
    }
}



