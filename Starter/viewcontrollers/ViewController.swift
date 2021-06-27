//
//  ViewController.swift
//  Starter
//
//  Created by Mac on 17/01/2021.
//

import UIKit

class ViewController: UIViewController{
    
    
//    @IBOutlet weak var textFieldName: UITextField!
//
//    @IBOutlet weak var labelName: UILabel!
//
//    @IBOutlet weak var imageField: UIImageView!
//    @IBAction func didOnTapButton(_ sender: Any) {
//        labelName.text = textFieldName.text
//        textFieldName.text = ""
//    }
    
    @IBOutlet weak var tableViewContent: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewContent.dataSource = self
        tableViewContent.register(UINib(nibName: String(describing:SampleTableViewCell.self), bundle: nil), forCellReuseIdentifier:String(describing:SampleTableViewCell.self))
        
        tableViewContent.register(UINib(nibName: String(describing: Sample2TableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: Sample2TableViewCell.self))
//        let tapGestureImage = UITapGestureRecognizer(target: self, action: #selector(onTapImage))
        
//        imageField.addGestureRecognizer(tapGestureImage)
//        imageField.isUserInteractionEnabled = true
        //main()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        debugPrint("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        debugPrint("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        debugPrint("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        debugPrint("viewDidDisappear")
    }
    
   
    
    
//    @objc func onTapImage(){
//        textFieldName.text = "Inzali Kyaw"
//    }

}
extension ViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:String(describing:SampleTableViewCell.self),for: indexPath) as? SampleTableViewCell else{
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:String(describing:Sample2TableViewCell.self),for: indexPath) as? Sample2TableViewCell else{
                return UITableViewCell()
            }
            return cell
        default:
            return UITableViewCell()
        }
        
    }
}
