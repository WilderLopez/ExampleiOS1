//
//  GraphicsVC.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import UIKit

class GraphicsVC: UIViewController {
    
    @IBOutlet weak var questionTableView : UITableView!

    var viewModel : BannerCategoryViewModel?
    
    var questions : [Question] = []
    var colors : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.questionTableView.delegate = self
        self.questionTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Agregar en todos los VC
        UIColourScheme.instance.set(for:self)
        
        viewModel = .init(delegate: self)
        viewModel?.getBannerCategory()
    }
    

}

extension GraphicsVC : BannerCaterogyProtocol {
    func getBannerCategoryResponse(banner: BannerCategory) {
        print("all banners: \(banner)")
        colors = banner.colors
        questions = banner.questions
        
        DispatchQueue.main.async {
            self.questionTableView.reloadData()
        }
    }
}

extension GraphicsVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension GraphicsVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionCell.reusableID, for: indexPath) as! QuestionCell
        let question = questions[indexPath.row]
        
        cell.title.text = question.text
        
        return cell
    }
    
    
}
