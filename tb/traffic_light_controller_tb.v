`timescale 1ns/1ps

module traffic_light_controller_tb;

reg clk;
reg rst;
wire [2:0] light;

traffic_light_controller dut (
    .clk(clk),
    .rst(rst),
    .light(light)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #10;
    rst = 0;

    #100;

    $finish;
end

endmodule
