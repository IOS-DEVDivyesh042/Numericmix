

import UIKit

class sidemenuTblCell: UITableViewCell {

    @IBOutlet weak var imgSidemenu: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var myview : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
       
        myview.layer.shadowColor = UIColor.red.cgColor
                myview.layer.shadowOpacity = 5
                myview.layer.shadowOffset = CGSize(width: 3, height: 3)
                myview.layer.shadowRadius = 5
                myview.layer.masksToBounds = false
        
        
      

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       
    }

}
