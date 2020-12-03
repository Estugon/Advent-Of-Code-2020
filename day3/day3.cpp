#include <iostream>
#include <vector>

using namespace std;

int main() {
    vector<string> input;
    while (true) {
        string line = "stop";
        cin >> line;
        if (line == "stop") break;
        input.push_back(line);
    }
    
    int x = 0;
    int trees = 0;
    for (string line : input) {
        if (line[x] == '#') trees++;
        x += 3;
        if (line.size() <= x) {
            x = x - line.size();
        }
    }

    cout << "Trees: " << trees << '\n';

}