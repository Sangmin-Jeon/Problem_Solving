#include <string>
#include <vector>
#include <algorithm>

using namespace std;

string solution(vector<int> food) {
    string answer = "";
    
    for (int idx = 1; idx < food.size(); idx++) {
        if (food[idx] == 1) { continue; }
        
        if (food[idx] <= 3) {
            answer += to_string(idx);
            continue;
        }
        
        int half = food[idx] / 2;
        for (int _ = 0; _ < half; _++) {
            answer += to_string(idx);
        }
        
    }
    
    string buf = answer;
    reverse(buf.begin(), buf.end());
    
    return answer + "0" + buf;
}