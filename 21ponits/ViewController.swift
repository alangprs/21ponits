
import UIKit

class ViewController: UIViewController {
    //顯示電腦牌array
    @IBOutlet var computerCards: [UIImageView]!
    //顯示目前點數
    @IBOutlet weak var totalNumber: UILabel!
    //要牌button
    @IBOutlet weak var takeCardsButtonAlpha: UIButton!
    
    var 存要牌次數 = 0
    var cards = [Card]() //導入自定義屬性
    var sum1 = 0
    var sum2 = 0
    var sum3 = 0
    var sum4 = 0
    var sum5 = 0
    var points = 0 //存加總之後的點數
    var rankNumber = 0 //存將rank轉成數字得值
    var card = Card()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //產生出52張牌
        for cube in cube{
            for rank in rank{
                card.Cube = cube
                card.Rank = rank
                cards.append(card)
            }
        }
        //洗牌
        cards.shuffle()
    }
   
    //判斷數字func 回傳rank的數字
    func judgeRankFunc(card:Card) -> Int {
        switch card.Rank {
        case "1":
            rankNumber = 11
        case "11","12","13":
        rankNumber = 10
        default:
            rankNumber = Int(card.Rank)!
        }
        
        return rankNumber
    }
    //拿牌button
    @IBAction func takeCards(_ sender: UIButton) {
        存要牌次數 += 1
        let computerFirstCard = cards.randomElement() //存卡片的亂數
        let judgeRankFuncs = judgeRankFunc(card: computerFirstCard!) //存將rank轉為Int

        //每按一次拿牌，存要牌次數+1，用存要牌次數判斷要讓第幾個image出現牌
        switch 存要牌次數 {
        case 1:
            computerCards[0].image = UIImage(named: computerFirstCard!.Cube+computerFirstCard!.Rank) //顯示電腦第一張的牌
             sum1 = judgeRankFuncs
        case 2:
            computerCards[1].image = UIImage(named: computerFirstCard!.Cube+computerFirstCard!.Rank)
             sum2 = judgeRankFuncs
        case 3:
            computerCards[2].image = UIImage(named: computerFirstCard!.Cube+computerFirstCard!.Rank)
             sum3 = judgeRankFuncs
        case 4:
            computerCards[3].image = UIImage(named: computerFirstCard!.Cube+computerFirstCard!.Rank)
             sum4 = judgeRankFuncs
        case 5:
            computerCards[4].image = UIImage(named: computerFirstCard!.Cube+computerFirstCard!.Rank)
             sum5 = judgeRankFuncs
        default:
            break
        }
        //計算牌點數 將每次得到牌的點數存入sum1~4 相加起來
        points = sum1+sum2+sum3+sum4+sum5
        totalNumber.text = "目前點數 \(points) 點"
        
        
        
        if points > 21{
            sender.alpha = 0 //如果點數超過21點，將要牌button隱藏
            totalNumber.text = "目前點數 \(points) 點 \n 爆囉"
            if card.Rank == "1"{  //如果點數超過21點，1點從11點變1點
              rankNumber = 1
            }
        }else if points == 21{
            totalNumber.text = "目前點數 \(points) 點 \n 恭喜"
        }else if points < 21 && 存要牌次數 == 5{
            totalNumber.text = "目前點數 \(points) 點 \n 恭喜過五關"
        }else if card.Rank == "1" && card.Rank == "11",card.Rank == "12", card.Rank == "13"{
            totalNumber.text = "目前點數 \(points) 點 \n哇賽 黑傑克"
        }
        
        
        
    }
    //再一次按鈕
    @IBAction func againButton(_ sender: UIButton) {
      
        for i in 0...4{ //清空1~5牌的image
            computerCards[i].image = UIImage(named:"")
        }
        totalNumber.text = ""
        存要牌次數 = 0
        cards.shuffle()
        sum1 = 0
        sum2 = 0
        sum3 = 0
        sum4 = 0
        sum5 = 0
        takeCardsButtonAlpha.alpha = 1 //將要牌button顯示出來
    }
    

}

