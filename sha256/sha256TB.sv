module testbench;
    parameter WIDTH = 16;
    reg [WIDTH-1:0] data_in;
    wire [WIDTH-1:0] data_out;

    // Instantiate the rotate_right module with WIDTH = 16 and ROTATE = 4
    rotate_right #(WIDTH, 4) uut (
        .in(data_in),
        .out(data_out)
    );

    initial begin
        data_in = 16'h1234;   // Example input data
        #10;
        $display("Input: %h, Rotated Output: %h", data_in, data_out);
    end
endmodule
