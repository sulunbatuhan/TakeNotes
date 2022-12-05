//
//  ViewController.swift
//  NoteProject
//
//  Created by batuhan on 4.09.2022.
//

import UIKit

protocol ViewControllerProtocol : AnyObject,SeguePerformable{
    func setTableView()
}

final class ViewController: UIViewController {
    
    @IBOutlet weak var searchList: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
   
    private lazy var mainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel.view = self
        mainViewModel.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        mainViewModel.viewWillAppear()
        self.tableView.reloadData()
    }

    @IBAction func NewNoteButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "SaveViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewController"{
            if let rows = sender  as? Notes{
                let gVC = segue.destination as! DetayVC
                gVC.notes = rows
            }
        }
    }
    
}


extension ViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    /*    if searchText == "" {
            mainViewModel.deleteData()
            self.tableView.reloadData()
        }else {
            do{
                let FetchRequest = Notes.fetchRequest()
                FetchRequest.predicate = NSPredicate(format: "baslik CONTAINS %@", searchText)
           //     let liste = try self.context.fetch(FetchRequest)
                
                notes = liste
                self.tableView.reloadData()
            }catch{
                print(error.localizedDescription)
            }*/
        //}
    }
    
    
    
}

//MARK : // TableView

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.getCount() 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rows = mainViewModel.getData(indexpath: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BaslikCell
        cell.baslik.text = rows.baslik
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let DeleteAction = UIContextualAction(style: .destructive, title: "Sil"){(contextulaciton,view,bool) in
            let rows = self.mainViewModel.getData(indexpath: indexPath.row)
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(rows.baslik!) Silinsin mi?", preferredStyle: .alert)
            let Cancel = UIAlertAction(title: "İptal", style: .cancel)
            let OK = UIAlertAction(title: "Sil", style: .destructive){ action in
                self.mainViewModel.deleteData(row: rows)
                self.mainViewModel.fetchData()
                tableView.reloadData()
            }
            alert.addAction(Cancel)
            alert.addAction(OK)
            self.present(alert, animated: true)
            }
        return UISwipeActionsConfiguration(actions: [DeleteAction])
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rows = mainViewModel.getData(indexpath: indexPath.row)
        performSegue(withIdentifier: "DetailViewController", sender: rows)
    }
    
}


extension ViewController : ViewControllerProtocol{
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        searchList.delegate = self
        
        self.viewDesign()
        tableView.reloadData()
       }
}
