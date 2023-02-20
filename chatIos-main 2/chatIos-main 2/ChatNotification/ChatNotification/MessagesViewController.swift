//
//  MessagesViewController.swift
//  ChatNotification
//
//  Created by Jesús Fernández on 18/2/23.
//

import UIKit




class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let messageCellId = "messageCellId"
    var key: String = "items_key"
    let datosAppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet weak var messagesTableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    
    var messages:[Message] = [] {
        didSet{
            guardarChat()
        }
    }
    
    let userDefault = UserDefaults.standard
    var itemMensaje: Message?
    var datosmensajes = [String:AnyObject]()
    
    let token: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        getExampleData()
        
        datosmensajes = datosAppDelegate.userData
        print(datosmensajes)
        
        datosmensajes["alert"] = datosAppDelegate.notificaciones as AnyObject
        
        dameMensajes()
       
       
    }
    func dameMensajes() {
        guard
            let datosRecibidos = userDefault.data(forKey: key),
            let datosDecodificados = try? JSONDecoder().decode([Message].self, from: datosRecibidos)
        else { return }
        
        self.messages = datosDecodificados
    }
    
    func guardarChat() {
        if let codificarDatos =  try?
            JSONEncoder().encode(messages) {
            userDefault.set(codificarDatos, forKey: key)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Registrar observadores para detectar cuando se muestra y oculta el teclado
        NotificationCenter.default.addObserver(self, selector: #selector(mostrarTeclado), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ocultarTeclado), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //Eliminar observadores
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func mostrarTeclado(notificacion: NSNotification) {
        print("Se muestra el teclado")
        if let keyboardSize = (notificacion.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if let seleccionado = messageTextField {
                if seleccionado.frame.origin.y + seleccionado.frame.height > UIScreen.main.bounds.size.height - keyboardSize.height - 100 {
                    //El teclado tapa el TextField seleccionado
                    if self.view.frame.origin.y == 0 {
                        self.view.frame.origin.y -= keyboardSize.height
                    }
                }
            }
        }
    }
    @objc func ocultarTeclado(notificacion: NSNotification) {
        print("Se oculta el teclado")
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func getExampleData(){
        
        let message1 = Message(messageText: "hola", messageUserId: 1)
        message1.messageText = "Hola"
        message1.messageUserId = 1
        
        let message2 = Message(messageText: "hola", messageUserId:1)
        message2.messageText = "Hola"
        message2.messageUserId = 2
        
        let message3 = Message(messageText: "que tal", messageUserId: 1)
        message3.messageText = "k tal"
        message3.messageUserId = 1
        
        
        let message4 = Message(messageText: "muy bien", messageUserId: 2)
        message4.messageText = "muy bien"
        message4.messageUserId = 2
        
        
        messages += [message1, message2, message3, message4]
    }
    
    
    func numberOfSections(in tableView: UITableView)-> Int{
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messagesTableView.dequeueReusableCell(withIdentifier: messageCellId, for: indexPath) as! MessageTableViewCell
        
        let message = messages[indexPath.row]
        
        //mensaje de texto que se muestra
        cell.messageLabel.text = message.messageText
        
       
        //mensajes de usuario y determinar donde van cada uno
        //ademas cambio el color y apariencia de la celda
        
        
        if message.messageUserId == 1 {
            cell.messageLabel.textAlignment = .right
            cell.backgroundColor = .green
            cell.messageLabel.textColor = .black
        }
        if message.messageUserId == 2 {
            cell.messageLabel.textAlignment = .left
            cell.backgroundColor = .blue
            cell.messageLabel.textColor = .black
        }
        
            
        
        return cell
    }
    
    
    //para poder enviar el mensaje y que muestre utilizamos la siguiente  funcion
    @IBAction func sendMessageAction(_ sender: Any){
        sendMessage()
    }
    
    
    
    //aplicamos una validación de si existe texto lo envia
    func sendMessage(){
        if let text = messageTextField.text {
            let messageToSend = Message(messageText: "hola", messageUserId: 1)
            messageToSend.messageUserId = 1
            messageToSend.messageText = text
            messages.append(messageToSend)
            self.messagesTableView.reloadData()
            messageTextField.text = ""
            
        }
        
        
        func peticion_notificaciones(mensaje: String) {
            let urlString = "https://test2.qastusoft.com.es/CayetanoLedesma/push.php?TokenPush=\(token)&message=\(mensaje)"

            guard let url = URL(string: urlString) else { return }

            URLSession.shared.dataTask(with: url) { (data, response, error) in

                if error != nil {
                    print(error!.localizedDescription)
                }

                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    print("el status Code es \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                }
                
                DispatchQueue.main.async {
                    self.messagesTableView.reloadData()
                }

            }.resume()
        }
        
        
    }
    
    
    

   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
