module rotate_right #(parameter WIDTH = 8, parameter ROTATE = 1) (
    input  wire [WIDTH-1:0] in,
    output wire [WIDTH-1:0] out
);
    assign out = (in >> ROTATE) | (in << (WIDTH - ROTATE));
endmodule

module CH #(parameter WIDTH = 8) (
    input  wire [WIDTH-1:0] a,
    input  wire [WIDTH-1:0] b,
    input  wire [WIDTH-1:0] c,
    output wire [WIDTH-1:0] out
);
    assign out = (a & b) ^ (~a & c);
endmodule

module MAJ #(parameter WIDTH = 8) (
    input  wire [WIDTH-1:0] a,
    input  wire [WIDTH-1:0] b,
    input  wire [WIDTH-1:0] c,
    output wire [WIDTH-1:0] out
);
    assign out = (a & b) ^ (a & c) ^ (b & c);
endmodule

module Sigma0 #(parameter WIDTH = 32) (
    input  wire [WIDTH-1:0] in,
    output wire [WIDTH-1:0] out
);
    reg [WIDTH-1:0] rr1_out;
    reg [WIDTH-1:0] rr2_out;
    reg [WIDTH-1:0] rr3_out;
    rotate_right #(.WIDTH(WIDTH), .ROTATE(2)) rr1 (
        .in(in),
        .out(rr1_out)
    );
    rotate_right #(.WIDTH(WIDTH), .ROTATE(13)) rr2 (
        .in(in),
        .out(rr2_out)
    );
    rotate_right #(.WIDTH(WIDTH), .ROTATE(22)) rr3 (
        .in(in),
        .out(rr3_out)
    );
    assign out = rr1_out ^ rr2_out ^ rr3_out;
endmodule

module Sigma1 #(parameter WIDTH = 32) (
    input  wire [WIDTH-1:0] in,
    output wire [WIDTH-1:0] out
);
    reg [WIDTH-1:0] rr1_out;
    reg [WIDTH-1:0] rr2_out;
    reg [WIDTH-1:0] rr3_out;
    rotate_right #(.WIDTH(WIDTH), .ROTATE(6)) rr1 (
        .in(in),
        .out(rr1_out)
    );
    rotate_right #(.WIDTH(WIDTH), .ROTATE(11)) rr2 (
        .in(in),
        .out(rr2_out)
    );
    rotate_right #(.WIDTH(WIDTH), .ROTATE(25)) rr3 (
        .in(in),
        .out(rr3_out)
    );
    assign out = rr1_out ^ rr2_out ^ rr3_out;
endmodule

module sigma0 #(parameter WIDTH = 32) (
    input  wire [WIDTH-1:0] in,
    output wire [WIDTH-1:0] out
);
    reg [WIDTH-1:0] rr1_out;
    reg [WIDTH-1:0] rr2_out;
    reg [WIDTH-1:0] rr3_out;
    rotate_right #(.WIDTH(WIDTH), .ROTATE(7)) rr1 (
        .in(in),
        .out(rr1_out)
    );
    rotate_right #(.WIDTH(WIDTH), .ROTATE(18)) rr2 (
        .in(in),
        .out(rr2_out)
    );
    assign out = rr1_out ^ rr2_out ^ (in >> 3);
endmodule

module sigma1 #(parameter WIDTH = 32) (
    input  wire [WIDTH-1:0] in,
    output wire [WIDTH-1:0] out
);
    reg [WIDTH-1:0] rr1_out;
    reg [WIDTH-1:0] rr2_out;
    reg [WIDTH-1:0] rr3_out;
    rotate_right #(.WIDTH(WIDTH), .ROTATE(17)) rr1 (
        .in(in),
        .out(rr1_out)
    );
    rotate_right #(.WIDTH(WIDTH), .ROTATE(19)) rr2 (
        .in(in),
        .out(rr2_out)
    );
    assign out = rr1_out ^ rr2_out ^ (in >> 10);
endmodule

 