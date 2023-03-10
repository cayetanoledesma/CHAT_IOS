//
//  chatTableViewController.swift
//  ChatNotification
//
//  Created by Jesús Fernández on 17/2/23.
//

import UIKit

class chatTableViewController: UITableViewController {
    
    class contacto: NSObject {
        var nombre: String
        var foto:UIImage
        
        init(nombre: String, foto:UIImage){
            self.nombre = nombre
            self.foto = foto
        }
    }
    
  
    var contactos = [
        contacto(nombre: "Cayetano", foto: UIImage(named:"foto1")!),
        contacto(nombre:"Antonio", foto: UIImage(named: "foto1")!),
        contacto(nombre: "Jesus", foto: UIImage(named:"foto1")!),
        contacto(nombre: "Miguel", foto: UIImage(named:"foto1")!),
                        
        
        
        
      
                      
               ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellChat")!
        cell.textLabel?.text = contactos[indexPath.row].nombre
        cell.imageView?.image = contactos[indexPath.row].foto
//        cell.lastMessageLabel.text = "esto es un ejemplo \(indexPath.row)"
//        cell.timeLabel.text = "12:00"
//
       

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
