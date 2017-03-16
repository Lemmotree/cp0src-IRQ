//------------------------------------------------
// PriorityEncoding.v
// Priority Encoding Module
// Authors: X
// Date: 2017/2/23
//------------------------------------------------
module PriorityEncoding(input wire [7:0] prior_in,
	output wire [7:0] prior_out
	);
assign prior_out[7] = prior_in[7];
assign prior_out[6] = (~ prior_in[7]) & (prior_in[6]);
assign prior_out[5] = (~ prior_in[7]) & (~ prior_in[6]) & (prior_in[5]);
assign prior_out[4] = (~ prior_in[7]) & (~ prior_in[6]) & (~ prior_in[5]) & (prior_in[4]);
assign prior_out[3] = (~ prior_in[7]) & (~ prior_in[6]) & (~ prior_in[5]) &
(~ prior_in[4]) & (prior_in[3]);
assign prior_out[2] = (~ prior_in[7]) & (~ prior_in[6]) & (~ prior_in[5]) & 
(~ prior_in[4]) & (~ prior_in[3]) & (prior_in[2]);
assign prior_out[1] = (~ prior_in[7]) & (~ prior_in[6]) & (~ prior_in[5]) &
(~ prior_in[4]) & (~ prior_in[3]) & (~ prior_in[2]) & (prior_in[1]);
assign prior_out[0] = (~ prior_in[7]) & (~ prior_in[6]) & (~ prior_in[5]) &
(~ prior_in[4]) & (~ prior_in[3]) & (~ prior_in[2]) & (~ prior_in[1]) & (prior_in[0]);
endmodule // PriorityEncoding