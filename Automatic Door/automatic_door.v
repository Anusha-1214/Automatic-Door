`timescale 1ns/1ps

module automatic_door (
    input  wire clk,
    input  wire reset,

    // 1 = Person detected
    // 0 = No person
    input  wire person_detected,

    // Door status
    // 1 = Door Open
    // 0 = Door Closed
    output reg door_open
);

    // State definitions
    parameter CLOSED = 1'b0;
    parameter OPEN   = 1'b1;

    reg state;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            state     <= CLOSED;
            door_open <= 1'b0;
        end

        else begin

            case (state)

                // -------------------------
                // CLOSED STATE
                // -------------------------
                CLOSED: begin

                    if (person_detected) begin
                        state     <= OPEN;
                        door_open <= 1'b1;
                    end

                    else begin
                        state     <= CLOSED;
                        door_open <= 1'b0;
                    end

                end

                // -------------------------
                // OPEN STATE
                // -------------------------
                OPEN: begin

                    if (person_detected) begin
                        state     <= OPEN;
                        door_open <= 1'b1;
                    end

                    else begin
                        state     <= CLOSED;
                        door_open <= 1'b0;
                    end

                end

                default: begin
                    state     <= CLOSED;
                    door_open <= 1'b0;
                end

            endcase
        end

    end

endmodule
