//
//  PageViewController.swift
//  Swift - 页视图控制器（UIPageViewController）的使用1（基本用法）
//
//  Created by 道标朱 on 16/9/5.
//  Copyright © 2016年 道标朱. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDataSource{

    //所有页面的视图控制器
    private(set) lazy var allViewControllers:[UIViewController] = {
     return [self.getViewController("firstVC"),self.getViewController("secondVC"),self.getViewController("thirdVC")]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        dataSource = self
        
        //设置首页
        if let firstViewController = allViewControllers.first {
            setViewControllers([firstViewController], direction:
                .Forward, animated: true, completion: nil)
        }
    }

    
    
    //根据indentifier获取Storyboard里的视图控制器
    private func getViewController(identifier:String) -> UIViewController{
        return UIStoryboard(name: "Main",bundle: nil).instantiateViewControllerWithIdentifier("\(identifier)")
    }
    

    //获取前一个页面
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = allViewControllers.indexOf(viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        //如果当前是首页，向右滑显示最后一个页面
        guard previousIndex >= 0 else{
            return allViewControllers.last
        }
        guard previousIndex >= 0 else{
            return nil
        }
        guard allViewControllers.count > previousIndex else {
            return nil
        }
        
        return allViewControllers[previousIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //获取前一个页面
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = allViewControllers.indexOf(viewController)else{
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewCotrollersCount = allViewControllers.count
        
        //如果当前是最后一个页面，向左滑显示首页
        guard orderedViewCotrollersCount != nextIndex else{
            return allViewControllers.first
        }
        guard orderedViewCotrollersCount != nextIndex else {
            return nil
        }
        guard orderedViewCotrollersCount > nextIndex else {
            return nil
        }
        return allViewControllers[nextIndex]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
