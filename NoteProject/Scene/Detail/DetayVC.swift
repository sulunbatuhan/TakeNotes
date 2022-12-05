//
//  DetayVC.swift
//  NoteProject
//
//  Created by batuhan on 4.09.2022.
//

import UIKit

protocol DetailVCProtocol:AnyObject{
    func setDesign()
    func setNote()
}

final class DetayVC: UIViewController {
   
    

    @IBOutlet weak var DetayTextView: UITextView!
    @IBOutlet weak var DetayBaslik: UITextField!
    
    
    private lazy var detailModel = DetailModel()
    
    var notes : Notes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailModel.view = self
        detailModel.didload()
        
    }
    
    
    

    @IBAction func Duzenle(_ sender: UIBarButtonItem) {
        if let newNotes = DetayTextView.text,let newBaslik = DetayBaslik.text,let id = notes{
            detailModel.update(notes: id, baslik: newBaslik, text: newNotes)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}

extension DetayVC : DetailVCProtocol{
    func setDesign() {
        self.viewDesign()
    }
    func setNote() {
        if let textNotes = notes{
            DetayBaslik.text = textNotes.baslik
            DetayTextView.text = textNotes.notes
        }
    }
}


