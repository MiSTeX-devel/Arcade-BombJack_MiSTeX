// Dual-Port Block RAM with Two Write Ports
// File: ram_6c.v

module ram_6c (
    address,
    clock,
    data,
    wren,
    q);

parameter  addr_width_g = 11;
parameter  data_width_g = 8;
localparam addr_max = addr_width_g ** 2 - 1;

input   clock, wren;
input   [addr_width_g-1:0] address;
input   [data_width_g-1:0] data;
output  [data_width_g-1:0] q;

reg     [data_width_g-1:0] ram [addr_max:0];
reg     [data_width_g-1:0] q;

always @(posedge clock) begin
    if (wren) ram[address] <= data;
    q <= ram[address];
end

endmodule 