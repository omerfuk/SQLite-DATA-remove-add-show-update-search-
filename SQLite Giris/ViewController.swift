//
//  ViewController.swift
//  SQLite Giris
//
//  Created by Ömer Faruk Kılıçaslan on 19.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        
        //Kisilerdao().kisiEkle(kisi_ad: "Ahmet", kisi_yas: 18)
        //Kisilerdao().kisiSil(kisi_id: 2)
        //Kisilerdao().kisiGuncelle(kisi_id: 1, kisi_ad: "Yeni Ahmet", kisi_yas: 24)
//        let sonuc = Kisilerdao().kisiKontrol(kisi_ad: "Ahmetx")
//        print("Sonuç : \(sonuc)")
       
        
        let kisi = Kisilerdao().kisiGetir(kisi_id: 1)
        
        print("Gelen Kişi : \(kisi.kisi_ad!)")
       
//        let gelenListe = Kisilerdao().aramaYap(kisi_ad: "et")
        
//        let gelenListe = Kisilerdao().tumKisilerAl()
        
//        let gelenListe = Kisilerdao().tumKisilerAlLIMIT()
        
        let gelenListe = Kisilerdao().rastgeleIkiKisiAl()
        
        
        
        
        for k in gelenListe {
            print("ID : \(k.kisi_id!)-- AD : \(k.kisi_ad!)-- YAS : \(k.kisi_yas!)")
        }
    }
    
    func veritabaniKopyala(){
        
        let bundleYolu = Bundle.main.path(forResource:"kisilergiris" , ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("kisilergiris.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            
            print("Veri Tabanı zaten var. kopyalamaya gerek yok")
            
        }
        else{
            
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch {
                print("error")
            }
            
        }
        
    }

}

