//
//  SecoundControllerBottomView.swift
//  BudjeteProgram
//
//  Created by Димаш Алтынбек on 01.11.2023.
//

import Foundation
import UIKit
import SnapKit

class SecoundControllerBottomView: UIView {
    //MARK: -Variables-
    let summLbl: UILabel = { 
        let lbl = UILabel()
        lbl.text = "Сумма"
        lbl.textColor = .white
        lbl.alpha = 0.5
        lbl.font = UIFont(name: "Inter-Regular", size: 13)
        return lbl
    }()
    
    let amountLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "740 ₽"
        lbl.textColor = .white
        lbl.font = UIFont(name: "Manrope-Medium", size: 28)
        return lbl
    }()
    
    let arrowBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle(">", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.alpha = 0.5
        btn.layer.cornerRadius = 44/2
        return btn
    }()
    //MARK: -LifeCycle-
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let beizerPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 30, height: 30))
        let mask = CAShapeLayer()
        mask.path = beizerPath.cgPath
        layer.mask = mask
    }
    //MARK: -Functions-
    
}

//MARK: -Exntesions-
extension SecoundControllerBottomView {
    private func setUpViews() {
        backgroundColor = UIColor(red: 0.137, green: 0.435, blue: 0.341, alpha: 1)
        addSubview(summLbl)
        addSubview(amountLbl)
        addSubview(arrowBtn)
    }
    
    private func setUpConstraints() {
        summLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(32)
        }
        
        amountLbl.snp.makeConstraints { make in
            make.top.equalTo(summLbl.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(32)
        }
        
        arrowBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-32)
            make.width.equalTo(64)
            make.height.equalTo(44)
        }
    }
}
