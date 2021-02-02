
import UIKit

class ViewController: UIViewController {
    //顯示電腦牌array
    @IBOutlet var computerCards: [UIImageView]!
    //顯示玩家牌array
    @IBOutlet var playerCards: [UIImageView]!
    //顯示目前點數
    @IBOutlet weak var totalNumber: UILabel!
    //要牌button
    @IBOutlet weak var takeCardsButtonAlpha: UIButton!
    
    
    var 存電腦要牌次數 = 0
    var 存玩家要牌次數 = 0
    var cards = [Card]() //導入自定義屬性
    //存電腦、玩家加總後的點數
    var computerSum = [0,0,0,0,0]
    var playerSum = [0,0,0,0,0]
    var computerPoints = 0 //存加總之後的點數
    var playerPoints = 0
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
        cards.shuffle()
        存電腦要牌次數 += 1
        let computerFirstCard = cards[0] //存卡片的亂數
        let computerJudgeRankFuncs = judgeRankFunc(card: computerFirstCard) //存將rank轉為Int
        
        //每按一次拿牌，存要牌次數+1，用存要牌次數判斷要讓第幾個image出現牌
        switch 存電腦要牌次數 {
        case 1:
            computerCards[0].image = UIImage(named: computerFirstCard.Cube+computerFirstCard.Rank) //顯示電腦第一張的牌
            computerSum[0] = computerJudgeRankFuncs //存得到的牌數字方便加總
        case 2:
            computerCards[1].image = UIImage(named: computerFirstCard.Cube+computerFirstCard.Rank)
            computerSum[1] = computerJudgeRankFuncs
        case 3:
            computerCards[2].image = UIImage(named: computerFirstCard.Cube+computerFirstCard.Rank)
            computerSum[2] = computerJudgeRankFuncs
        case 4:
            computerCards[3].image = UIImage(named: computerFirstCard.Cube+computerFirstCard.Rank)
            computerSum[3] = computerJudgeRankFuncs
        case 5:
            computerCards[4].image = UIImage(named: computerFirstCard.Cube+computerFirstCard.Rank)
            computerSum[4] = computerJudgeRankFuncs
        default:
            break
        }
        存玩家要牌次數 += 1
        let playerCard = cards[1] //存卡片的亂數
        let playerJudgeRankFuncs = judgeRankFunc(card: playerCard) //存將rank轉為Int
        //玩家牌
        switch 存玩家要牌次數 {
        case 1:
            playerCards[0].image = UIImage(named: playerCard.Cube+playerCard.Rank) //顯示電腦第一張的牌
            playerSum[0] = playerJudgeRankFuncs //存得到的牌數字方便加總
        case 2:
            playerCards[1].image = UIImage(named: playerCard.Cube+playerCard.Rank)
            playerSum[1] = playerJudgeRankFuncs
        case 3:
            playerCards[2].image = UIImage(named: playerCard.Cube+playerCard.Rank)
            playerSum[2] = playerJudgeRankFuncs
        case 4:
            playerCards[3].image = UIImage(named: playerCard.Cube+playerCard.Rank)
            playerSum[3] = playerJudgeRankFuncs
        case 5:
            playerCards[4].image = UIImage(named: playerCard.Cube+playerCard.Rank)
            playerSum[4] = playerJudgeRankFuncs
        default:
            break
        }
        //計算牌點數 將每次得到牌的點數存入0~4 相加起來
        computerPoints = computerSum[0]+computerSum[1]+computerSum[2]+computerSum[3]+computerSum[4] //電腦
        playerPoints = playerSum[0]+playerSum[1]+playerSum[2]+playerSum[3]+playerSum[4] //玩家
        
        totalNumber.text = "電腦點數 \(computerPoints) 點 \n 玩家點數\(playerPoints)"
        
        
        
        
        
        
        
    }
    //開牌
    @IBAction func openCards(_ sender: UIButton) {
        
        
    }
    
    //再一次按鈕
    @IBAction func againButton(_ sender: UIButton) {
      
        for i in 0...4{ //清空1~5牌的image
            computerCards[i].image = UIImage(named:"")
            playerCards[i].image = UIImage(named: "")
        }
        totalNumber.text = ""
        存電腦要牌次數 = 0
        存玩家要牌次數 = 0
        cards.shuffle()
        computerSum = [0,0,0,0,0]
        playerSum = [0,0,0,0,0]
        takeCardsButtonAlpha.alpha = 1 //將要牌button顯示出來
    }
    
    
}

