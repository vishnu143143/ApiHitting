
import UIKit
 import UIKit
class HittingImagesApi: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var arr = [User]()
    
    
    @IBOutlet weak var tableViewDemo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var nib = UINib(nibName: "ThirdNib", bundle: nil)
        tableViewDemo.register(nib, forCellReuseIdentifier:"ThirdNib")
        call()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var vc = tableViewDemo.dequeueReusableCell(withIdentifier: "ThirdNib", for: indexPath) as? ThirdNib
       
    
        if let url = NSURL(string: String(self.arr[indexPath.row].imageurl)) ,
            let data = NSData(contentsOf: url as URL) {
            vc?.imagess.image = UIImage(data: data as Data )
            }
        
        
        
       // vc?.imagess.image = UIImage( contentsOfFile: self.arr[indexPath.row].imageurl)
  
     
        return vc!
    }

func call()
{
    var url = "https://simplifiedcoding.net/demos/marvel/"
    var urlString = URL(string: url)
    var request = URLRequest.init(url: urlString!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20.0)
    var task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
        guard let dataIs = data
        else{
            return
        }
        var obj = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
       
        guard let ob = obj as? [[String:Any]]
            else{
               return
        }
        
        for index in ob{
                 let names = User(dict: index)
            self.arr.append(names!)
        }
       
        
        DispatchQueue.main.async {
            self.tableViewDemo.reloadData()
        }
    }
    task.resume()
    
        
    
    }


}
