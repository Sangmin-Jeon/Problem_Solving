import pandas as pd
import numpy as np

def solution(arr1, arr2):
    m1 = pd.DataFrame(arr1)
    m2 = pd.DataFrame(arr2)
    return np.dot(m1, m2).tolist()