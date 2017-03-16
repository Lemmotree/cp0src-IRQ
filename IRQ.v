//------------------------------------------------
// IRQ.v
// Interrupt Request Module
// Authors: X
// Date: 2017/2/23
//------------------------------------------------
`include "./PriorityEncoding.v"
`include "./head.v"
module IRQ(input wire [7:0]  IP,
	input wire [7:0] IM,
	input wire IE,
	output wire timer_irq,
	output wire io_irq,
	output wire soft_irq
	);
wire [7:0] prior_out;
wire [7:0] prior_in;
assign prior_in = IP & IM;
assign timer_irq =(prior_out[7] & IE) ? `ENABLE : `DISABLE;
assign io_irq =(prior_out[6] & IE) ? `ENABLE : `DISABLE;
assign soft_irq = (prior_out[1] & IE) ? `ENABLE : `DISABLE;
PriorityEncoding PriorityEncoding(.prior_in(prior_in),
	.prior_out(prior_out)
	);
endmodule // IRQ

