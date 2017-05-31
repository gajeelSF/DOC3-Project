//
//  OldIdeologyDetailViewController.swift
//  DOC3 Project
//
//  Created by SongYuda on 5/25/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit

class OldIdeologyDetailViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let titles : [String] = ["Foreign Miner's Tax","\"Docile\"", "Exploitation", "Hatred", "Women's occupation", "\"Model Minority\"", "Chinese Exclusion Act", "Conclusion"]
    let messages : [String] = ["The initial rush of Chinese immigrants is caused by the California Gold Rush. However, In 1852, the California legislature enacted a second foriegn minor's tax. Aimed mainly at the Chinese, this tax required a monthly payment of three dollars from every foreign minor who did not desire to become a citizen. Even if they wanted to, the Chinese could not have become citizens, for they had been rendered ineligible to citizenship by a 1790 federal law that reserved naturalized citizenship for 'whites'",
        "As mining profits declined, the Chinese began leaving the gold field and to work on railroad. However, stereotypes were labeled on Chinese workers. The president of Central Pacific Railroad Leland Stanford said, \"(Chinese are) quiet, peaceable, industrious, economical - ready and apt to learn all the different kinds of work required in railway building’ and Chinese had ‘no danger of strikes among them\".",
        "During the construction of Central Pacific Railroad, in order to accelearte the construction, Chinese workers were forced to work through the winter of 1866. The workers lived and worked in tunnels under the snow, with shafts for airs and lanterns for light. Work are dangerous, occsionally deadly. This is just a clip of the over all working situation for Chinese workers who received very low payment and worked in terrible working conditions.",
        "Chinese workers became target of white labor resentmenrt, especially during hard times. \"Whitemen and women who desire to earn a living,\", the Los Angelos Times reported on August 14, 1893, \"have for some time been entering quiet protests against vineyardists and packers employing Chinese in preference to whites.\" Their protests soon became violent as economic depression led to brutal anti-Chinese riots by unemployed white workers throughout California.",
        "In China, laundry work was a \"women's work\". However, laundry work was one of the few oppertunities that were open to Chinese because of the cheap labor offered by Chinese people endangered workers from other races. Racial discrimination drove Chinese into work they disdained as degrading them as men.",
        "Many Chinese who lived in the South were working in the plantations. Planters saw that Chinese could be employed as models for black workers: harding working and frugal, the Chinese would be the \"educators\" of former slaves. However, this is also a representation of Chineses as being docile and unable to rebel, thus escalated the exploitation on Chinese.",
        "The Chinese Exclusion Act was a United States federal law signed by President Chester A. Arthur on May 6, 1882, prohibiting all immigration of Chinese laborers. The act followed the Angell Treaty of 1880, a set of revisions to the US–China Burlingame Treaty of 1868 that allowed the US to suspend Chinese immigration. The act was initially intended to last for 10 years, but was renewed in 1892 with the Geary Act and made permanent in 1902. The Chinese Exclusion Act was the first law implemented to prevent a specific ethnic group from immigrating to the United States. It greatly deepened the structural racial formation on Chinese.",
        "The cause of the degration of Chinese into a subservient laboring caste was the dominant ideology that defined Americans as white. The status of racial inferiority assigned to the Chinese had been prefigured in the other minority of color. This physical difference had always been a strong barrier for Chinese to be involved into the majority society."]
    
    
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
            titleView.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
            titleView.isSelectable = false
            titleView.isEditable = false
            
            textView.text = message
            textView.frame.size.width = viewWidth
            textView.frame.size.height = viewHeight
            textView.frame.origin.x = xPosition
            textView.frame.origin.y = 35
            textView.font = UIFont.init(name: "Helvetica Light", size: 14)
            
            textView.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
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
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
