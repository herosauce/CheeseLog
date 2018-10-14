//
//  AddCheeseVC.swift
//  Cheese Log
//
//  Created by David Benhammou on 5/10/17.
//  Copyright © 2017 MobioDev. All rights reserved.
//

import UIKit
import Cosmos
import RealmSwift

class AddCheeseVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    var cheeseImageURL: NSURL!

    @IBOutlet weak var cheeseButton: UIButton!
    
    @IBOutlet weak var etCheeseName: UITextField!
    @IBOutlet weak var etCheeseType: UITextField!
    @IBOutlet weak var etCheeseOrigin: UITextField!
    @IBOutlet weak var etCheeseNotes: UITextField!
    
    @IBOutlet weak var cosmosRating: CosmosView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takeCheesePhoto(_ sender: Any) {
        //source: tutorial at https://www.ioscreator.com/tutorials/take-photo-tutorial-ios8-swift
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imagePicker.dismiss(animated: true, completion: nil)
        //set class variable for imageURL
        cheeseImageURL = info[UIImagePickerControllerReferenceURL] as! NSURL
        
        cheeseButton.setImage((info[UIImagePickerControllerOriginalImage] as? UIImage), for: .normal)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClick(_ sender: Any) {
        let cheese = CheeseItem()
        
        //Logging to determine break point
        print("about to store cheese name: " + etCheeseName.text!)
        cheese.name = etCheeseName.text!
        cheese.type = etCheeseType.text!
        cheese.origin = etCheeseOrigin.text!
        cheese.notes = etCheeseNotes.text!
        cheese.rating = cosmosRating.rating
        print("finished with cheese properties incl rating, now for url")
        /*if ((cheeseImageURL.absoluteString?.characters.count)! > 0){
            try! cheese.cheeseImageData = NSData(contentsOf: cheeseImageURL as URL)
        }*/
        //TODO: duplicate this effort for label pictures if this works for cheese pictures
        print("URL saving complete, writing to Realm database")
        //Save this cheese in Realm database
        let realm = try! Realm()
        try! realm.write {
            realm.add(cheese)
        }
        print("finished writing to Realm, now to dismiss the window")
        //Close the window and return
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
