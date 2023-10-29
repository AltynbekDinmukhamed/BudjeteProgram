//
//  BudgeteHeaderView.swift
//  BudjeteProgram
//
//  Created by Димаш Алтынбек on 29.10.2023.
//

import Foundation
import UIKit
import SnapKit

class BudgeteHeaderView: UIView {
    //MARK: -Variables-
    let budTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Budgete"
        lbl.textColor = .white
        lbl.font = UIFont(name: "Manrope-Bold", size: 18)
        return lbl
    }()
    
    let avaImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "userAva")
        img.contentMode = .scaleAspectFit
        img.tintColor = .white
        return img
    }()
    
    let avaiblesLbl: UILabel = {
        let lbl = UILabel()
        
        let textWithColoe = NSMutableAttributedString(string: "Aviable today")
        let range1 = (textWithColoe.string as NSString).range(of: "Aviable")
        let color1 = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        textWithColoe.addAttribute(NSAttributedString.Key.foregroundColor, value: color1, range: range1)
        
        let range2 = (textWithColoe.string as NSString).range(of: "today")
        let color2 = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        textWithColoe.addAttribute(NSAttributedString.Key.foregroundColor, value: color2, range: range2)
        
        lbl.textColor = .white
        lbl.font = UIFont(name: "Manrope-Bold", size: 18)
        return lbl
    }()
    
    let numLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "-185.12"
        lbl.textColor = .white
        lbl.font = UIFont(name: "Inter-SemiBold", size: 28)
        return lbl
    }()
    
    let numTwoLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "from 2450.00"
        lbl.textColor = .white
        lbl.font = UIFont(name: "Inter-Regular", size: 15)
        return lbl
    }()
    //MARK: -Lifecycle-
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
        //MARK: creating corner radius
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .bottomLeft, cornerRadii: CGSize(width: 30, height: 30))
        let mask = CAShapeLayer()
        mask.path = maskPath.cgPath
        layer.mask = mask
    }
    //MARK: -Functions-
}

//MARK: -Extension-
extension BudgeteHeaderView {
    private func setUpViews() {
        layer.masksToBounds = true
        backgroundColor = UIColor(red: 0.137, green: 0.435, blue: 0.341, alpha: 1)
        addSubview(budTitle)
        addSubview(avaImg)
        addSubview(avaiblesLbl)
        addSubview(numLbl)
        addSubview(numTwoLbl)
    }
    
    private func setUpConstraints() {
        budTitle.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(6)
            make.leading.equalToSuperview().offset(32)
        }
        
        avaImg.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(6)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        avaiblesLbl.snp.makeConstraints { make in
            make.top.equalTo(budTitle.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
        }
        
        numLbl.snp.makeConstraints { make in
            make.top.equalTo(avaiblesLbl.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(32)
        }
        
        numTwoLbl.snp.makeConstraints { make in
            make.top.equalTo(numLbl.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(32)
        }
    }
}
