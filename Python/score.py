#coding:utf-8
score = int(input('Please input the score:'))
if 100 >= score >= 90:
    print('A')
    assert score < 0
elif 90 > score >= 80:
    print('B')
elif 80 > score >= 70:
    print('C')
elif 70 >score:
    print("Fall")
else:
    print("input error!!!")