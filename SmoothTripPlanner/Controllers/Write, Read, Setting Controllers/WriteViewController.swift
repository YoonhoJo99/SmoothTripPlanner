//
//  WriteViewController.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/10/24.
//

import UIKit

class WriteViewController: UIViewController {

    private let writeView = WriteView()
    
//    private let defaultManager = defaultManager()
    
    override func loadView() { // -> viewDidLoad()보다 먼저 호출이 되는 메소드 -> 기본 view를 교체해줄 수 있음
        view = writeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
       
    }

}
