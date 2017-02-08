//
//  ViewController.swift
//  Parallex
//
//  Created by Prateek Mahawar on 08/02/17.
//  Copyright © 2017 Prateek Mahawar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var titleArr = ["Image 1","Image 2","Image 3","Image 4","Image 5","Image 6","Image 7","Image 8","Image 9"]
    var images: [UIImage] = [
        UIImage(named: "image - 01")!,
        UIImage(named: "image - 02")!,
        UIImage(named: "image - 03")!,
        UIImage(named: "image - 04")!,
        UIImage(named: "image - 05")!,
        UIImage(named: "image - 06")!,
        UIImage(named: "image - 07")!,
        UIImage(named: "image - 08")!,
        UIImage(named: "image - 09")!,
    ]
    
    var parallaxOffsetSpeed:CGFloat = 50
    var cellHeight: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    var parallaxImageHeight: CGFloat {
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * self.tableView.frame.height) - cellHeight) / 2
        return maxOffset + self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageCellTableVC
        cell.configureCell(text: titleArr[indexPath.row], Imag: images[indexPath.row])
        cell.imagePicHeight.constant = self.parallaxImageHeight
        cell.parallexTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
        
        return cell
    }

    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [ImageCellTableVC] {
            cell.parallexTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
        }
    }

}

