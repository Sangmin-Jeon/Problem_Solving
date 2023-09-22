#include <vector>
#include <iostream>

using namespace std;

vector<int> solution(vector<int> arr) {
    if (arr.empty()) {
        return vector<int>();
    }

    vector<int> stack;
    stack.push_back(arr[0]);

    for (int i = 1; i < arr.size(); ++i) {
        int pop = arr[i];
        if (stack.back() != pop) {
            stack.push_back(pop);
        }
    }

    return stack;
}