`timescale 1ns/1ns

module test_bench;

	reg clk = 0;
	DPTR duv( clk );

	always #100 clk = ~clk;

	initial begin
		$dumpfile("wave.vcd");
      	$dumpvars(0, test_bench);

      	#5500 $stop;
	end

endmodule