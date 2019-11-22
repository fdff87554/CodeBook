unordered_map<char, int> value{{'I', 1}, {'V', 5}, {'X', 10}, {'L', 50}, {'C', 100}, {'D', 500}, {'M', 1000}};

int romanToInt(string s){

	if(s.empty())
		return 0;

	int maxDigit = -1;
	int ans = 0;
	for(int i = s.size()-1 ; i >= 0 ; i--){

		const int current = value[s[i]];
		if(current >= maxDigit){

			ans += value[s[i]];
			maxDigit = current;
		}
		else{

			ans -= value[s[i]];
		}
	}
	return ans;
}