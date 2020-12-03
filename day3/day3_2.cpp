#include <iostream>
#include <vector>

using namespace std;

int getTrees(vector<string> input, int right, int down) {
    int x = 0, trees = 0;
    for (int i = 0; i < input.size(); i += down) {
        if (input[i][x] == '#') trees++;
        x = ((x + right) >= input[i].size()) ? x + right - input[i].size() : x + right;
    }
    return trees;
}

int main() {
    vector<string> input;
    while (true) {
        string line = "stop";
        cin >> line;
        if (line == "stop") break;
        input.push_back(line);
    }
    int right[5] = {1, 3, 5, 7, 1};
    int down[5]  = {1, 1, 1, 1, 2};
    unsigned long long treeProb = (unsigned long long) getTrees(input, right[0], down[0]);

    for (int i = 1; i < 5; i++) treeProb *= (unsigned long long) getTrees(input, right[i], down[i]);
    cout << "Trees Prob: " << treeProb << '\n';
}