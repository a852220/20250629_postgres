import argparse
import random

def get_user_name()->str:
    parser = argparse.ArgumentParser(description="猜數字遊戲")
    parser.add_argument("-n","--name",type=str,help="姓名")
    parser.add_argument("-f","--frequency",type=int,help="玩的次數",default=1)
    args = parser.parse_args()

    if not args.name:
        name = input("請輸入您的姓名:")
    else:
        name = args.name

    return name

def play_game(name: str, i: int) -> None:
    """
    執行猜數字遊戲的單輪遊戲流程。
    
    遊戲規則：
    - 電腦隨機產生1-100之間的數字
    - 玩家輸入猜測的數字
    - 根據猜測結果給予提示（太大或太小）
    - 動態調整猜測範圍
    - 記錄猜測次數直到猜中為止
    
    Args:
        name (str): 玩家姓名
        i (int): 遊戲輪次（從0開始計算，顯示時會+1）
    
    Returns:
        None: 此函數不返回值，直接進行遊戲互動
        
    Note:
        - 遊戲過程中會即時顯示目標答案（除錯用）
        - 如果輸入超出當前範圍會提示重新輸入
        - 遊戲結束時會顯示總猜測次數
    """
    print(f"========猜數字遊戲第{i+1}次=========\n\n")
    min = 1
    max = 100
    count = 0
    target = random.randint(min, max)
    print(target)
    while True:
        keyin = int(input(f"猜數字範圍{min}~{max}:"))
        count += 1
        if keyin >= min and keyin <= max:
            if target == keyin:
                print(f"賓果!猜對了, 答案是:{target}")
                print(f"{name}共猜了{count}次\n")
                break
            elif keyin > target:
                print(f"猜錯了!再小一點")
                max = keyin - 1
            else:
                print(f"猜錯了!再大一點")
                min = keyin + 1
            print(f"{name}已經猜{count}次\n")
        else:
            print("請輸入提示範圍內的數字\n")

def main():
    frequency = 1
    name = get_user_name()
    for i in range(frequency):
        play_game(name, i)
    print(f"遊戲結束,{name}共玩了{frequency}次")

if __name__ == '__main__':
    main()