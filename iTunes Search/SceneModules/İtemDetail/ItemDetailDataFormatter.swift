//
//  ItemDetailDataFormatter.swift
//  iTunes Search
//
//  Created by Mert Ergul on 21.11.2021.
//

import Foundation
import UIKit


class ItemDetailDataFormatter: ItemDetailDataFormatterProtocol {
    
    func convertItemDetailView(from rawData: SearchResult) -> ItemDetailViewData {
        
        let title = rawData.trackName
        let subTitle = rawData.longDescription ?? rawData.description
        let labelPack = LabelPackComponentData(title: title, subTitle: subTitle ?? "")
            .setSubTitleLabelDistributionData(by: LabelDistributionData().setContentMode(by: .center).setTextAlignment(by: .center).setNumberOfLines(by: 0).setLineBreakMode(by: .byWordWrapping).setFont(by: UIFont.systemFont(ofSize: 12 ,weight: UIFont.Weight.light)))
            .setTitleLabelDistributionData(by: LabelDistributionData().setContentMode(by: .center).setTextAlignment(by: .center).setNumberOfLines(by: 0).setLineBreakMode(by: .byWordWrapping).setFont(by: UIFont.systemFont(ofSize: 18 ,weight: UIFont.Weight.bold)))
            .setSpacing(by: 10)
            .setStackViewAlignment(by: .fill)
        
        return ItemDetailViewData(imageData: CustomImageViewComponentData(imageUrl: rawData.artworkUrl100), labelPackData: labelPack)
    }
    

}

