#include <iostream>
#include <vector>

using namespace std;

bool isPassword(string rule, string letter, string password) {
    int pos1 = stoi(rule.substr(0, rule.find_first_of('-')));
    int pos2 = stoi(rule.substr(rule.find_first_of('-') + 1, rule.size() -1));
    char c = letter[0];

    return ((password[pos1 - 1] == c) != (password[pos2 - 1] == c));
}

int main() {
    vector<string> passwords;

    // Interestingly, this way the numbers, the letter and the password
    // are seperated automatically by ' '.
    // Thats something I didn't know. hm hm.
    while (true) {
        string line = "stop";
        cin >> line;
        if (line == "stop") break;
        passwords.push_back(line);
    }

    int correct = 0;
    for (size_t i = 0; i < passwords.size(); i += 3) {
        if (isPassword(passwords[i], passwords[i+1], passwords[i+2])) correct++;
    }

    cout << "Correct: " << correct << '\n';
}