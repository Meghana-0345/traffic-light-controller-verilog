module traffic_light_controller(
    input clk,
    input rst,
    output reg [2:0] light
);

parameter RED    = 2'b00,
          GREEN  = 2'b01,
          YELLOW = 2'b10;

reg [1:0] state, next_state;

always @(posedge clk or posedge rst) begin
    if (rst)
        state <= RED;
    else
        state <= next_state;
end

always @(*) begin
    case(state)
        RED:    next_state = GREEN;
        GREEN:  next_state = YELLOW;
        YELLOW: next_state = RED;
        default: next_state = RED;
    endcase
end

always @(*) begin
    case(state)
        RED:    light = 3'b100;
        GREEN:  light = 3'b001;
        YELLOW: light = 3'b010;
        default: light = 3'b100;
    endcase
end

endmodule
