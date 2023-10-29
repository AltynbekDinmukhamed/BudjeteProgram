//
//  HistoryTableViewCell.swift
//  BudjeteProgram
//
//  Created by Димаш Алтынбек on 29.10.2023.
//

import Foundation
import UIKit
import SnapKit

class HistoryTableViewCell: UITableViewCell {
    //MARK: -Variables-
    let comImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img1")
        img.contentMode = .scaleAspectFit
        img.tintColor = .white
        return img
    }()
    
    let expanseName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Inter-SemiBold"
        lbl.textColor = UIColor(red: 0, green: 0.064, blue: 0.15, alpha: 1)
        lbl.font = UIFont(name: "Inter-SemiBold", size: 15)
        return lbl
    }()
    
    let subExpanseName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Inter-SemiBold"
        lbl.textColor = UIColor(red: 0.38, green: 0.424, blue: 0.478, alpha: 1)
        lbl.font = UIFont(name: "Inter-Regular", size: 13)
        return lbl
    }()
    
    let sumLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "-12 $"
        lbl.textColor = UIColor(red: 0, green: 0.064, blue: 0.15, alpha: 1)
        lbl.font = UIFont(name: "Inter-Regular", size: 15)
        return lbl
    }()
    
    //MARK: -LifeCycle-
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: -Functions-
}

extension HistoryTableViewCell {
    private func setUpViews() {
        backgroundColor = .white
        addSubview(comImg)
        addSubview(expanseName)
        addSubview(subExpanseName)
        addSubview(sumLbl)
    }
    
    private func setUpConstraints() {
        comImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
        }
        
        expanseName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(comImg.snp.trailing).offset(5)
        }
        
        subExpanseName.snp.makeConstraints { make in
            make.top.equalTo(expanseName.snp.bottom).offset(3)
            make.leading.equalTo(comImg.snp.trailing).offset(5)
        }
        
        sumLbl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-32)
        }
    }
}
