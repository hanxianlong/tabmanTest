//
//  ViewController.swift
//  tabmanTest
//
//  Created by xianlong on 2017/4/11.
//  Copyright © 2017年 atonce.com.test. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class ViewController: TabmanViewController,PageboyViewControllerDataSource{

    @IBOutlet weak var tabmanContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.embedBar(inView: self.tabmanContainer)
        
        self.bar.appearance = TabmanBar.Appearance({ (appearance) in
            // customise appearance here
//            appearance.indicator.isProgressive = true
            
            appearance.style.bottomSeparatorColor = UIColor.orange
            appearance.state.selectedColor = UIColor.brown
            appearance.indicator.color = UIColor.red
        })
    }
    
    func viewControllers(forPageboyViewController pageboyViewController: PageboyViewController) -> [UIViewController]? {
        
        let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "login")
        let registerVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "register")
        
        let viewControllers = [loginVC, registerVC]
        
        // configure the bar
        self.bar.items = [TabmanBarItem(title: "Login"),
                          TabmanBarItem(title: "Register")]
        
        return viewControllers
    }
    
    func defaultPageIndex(forPageboyViewController pageboyViewController: PageboyViewController) -> PageboyViewController.PageIndex? {
        // use default index
        return nil
    }

}

