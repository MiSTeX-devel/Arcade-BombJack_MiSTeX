`timescale 1ns/10ps
module  pll_0002(
	input  wire refclk,
	input  wire rst,
	output wire outclk_0,
	output wire outclk_1,
	output wire outclk_2,
	output wire locked
);

	wire feedback1, feedback2;
	wire cascade;
	
	MMCME2_ADV #(
		.CLKFBOUT_MULT_F(6'd12),
		.CLKIN1_PERIOD(20.0),
		.CLKOUT0_DIVIDE_F(12.5), // 48 MHz = 50 MHz * 12 / 12.5
		.CLKOUT0_PHASE(1'd0),
		.CLKOUT1_DIVIDE(100), // 6 MHz = 50 MHz * 12 / 100
		.CLKOUT1_PHASE(1'd0),
		.CLKOUT2_DIVIDE(25), // 24 MHz = 50 MHz * 12 / 25
		.CLKOUT2_PHASE(1'd0),
		.DIVCLK_DIVIDE(1'd1),
		.REF_JITTER1(0.01),
		.STARTUP_WAIT("FALSE")
	) BOMBJACK_PLL (
		.CLKFBIN(feedback1),
		.CLKIN1(refclk),
		.PWRDWN(1'b0),
		.RST(rst),
		.CLKFBOUT(feedback1),
		.CLKOUT0(outclk_0),
		.CLKOUT1(outclk_1),
		.CLKOUT2(outclk_2),
		.LOCKED(locked)
	);
	
endmodule

