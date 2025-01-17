// Block RAM
// File: ram_6ab.v

module ram_6ab (
    address,
    clock,
    data,
    wren,
    q);

parameter  addr_width_g = 11;
parameter  data_width_g = 8;
localparam addr_max = (2 ** addr_width_g) - 1;

input   clock, wren;
input   [addr_width_g-1:0] address;
input   [data_width_g-1:0] data;
output  [data_width_g-1:0] q;

reg     [data_width_g-1:0] ram [addr_max:0];
reg     [data_width_g-1:0] q;

always @(posedge clock) begin
    if (wren) begin
        ram[address] <= data;
        q <= data;
    end else
        q <= ram[address];
end

endmodule 