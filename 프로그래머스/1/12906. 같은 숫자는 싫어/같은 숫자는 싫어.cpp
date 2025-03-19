#include <vector>
#include <iostream>
#include <map>

using namespace std;

vector<int> solution(vector<int> arr) {
    vector<int> answer;
    std::map<int, bool> hash;
    for (int i = 0; i < arr.size(); i++) {
        hash[i] = false;
    }
    
    int temp;
    
    for (int &val : arr) {
        if (temp != val) { hash[val] = false; }
        if (hash[val] == false) {
            answer.push_back(val);
            hash[val] = true;
        }
        temp = val;
    }
    
    return answer;
}