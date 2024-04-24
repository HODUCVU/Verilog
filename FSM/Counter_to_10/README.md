# Require
* Input: 
	* clk, reset.
	* D: a control singal. D = 0: count up, D = 1: count down.
* Output:
	* Q: output signal. Save counter value.
	* C: Alarm overload, count from 9 to 0 (count up) or 0 to 9 (count down) then C = 1, other C = 0.
