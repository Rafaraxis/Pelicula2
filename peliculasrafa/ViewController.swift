//
//  ViewController.swift
//  peliculasrafa
//
//  Created by Alumno on 25/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var urlPelicula = "http://www.omdbapi.com/?apikey=1d2750f9&t=i"
    var pelicula : String = ""
    var encontrada : String = ""
    
    
    @IBOutlet weak var lblTitulo: UILabel!
    
    @IBOutlet weak var lblAño: UILabel!
    
    @IBOutlet weak var lblDuracion: UILabel!
    
    @IBOutlet weak var lblRating: UILabel!
    
    @IBOutlet weak var lblDirector: UILabel!
    
    @IBOutlet weak var lblGenero: UILabel!
    
    @IBOutlet weak var txtFieldBuscar: UITextField!
    
    @IBOutlet weak var lblEncontrada: UILabel!
    
    @IBOutlet weak var aiCargar: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func doTapBuscar(_ sender: Any) {
        
        pelicula = txtFieldBuscar.text!
        
        urlPelicula = "https://www.omdbapi.com/?apikey=f7ceca1b&t=i"
        
        if pelicula != "" {
            urlPelicula = "https://www.omdbapi.com/?apikey=f7ceca1b&t=i\(pelicula)"
        }
        Alamofire.request(urlPelicula).responseJSON { response in
            self.lblTitulo.text = ""
            self.lblRating.text = ""
            self.lblAño.text = ""
           
            self.lblDuracion.text = ""
            self.lblGenero.text = ""
            self.lblDirector.text = ""
            
            if let dictRespuesta = response.result.value as? NSDictionary {
                if let respuesta = dictRespuesta.value(forKey: "Response") as? String {
                    self.encontrada = respuesta
                }
                if self.encontrada == "True" {
                    if let nombre = dictRespuesta.value(forKey: "Title") as? String {
                        self.lblTitulo.text = nombre
                    }
                    if let año = dictRespuesta.value(forKey: "Year") as? String {
                        self.lblAñotext = año
                    }
                    if let clasificacion = dictRespuesta.value(forKey: "Rated") as? String {
                        self.lblRating.text = clasificacion
                    }
                    if let duracion = dictRespuesta.value(forKey: "Runtime") as? String {
                        self.lblDuracion.text = duracion
                    }
                    if let genero = dictRespuesta.value(forKey: "Genre") as? String {
                        self.lblGenero.text = genero
                    }
                    if let director = dictRespuesta.value(forKey: "Director") as? String {
                        self.lblDirector.text = director
                        self.pelicula = ""
                        self.aiCargar.stopAnimating()
                    }
                } else {
                    self.lblEncontrada.text = "Pelicula no encontrada"
                    self.pelicula = ""
                    self.aiCargar.stopAnimating()
                }
        }
    }





