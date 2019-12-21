//
//  ViewController.swift
//  DemoThought
//
//  Created by Zencode Developer on 20/12/19.
//  Copyright © 2019 Zencode Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_Header: UILabel!
    @IBOutlet weak var tbl_List: UITableView!
    
    @IBOutlet weak var viewWishlist: UIView!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var lblSaving: UILabel!
    @IBOutlet weak var lblTotalItems: UILabel!
    @IBOutlet weak var btnProducts: UIButton!
    @IBOutlet weak var btnWishlist: UIButton!
    
    var index_arr:[Int]?
    var ProductList:[Product]?
    var WishlistCount:Int = 0
    var wishListarr = [Int]()
    var dic = [String:Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        
    }

    @IBAction func wishListValues(_ sender: Any) {
        
        
    }
    
    @IBAction func productList(_ sender: Any) {
    }
    func setUI(){
        
        tbl_List.register(UINib(nibName: "MobileCell", bundle: nil), forCellReuseIdentifier: "mobilecell")
        getProduct()
    }
    
    func getProduct(){
           
           let service = ServiceClass()
           service.getProductList { [weak self] (error, data) in
               if let  error = error {
                   print("error",error)
               }
            self?.ProductList = data
               DispatchQueue.main.async {
                   self?.tbl_List.reloadData()
               }
           }
       }
    
    func detailViewModel(index:Int) -> ProductDetailViewModel?{
        
        guard let products = ProductList  else {
            return nil
        }
        let product = products[index]
        
        return product
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ProductList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MobileCell = tableView.dequeueReusableCell(withIdentifier: "mobilecell", for: indexPath) as! MobileCell
        cell.btnAdd.addTarget(self, action: #selector(Product_add), for: .touchUpInside)
        cell.btnRemove.addTarget(self, action: #selector(Product_remove), for: .touchUpInside)
        cell.btnAdd.tag = indexPath.row
        cell.btnRemove.tag = indexPath.row

        let row = self.ProductList?[indexPath.row]
        cell.img_Product.loadImage(withUrl: row?.image ?? "")
        cell.lbl_ProductName.text = row?.name
        cell.lbl_ProductPrice.text = row?.price
        if (row?.offerPrice) != nil {
            cell.lbl_ProductPrice.textColor = .red
        }else{
            cell.lbl_ProductPrice.textColor = .black
        }
       
        if dic.keys.contains(ProductList?[indexPath.row].pid ?? ""){
            cell.lblWishListCount.text = dic[ProductList?[indexPath.row].pid ?? ""] as? String
        }
                
//        if (ProductList?[indexPath.row].pid == dic.keys.){
//           cell.lblWishListCount.text = "\(String(describing: dic[ProductList?[indexPath.row].pid ?? ""]) )"
//        }else{
//        }
        cell.lblWishListCount.text = "\(WishlistCount)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func Product_add(sender:UIButton){
        
        if index_arr?.contains(sender.tag) ?? true{
            
        }else{
            WishlistCount = 0
            index_arr?.append(sender.tag)
        }
        
        WishlistCount = WishlistCount + 1
        
        dic.updateValue(WishlistCount, forKey:ProductList?[sender.tag].pid ?? "")
        tbl_List.reloadRows(at:[IndexPath(row: sender.tag, section: 0)], with: .none)
        
    }
    
    @objc func Product_remove(sender:UIButton){
        if WishlistCount != 0{
            WishlistCount = WishlistCount - 1
        }
        dic.updateValue(WishlistCount, forKey: ProductList?[sender.tag].pid ?? "")
        tbl_List.reloadRows(at:[IndexPath(row: sender.tag, section: 0)], with: .none)
    }
}

