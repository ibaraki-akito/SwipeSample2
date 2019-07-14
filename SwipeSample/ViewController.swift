//
//  ViewController.swift
//  ScrollSample
//
//  Created by Akito Ibaraki on 2019/07/14.
//  Copyright © 2019 Akito Ibaraki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //２枚のビューを使ってスライドを表現する。スライド回数の奇数偶数で状態が２種類ある
    var isOdd : Bool = false
    let OmoteView : UIView
    let SwipeView1 : UIView
    let SwipeView2 : UIView
    init(){
        OmoteView   = UIView.init()
        SwipeView1   = UIView.init()
        SwipeView2   = UIView.init()
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(SwipeView1)
        self.view.addSubview(SwipeView2)
        self.view.addSubview(OmoteView)
        self.view.backgroundColor = UIColor.white
        OmoteView.backgroundColor = UIColor.white
        SwipeView1.backgroundColor = UIColor.blue
        SwipeView2.backgroundColor = UIColor.red
        
        //初期ポジション
        OmoteView.frame = CGRect(x:0,y:0,width:view.frame.width/2,height:view.frame.height)
        SwipeView1.frame = CGRect(x:view.frame.width/2,y:0,width:view.frame.width/2,height:view.frame.height)
        SwipeView2.frame = CGRect(x:view.frame.width,y:0,width:view.frame.width/2,height:view.frame.height)

        //ジェスチャを拾うおまじない
        let swipeRightGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeRight))
        swipeRightGesture.numberOfTouchesRequired = 1  // number of fingers
        swipeRightGesture.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRightGesture)
        // single swipe left
        let swipeLeftGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeLeft))
        swipeLeftGesture.numberOfTouchesRequired = 1  // number of fingers
        swipeLeftGesture.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeftGesture)

    }
    
    //左スワイプ
    @objc func handleSwipeLeft(sender: UITapGestureRecognizer){
        print("Swiped left!")
        if(isOdd){
            SwipeView1.frame.origin.x = SwipeView2.frame.maxX
            isOdd=false
        }else{
            SwipeView2.frame.origin.x = SwipeView1.frame.maxX
            isOdd=true
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {
            self.SwipeView1.center.x -= self.SwipeView1.frame.width
        }, completion: nil)
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {
            self.SwipeView2.center.x -= self.SwipeView1.frame.width
        }, completion: nil)
      return
    }
    
    //右スワイプ
    @objc func handleSwipeRight(sender: UITapGestureRecognizer){
        if(isOdd){
            SwipeView1.frame.origin.x = SwipeView2.frame.minX - SwipeView2.frame.width
            isOdd=false
        }else{
            SwipeView2.frame.origin.x = SwipeView1.frame.minX - SwipeView1.frame.width
            isOdd=true
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {
            self.SwipeView1.center.x += self.SwipeView1.frame.width
        }, completion: nil)
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {
            self.SwipeView2.center.x += self.SwipeView1.frame.width
        }, completion: nil)
        return
    }

}

