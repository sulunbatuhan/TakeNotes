//
//  SeguePerformable.swift
//  NoteProject
//
//  Created by batuhan on 30.11.2022.
//

import UIKit

protocol SeguePerformable{
    func performSegue(idenfitier :SegueIdentifier,sender : Any? )
}

extension SeguePerformable where Self : UIViewController {
    func performSegue(idenfitier:SegueIdentifier, sender : Any? ){
        self.performSegue(withIdentifier: idenfitier.rawValue, sender: sender)
    }
}



enum SegueIdentifier : String{
    case DetailViewController
    case SaveViewController
}
