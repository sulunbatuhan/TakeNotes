//
//  SaveModel.swift
//  NoteProject
//
//  Created by batuhan on 30.11.2022.
//

import UIKit
import CoreData

protocol SaveModelProtocol{
    var view : SaveVCProtocol? {get set}
    func save(text: String,baslik : String)
}

final class SaveModel:SaveModelProtocol{
    weak var view : SaveVCProtocol?
    let context = AppDel.persistentContainer.viewContext
    
    func save(text: String,baslik : String) {
        let newNote = Notes(context: context)
        newNote.baslik = baslik
        newNote.notes = text
        do{
            try  context.save()
        }catch{
            print(error.localizedDescription)
        }
        
    }
}
