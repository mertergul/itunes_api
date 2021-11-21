//
//  ContentDisplayerView.swift
//  iTunes Search
//
//  Created by Mert Ergul on 1.11.2021.
//

import Foundation
import UIKit


class ContentDisplayerView: GenericBaseView<GenericDataProtocol> {
    
    private lazy var shadowContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.4
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainer, infoView,titleView,priceView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 5
        return temp
    }()
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 150).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 150).isActive = true
        temp.layer.cornerRadius = 4
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.6
        return temp
    }()
    
    private lazy var infoView: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = UIFont.boldSystemFont(ofSize: 14)
        temp.textColor = .black
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.text = " "
        temp.contentMode = .top
        temp.textAlignment = .center
        return temp
    }()
    private lazy var titleView: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = UIFont.boldSystemFont(ofSize: 14)
        temp.textColor = .black
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.text = " "
        temp.contentMode = .top
        temp.textAlignment = .center
        return temp
    }()
    private lazy var priceView: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = UIFont.boldSystemFont(ofSize: 14)
        temp.textColor = .red
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.text = " "
        temp.contentMode = .top
        temp.textAlignment = .center
        return temp
    }()
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            shadowContainerView.topAnchor.constraint(equalTo: topAnchor),
            shadowContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        
        ])
    }

    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() as? ContentDisplayerViewData else { return }
        imageContainer.setData(by: data.imageData)
        infoView.text = data.name
        titleView.text = "Release Date: " + dateConvert(at: data.title)
        infoView.isHidden = data.isInfoViewHidden
        priceView.text = String(data.price) + " USD"
    }
    private func dateConvert(at dateconvert: String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterResponce = DateFormatter()
        dateFormatterResponce.dateFormat = "MMM dd,yyyy"

        if let date = dateFormatterGet.date(from: dateconvert) {
            return (dateFormatterResponce.string(from: date))
        }
        return ""
    }
    
}
