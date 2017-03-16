`timescale 1ps/1ps
`include "./IRQ.v"
`include "./head.v"
module IRQ_test;
	reg [7:0] IP,IM;
	reg IE;
	wire timer_irq;
	wire IO_irq;
	wire soft_irq;
	IRQ IRQ(.IP(IP),
	.IM(IM),
	.IE(IE),
	.timer_irq(timer_irq),
	.io_irq(io_irq),
	.soft_irq(soft_irq)
	);
	initial
	begin
		IP = 8'b10001111;
		IM = 8'b11111111;
		IE = `DISABLE;
		#100
		IP = 8'b01001111;
		IM = 8'b11111111;
		IE = `DISABLE;
		#100
		IP = 8'b11001111;
		IM = 8'b11111111;
		IE = `ENABLE;
		#100
		IP = 8'b01001111;
		IM = 8'b11111111;
		IE = `ENABLE;
		#100
		IP = 8'b00000010;
		IE = `DISABLE;
		#100
		IP = 8'b00000010;
		IE = `ENABLE;
		#100
		IP = 8'b00000011;
		IE = `ENABLE;
		#100
		IP = 8'b00000011;
		IE = `DISABLE;
		#200 $finish;
	end
	initial
	begin
		$dumpfile("irq.vcd");
		$dumpvars(0,IRQ_test);
	end
endmodule // IRQ_test