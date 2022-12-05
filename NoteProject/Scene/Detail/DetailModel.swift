//
//  DetailModel.swift
//  NoteProject
//
//  Created by batuhan on 30.11.2022.
//

import Foundation
import CoreData

protocol DetailModelProtocol{
    var view : DetailVCProtocol?{get set}
    func didload()
    func update(notes : Notes, baslik: String,text : String)
}

class DetailModel{
    weak var view: DetailVCProtocol?
    let context = AppDel.persistentContainer.viewContext
}

extension DetailModel:DetailModelProtocol{
    func didload() {
        view?.setNote()
        view?.setDesign()
    }
    
    func update(notes : Notes, baslik: String,text : String){
        notes.baslik = baslik
        notes.notes = text
        do {
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    
}
