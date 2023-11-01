//
//  SecoundViewController.swift
//  BudjeteProgram
//
//  Created by Димаш Алтынбек on 29.10.2023.
//

import Foundation
import UIKit
import SnapKit

class SecoundViewController: UIViewController {
    //MARK: -Variables-
    let firstBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "first"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 48/2
        btn.backgroundColor = UIColor.budBrightOrrange
        return btn
    }()
    
    let firstStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 40
        return stack
    }()
    
    let secoundStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 40
        return stack
    }()
    
    let firstTextStack = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 40
        return stack
    }()
    
    let secoundTextStack = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 40
        return stack
    }()
    
    let commentLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Комментарий"
        lbl.textColor = .black
        lbl.alpha = 0.5
        lbl.font = UIFont(name: "Inter-Regular", size: 13)
        return lbl
    }()
    
    let supermarketsLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Супермаркеты"
        lbl.textColor = .black
        lbl.font = UIFont(name: "Inter-Regular", size: 17)
        return lbl
    }()
    
    let metkiLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Метки"
        lbl.alpha = 0.5
        lbl.textColor = .black
        lbl.font = UIFont(name: "Inter-Regular", size: 13)
        return lbl
    }()
    
    let fetchBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Для FetchLab", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor(red: 0.949, green: 0.957, blue: 0.969, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 32 / 2
        return btn
    }()
    
    let addMetkaBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Добавить метку", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        btn.setTitleColor(UIColor(red: 0.141, green: 0.443, blue: 0.345, alpha: 1), for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(red: 0.827, green: 0.89, blue: 0.871, alpha: 1).cgColor
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 32 / 2
        return btn
    }()
    
    let dataLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Дата"
        lbl.alpha = 0.5
        lbl.textColor = .black
        lbl.font = UIFont(name: "Inter-Regular", size: 13)
        return lbl
    }()
    
    let dataDetailLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Сегодня, 12 июня 2020"
        lbl.textColor = .black
        lbl.font = UIFont(name: "Inter-Regular", size: 17)
        return lbl
    }()
    
    let bottomView: SecoundControllerBottomView = {
        let view = SecoundControllerBottomView()
        //view.backgroundColor = UIColor(red: 0.137, green: 0.435, blue: 0.341, alpha: 1)
        return view
    }()
    
    //MARK: -LifeCycle-
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
        createBtn()
        setUpText()
    }
    //MARK: -Functions
    
    /// using for loop to create button. to not repeat code
    private func createBtn() {
        let imgArray = ["first", "secound", "third", "first", "fourth", "fiveth", "sixth", "seventh"]
        
        for i in 0...(imgArray.count-1) {
            let btn: UIButton = {
                let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
                btn.setImage(UIImage(named: imgArray[i]), for: .normal)
                btn.imageView?.contentMode = .scaleAspectFit
                btn.clipsToBounds = true
                btn.layer.cornerRadius = 48/2
                btn.backgroundColor = UIColor.budBrightOrrange
                return btn
            }()
            
            if i < 4 {
                firstStack.addArrangedSubview(btn)
            } else if i >= 4 && i < imgArray.count {
                secoundStack.addArrangedSubview(btn)
            }
        }
    }
    ///using for loop to create text and will not repeated
    private func setUpText() {
        let textArray = ["Бизнес", "Развлечения", "Транспорт", "Бизнес", "Продукты", "Переводы", "Подарки", "Фастфуд"]
        for i in 0...(textArray.count-1) {
            let lbl: UILabel = {
                let lbl = UILabel()
                lbl.text = textArray[i]
                lbl.font = UIFont(name: "Inter-Regular", size: 13)
                lbl.textColor = UIColor(red: 0, green: 0.064, blue: 0.15, alpha: 1)
                return lbl
            }()
            
            if i < 4 {
                firstTextStack.addArrangedSubview(lbl)
            } else if i >= 4 && i < textArray.count {
                secoundTextStack.addArrangedSubview(lbl)
            }
        }
    }
}

//MARK: -Exntension-
extension SecoundViewController {
    private func setUpViews() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(firstBtn)
        view.addSubview(firstStack)
        view.addSubview(firstTextStack)
        view.addSubview(secoundStack)
        view.addSubview(secoundTextStack)
        view.addSubview(commentLbl)
        view.addSubview(supermarketsLbl)
        view.addSubview(metkiLbl)
        view.addSubview(fetchBtn)
        view.addSubview(addMetkaBtn)
        view.addSubview(dataLbl)
        view.addSubview(dataDetailLbl)
        view.addSubview(bottomView)
    }
    private func setUpConstraints() {
        firstBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(48)
            make.width.equalTo(48)
        }
        
        firstStack.snp.makeConstraints { make in
            make.top.equalTo(firstBtn.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.height.equalTo(50)
        }
        
        firstTextStack.snp.makeConstraints { make in
            make.top.equalTo(firstStack.snp.bottom).offset(3)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.height.equalTo(20)
        }
        
        secoundStack.snp.makeConstraints { make in
            make.top.equalTo(firstTextStack.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.height.equalTo(50)
        }
        
        secoundTextStack.snp.makeConstraints { make in
            make.top.equalTo(secoundStack.snp.bottom).offset(3)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.height.equalTo(20)
        }
        
        commentLbl.snp.makeConstraints { make in
            make.top.equalTo(secoundTextStack.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(32)
        }
        
        supermarketsLbl.snp.makeConstraints { make in
            make.top.equalTo(commentLbl.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(32)
        }
        metkiLbl.snp.makeConstraints { make in
            make.top.equalTo(supermarketsLbl.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(32)
        }
        fetchBtn.snp.makeConstraints { make in
            make.top.equalTo(metkiLbl.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(32)
            make.width.equalTo(112)
            make.height.equalTo(32)
        }
        addMetkaBtn.snp.makeConstraints { make in
            make.top.equalTo(metkiLbl.snp.bottom).offset(6)
            make.leading.equalTo(fetchBtn.snp.trailing).offset(6)
            make.width.equalTo(112)
            make.height.equalTo(32)
        }
        dataLbl.snp.makeConstraints { make in
            make.top.equalTo(fetchBtn.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(32)
        }
        dataDetailLbl.snp.makeConstraints { make in
            make.top.equalTo(dataLbl.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(32)
        }
        bottomView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
    }
}
