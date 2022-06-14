public static String base3conversion(int input){
		String base3From = "";
		while (input > 0) {
		    int nextDigit = input % 3;
		    base3From = nextDigit + base3From;
		    input -= nextDigit;
		    input /= 3;
		}
		return base3From;
	}
