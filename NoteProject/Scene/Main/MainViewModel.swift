//
//  MainViewModel.swift
//  NoteProject
//
//  Created by batuhan on 30.11.2022.
//

import UIKit
import CoreData

protocol ViewModelProtocol{
    var view : ViewControllerProtocol?{get set}
    func viewDidLoad()
    func viewWillAppear()
    func getCount()->Int
    func fetchData()
    func getData(indexpath:Int)->Notes
    func selectedCell(sender : Notes)
    func deleteData(row:Notes)
}


final class MainViewModel{
    weak var view: ViewControllerProtocol?
   
    let context = AppDel.persistentContainer.viewContext
    var notes = [Notes]()
}

extension MainViewModel : ViewModelProtocol{
   
    func deleteData(row : Notes) {
        context.delete(row)
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    func selectedCell(sender : Notes) {
        view?.performSegue(idenfitier: .DetailViewController, sender: sender)
    }
    
    
    func fetchData() {
       
        do {
            let list = try context.fetch(Notes.fetchRequest())
            notes = list
            print(notes.count)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    
    func getData(indexpath : Int) -> Notes {
        let note = notes[indexpath]
        return note
    }
    
    func getCount()->Int {
        return notes.count
    }
    
    func viewDidLoad() {
        fetchData()
        view?.setTableView()
    }
    func viewWillAppear(){
        fetchData()
        
    }
}
