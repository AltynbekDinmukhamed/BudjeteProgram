//
//  ViewController.swift
//  BudjeteProgram
//
//  Created by Димаш Алтынбек on 29.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK: -LifeCycle-
    private let budjetTopView: BudgeteHeaderView = {
        let view = BudgeteHeaderView()
        return view
    }()
    
    private let historyLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "History"
        lbl.textColor = .black
        lbl.font = UIFont(name: "Manrope-Bold", size: 18)
        return lbl
    }()
    
    private let historyTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HCell")
        table.separatorStyle = .none
        return table
    }()
    
    private let tableSection = ["Today", "Yesterday"]
    
    private let imgName = ["img1", "img2", "img3", "img4", "img5"]
    
    private let tabExpanseName = ["Business", "Transport", "business", "Fasfood", "Transport", "Business"]
    
    private let subExpanseName = ["Dribbble", "Яндекс. Такси", "Перевод Егору", "Delivery Club", "Яндекс. Такси", "Figma"]
    
    private let sumName = ["–12 $", "–560 ₽", "–18 $", "–830 ₽", "–560 ₽", "–18$"]
    
    private lazy var addBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = UIColor(red: 0.137, green: 0.435, blue: 0.341, alpha: 1)
        btn.layer.cornerRadius = 32
        btn.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        return btn
    }()
    
    //MARK: -Life Cycle-
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    
    //MARK: -Functinos-
    
}

//MARK: -exnstion-
extension ViewController {
    private func setUpViews() {
        view.backgroundColor = .white
        view.addSubview(budjetTopView)
        view.addSubview(historyLbl)
        view.addSubview(historyTableView)
        view.addSubview(addBtn)
    }
    
    private func setUpConstraints() {
        budjetTopView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2.5)
        }
        
        budjetTopView.snp.makeConstraints { make in
            make.top.equalTo(budjetTopView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(32)
        }
        
        historyLbl.snp.makeConstraints { make in
            make.top.equalTo(budjetTopView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(32)
        }
        
        historyTableView.snp.makeConstraints { make in
            make.top.equalTo(historyLbl.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        addBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-56)
            make.trailing.equalToSuperview().offset(-32)
            make.width.equalTo(84)
            make.height.equalTo(64)
        }
    }
}
//MARK: -Extension Objc functions-
extension ViewController {
    @objc func addTapped(_ sender: UIButton) {
        let vc = SecoundViewController()
        navigationController?.present(vc, animated: true)
    }
}

//MARK: -Extenstion Table View Delegate-
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableSection[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
//MARK: -Extension Table View Data Source-
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabExpanseName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HCell", for: indexPath) as! HistoryTableViewCell
        let row = indexPath.row
        if row < imgName.count {
            cell.comImg.image = UIImage(named: imgName[row])
        }

        if row < tabExpanseName.count {
            cell.expanseName.text = tabExpanseName[row]
        }

        if row < subExpanseName.count {
            cell.subExpanseName.text = subExpanseName[row]
        }

        if row < sumName.count {
            cell.sumLbl.text = sumName[row]
        }
        return cell
    }
}
