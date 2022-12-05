//
//  KayitVC.swift
//  NoteProject
//
//  Created by batuhan on 4.09.2022.
//

import UIKit

protocol SaveVCProtocol : AnyObject{
    
}
final class KayitVC: UIViewController,SaveVCProtocol{

    @IBOutlet weak var baslik: UITextField!
    @IBOutlet weak var textNote: UITextView!
    
    private lazy var saveModel = SaveModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveModel.view = self
       
    }
    @IBAction func SaveButton(_ sender: UIBarButtonItem) {
        if let txtNote = textNote.text, let txtBaslik = baslik.text{
            saveModel.save(text: txtNote, baslik: txtBaslik)
         navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

