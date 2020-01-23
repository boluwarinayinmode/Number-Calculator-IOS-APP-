//
//  conver.swift
//  Nunc
//
//  Created by Boluwarin Ayinmode on 12/16/19.
//  Copyright © 2019 Boluwarin Ayinmode. All rights reserved.
//

import Foundation

class converter:NSObject  {
    var worth:[String] = []
    var number:[String] = []
    var number2:[String] = []
    var number3:[String] = []
    var addin:String = ""
    var len_num:Int
    
    
    override init(){
        
        worth = ["unit", "Ten", "Hundred", "Thousand", "Million", "Billion"]
        number = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
        number2 = ["Ten","Eleven","Twelve","Thirteen","Fourteen", "Fifteen","Sixteen","Seventeen","Eighteen","Nineteen"]
        number3 = ["Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
        addin = ""
        len_num = 0
    }
    
    func get_type(_ num: String) -> String {
        
        
        let len_num = num.count
        
        if len_num == 1{
            return convert_to_unit(num)
        }
        else if len_num == 2 {
            return append_tys(num)
        }
        else if len_num == 3{
            //its a something hundred something
            return append_hudreds(num)
        }
            
        else if len_num == 4 || len_num == 5 || len_num == 6{
            return append_thousands(num)
        }
            
        else if len_num == 7 || len_num == 8 || len_num == 9{
            return append_millions(num)
        }
            
        else if len_num == 10 || len_num == 11 || len_num == 12{
            return append_billions(num)
        }
        return " "
    }
    
    
    func convert_to_unit(_ a:String) -> String{
        
        if a == "1"{
            return number[0]
        } else if a == "2"{
            return number[1]
            
        }else if a == "3"{
            return number[2]
            
        }else if a == "4"{
            return number[3]
            
        }else if a == "5"{
            return number[4]
            
        }else if a == "6"{
            return number[5]
            
        }else if a == "7"{
            return number[6]
            
        }else if a == "8"{
            return number[7]
            
        }else if a == "9"{
            return number[8]
        }
        return "Zero"
    }
    
    func convert_to_teens(_ a:String)->String {             //fourteen fifteen sixteen eleven
        
        
        if a == "10"{
            return number2[0]
        } else if a == "11"{
            return number2[1]
            
        }else if a == "12"{
            return number2[2]
            
        }else if a == "13"{
            return number2[3]
            
        }else if a == "14"{
            return number2[4]
            
        }else if a == "15"{
            return number2[5]
            
        }else if a == "16"{
            return number2[6]
            
        }else if a == "17"{
            return number2[7]
            
        }else if a == "18"{
            return number2[8]
            
        }else if a == "19"{
            return number2[8]
        }
        
        return " "
    }
    
    func convert_to_tys(_ a:String) -> String {        //twentys , thirthys , forties e.t.c trying to append.
        
        if a == "20" || a == "2"{
            return number3[0]
        } else if  a == "30" || a == "3"{
            return number3[1]
            
        } else if  a == "40" || a == "4"{
            return number3[2]
            
        } else if  a == "50" || a == "5"{
            return number3[3]
            
        } else if  a == "60" || a == "6"{
            return number3[4]
            
        } else if  a == "70" || a == "7"{
            return number3[5]
            
        } else if  a == "80" || a == "8"{
            return number3[6]
            
        } else if  a == "90" || a == "9"{
            return number3[7]
            
        }
        return " "
    }
    
    
    
    
    func append_tys(_ x:String) -> String{  // twenty one , thirty-two , doing some appending get it ?
        
        
        
        if x.prefix(1) == "0"{
            return convert_to_unit(String(x[x.index(x.startIndex, offsetBy: 1)]))  // Incase of 09 , 07, 09
        }
        else if x.prefix(1) == "1"{
            return convert_to_teens(x)
        }// 11,12,13,14
            
        else if x.contains("0") && x.prefix(1) != "0" {
            return convert_to_tys(x)
        } //20 , 30 ,40
        else {
            return convert_to_tys(String(x.prefix(1))) + " " + convert_to_unit(String(x[x.index(x.startIndex, offsetBy: 1)]))
        }
        return " "
    }
    
    
    
    
    func append_hudreds(_ a:String)-> String {
        
        let tok =  a.components(separatedBy:"0")
        let y  = tok.count-1
        
        if y == 1 && a.prefix(1) == "0" {
            return get_type(String(a.dropFirst(1)))  //011
        }
            
        else if y == 2 && a.prefix(1) == "0" && a[a.index(a.startIndex, offsetBy: 1)] == "0"{
            return get_type(String(a[a.index(a.startIndex, offsetBy: 2)])) //001
        }
            
        else if a.prefix(1) == "0" &&  a[a.index(a.startIndex, offsetBy: 1)] != "0" && a[a.index(a.startIndex, offsetBy: 2)] == "0" {
            return get_type(String(a.dropFirst(1))) //010
        }
            
        else if y == 2 && a[a.index(a.startIndex, offsetBy: 1)] == "0" && a[a.index(a.startIndex, offsetBy: 2)] == "0"{
            return get_type(String(a.prefix(1))) + " " + worth[2] //100
        }
        else{
            let x = get_type(String(a.dropFirst(1)))
            return get_type(String(a.prefix(1))) + " " + worth[2] + " and " + x
        }
        
        return " "
        
    }
    
    
    
    func append_thousands(_ z:String) -> String {
        //thouands why not just slice out the first 3 numbers and work on the rest
        
        let len_num = z.count
        
        if len_num == 4 {
            
            if z[z.index(z.startIndex, offsetBy: 1)] == "0" && z[z.index(z.startIndex, offsetBy: 2)] == "0" && z[z.index(z.startIndex, offsetBy: 3)] == "0" {
                return get_type(String(z.prefix(1))) + " " + worth[3]
            }
            else{
                return get_type(String(z.prefix(1))) + " " + worth[3] + " and " + get_type(String(z.dropFirst(1)))
            }
        }
            // ten thousands careful of cases like 30004, 30040
        else if len_num == 5{
            
            if z[z.index(z.startIndex, offsetBy: 2)] == "0" && z[z.index(z.startIndex, offsetBy: 3)] == "0" && z[z.index(z.startIndex, offsetBy: 4)] == "0" {
                return get_type(String(z.prefix(2))) + " " + worth[3]
            }
            else{
                return get_type(String(z.prefix(2))) + " " + worth[3] + " and " + get_type(String(z.dropFirst(2)))
            }
        }
            //Hundreds of thousand careful of case liek 300040 300000 , 300005
            //why not just slice out the first 3 numbers and work with the rest !
            
        else if len_num == 6{
            
            if z[z.index(z.startIndex, offsetBy: 3)] == "0" && z[z.index(z.startIndex, offsetBy: 4)] == "0" && z[z.index(z.startIndex, offsetBy: 5)] == "0" {
                return get_type(String(z.prefix(3))) + " " + worth[3]
            }
            else {
                return get_type(String(z.prefix(3))) + " " + worth[3] + " and " + get_type(String(z.dropFirst(3)))
            }
        }
        
        return " "
    }
    
    func append_millions(_ m:String) -> String{
        
        let tok =  m.components(separatedBy:"0")
        let y  = tok.count-1
        
        let len_num = m.count
        
        if len_num == 7 {
            if y == 6 {
                return get_type(String(m.prefix(1))) + " " + worth[4]
            }
            else{
                return get_type(String(m.prefix(1))) + " " + worth[4] + " " + get_type(String(m.dropFirst(1)))
            }
        }
            
            //tens of millions
            
        else if len_num == 8 {
            if y == 6 || y == 7{
                return get_type(String(m.prefix(2))) + " " + worth[4]
            }
            else{
                return get_type(String(m.prefix(2))) + " " + worth[4] + " " + get_type(String(m.dropFirst(2)))
            }
        }
            
            //Hundreds of millions
            
        else if len_num == 9{
            if y == 6 || y == 7 || y == 8{
                return get_type(String(m.prefix(3))) + " " + worth[4]
            }
            else{
                return get_type(String(m.prefix(3))) + " " + worth[4] + " " + get_type(String(m.dropFirst(3)))
            }
        }
        
        return " "
    }
    
    
    func append_billions(_ m:String) -> String {
        //billions
        
        let tok =  m.components(separatedBy:"0")
        let y  = tok.count-1
        
        let len_num = m.count
        
        if len_num == 10 {
            if y == 9{
                return get_type(String(m.prefix(1))) + " " + worth[5]
            }
            else{
                return get_type(String(m.prefix(1))) + " " + worth[5] + " " + get_type(String(m.dropFirst(1)))
            }
        }
            //tens of billions
            
        else if len_num == 11 {
            if y == 9 || y == 10{
                return get_type(String(m.prefix(2))) + " " + worth[5]
            }
            else{
                return get_type(String(m.prefix(2))) + " " + worth[5] + " " + get_type(String(m.dropFirst(2)))
                //Hundreds of billions
            }
        }
        else if len_num == 12 {
            if y == 9 || y == 10 || y == 11{
                return get_type(String(m.prefix(3))) + " " + worth[5]
            }
            else{
                return get_type(String(m.prefix(3))) + " " + worth[5] + " " + get_type(String(m.dropFirst(3)))
                
            }
        }
        return " "
    }
    
}
