//
//  NewIdeologyDetailViewController.swift
//  DOC3 Project
//
//  Created by SongYuda on 5/25/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit

class NewIdeologyDetailViewController: UIViewController {

    let titles : [String] = ["Rich Families", "Lack of involvement", "AI Violation", "STEM only"]
    let messages : [String] = ["Due to high tuition Chinese students pay, people always assume that Chinese international students are from rich families so that they could afford the tuition. Also, some students spend a lot of many buying luxury clothes and fancy cars leaves people a too strong impression that reinforced such stereotype. Therefore, people generalize these impressions onto all of the Chinese international students, thinking they spend unnecessary money and are spoiled by their parent as they are usually the only child in the family due to one-child policy of China.",
        "People always think that Chinese students tend to stick together and are not involved with communities of other races and involved with campus issues. It is partially true because in the campus like UCSD, a large number of Chinese international students provide a stable community in which Chinese international students can stay comfortably in. However, it can't be ignored that a considerable number of Chinese international students are taking actions to be involved with campus fair. From another perspective, campuses should think of how to help students participate and get rid of the barrier of language.",
        "Chinese international students are regarded as morely likely to violate the acdemic integrity. However, cheating is happening in students in all races of students, and the reports of some Chinese students cheat in SAT and college application shift the focus to Chinese students. For most of the Chinese international students, the college is the first time that they get into American education, and the difference in the education systems will cause them unconsciously violate the rules.",
        "This is a quite old stereotype on Chinese international students as in the early days, most of Chinese students are only good at STEM. However, with an increasing number of Chinese international students, more and more students are choosing humanity and social science as their major."]
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewWidth : CGFloat = self.scrollView.frame.width * 2 / 3
        let viewHeight : CGFloat = self.scrollView.frame.height - 35
        var xPosition: CGFloat = self.scrollView.frame.width / 12
        var scrollViewContentSize: CGFloat = 0;
        
        var index = 0;
        
        for message in messages {
            let titleView = UITextView()
            let textView = UITextView()
            titleView.text = self.titles[index]
            titleView.frame.size.width = viewWidth
            titleView.frame.size.height = 35
            titleView.frame.origin.x = xPosition
            titleView.frame.origin.y = 0
            titleView.font = UIFont.init(name: "Helvetica", size: 20)
            titleView.backgroundColor =
            UIColor.init(white: 1, alpha: 0.6)
            titleView.isSelectable = false
            titleView.isEditable = false
            
            textView.text = message
            textView.frame.size.width = viewWidth
            textView.frame.size.height = viewHeight
            textView.frame.origin.x = xPosition
            textView.frame.origin.y = 35
            textView.font = UIFont.init(name: "Helvetica Light", size: 14)
            
            textView.backgroundColor = UIColor.init(white: 1, alpha: 0.6)
            textView.isEditable = false
            textView.isSelectable = false
            
            self.scrollView.addSubview(textView)
            self.scrollView.addSubview(titleView)
            
            xPosition += viewWidth + self.scrollView.frame.width / 12
            scrollViewContentSize += viewWidth + self.scrollView.frame.width / 12
            self.scrollView.contentSize = CGSize(width: scrollViewContentSize, height: viewHeight)
            
            index = index + 1
        }
        self.scrollView.contentSize = CGSize(width: self.scrollView.contentSize.width + self.scrollView.frame.width / 12, height: self.scrollView.contentSize.height)
        
        let image = #imageLiteral(resourceName: "chinese-international-student-starter-pack-white-12655949")
        var imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: xPosition, y:0, width: viewWidth, height: viewHeight + 35)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.init(white: 1, alpha: 0.6)
        xPosition += viewWidth + self.scrollView.frame.width / 12
        scrollViewContentSize += viewWidth + self.scrollView.frame.width / 6
        self.scrollView.addSubview(imageView)
        self.scrollView.contentSize = CGSize(width: scrollViewContentSize, height: viewHeight)
        
        
        let titleView = UILabel()
        titleView.frame = CGRect(x: 4, y:0, width: viewWidth, height: 100)
        titleView.text = "Link: A Note To Asian-American Activists About New Arrivals by Frank H. Wu"
        titleView.font = UIFont.init(name: "Helvetica", size: 20)
        titleView.numberOfLines = 0
        
        let button = UIButton()
        button.frame = CGRect(x: (viewWidth - 60)/2 , y:(viewHeight + 20)/2, width: 60, height: 60)
        let buttonImage = #imageLiteral(resourceName: "iconmonstr-arrow-62-72")
        button.setImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(NewIdeologyDetailViewController.browseButtonTapped(_:)), for: .touchDown)

        
        let netView = UIView()
        netView.frame = CGRect(x: xPosition, y:0, width: viewWidth, height: viewHeight + 35)
        netView.addSubview(titleView)
        netView.addSubview(button)
        netView.backgroundColor = UIColor.init(white: 1, alpha: 0.6)
        xPosition += viewWidth + self.scrollView.frame.width / 12
        scrollViewContentSize += viewWidth + self.scrollView.frame.width / 12
        self.scrollView.addSubview(netView)
        self.scrollView.contentSize = CGSize(width: scrollViewContentSize, height: viewHeight)
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func browseButtonTapped(_ button: UIButton) {
        let url = URL(string: "http://www.huffingtonpost.com/entry/a-private-note-to-asian-american-activists-about-new_us_58cd2d3fe4b0537abd957102")
        UIApplication.shared.openURL(url!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
