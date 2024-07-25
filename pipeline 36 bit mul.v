//Shows the multiplication operation placed outside the always block and the pipeline stages represented as single registers.
        
module mul(clk, a, b, mul);
	
	input         clk;
	input  [17:0] a;
	input  [17:0] b;
	output [35:0] mul;
	reg    [35:0] mul;
	reg    [17:0] a_in, b_in;
	wire   [35:0] mul_res;
	reg    [35:0] pipe_1, pipe_2, pipe_3;

	   assign mul_res = a_in * b_in;

	always @(posedge clk)
	    begin
		a_in   <= a; 
		   b_in   <= b;
		   pipe_1 <= mul_res;
		   pipe_2 <= pipe_1;
		   pipe_3 <= pipe_2;
		   mul   <= pipe_3;
	end
endmodule