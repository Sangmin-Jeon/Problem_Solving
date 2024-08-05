from functools import reduce

def solution(order):
    menu = {'cafelatteice': 5000, 'cafelattehot': 5000, 'cafelatte': 5000, 
            'hotcafelatte': 5000, 'icecafelatte': 5000}
    return reduce(lambda price, drink: price + (menu[drink] if drink in menu else 4500), order, 0)