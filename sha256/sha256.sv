module rotate_right #(parameter WIDTH = 8, parameter ROTATE = 1) (
    input  wire [WIDTH-1:0] in,
    output wire [WIDTH-1:0] out
);
    assign out = (in >> ROTATE) | (in << (WIDTH - ROTATE));
endmodule

