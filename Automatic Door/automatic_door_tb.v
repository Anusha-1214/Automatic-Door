`timescale 1ns/1ps

module automatic_door_tb;

    reg clk;
    reg reset;
    reg person_detected;

    wire door_open;

    // Instantiate Automatic Door
    automatic_door uut (
        .clk(clk),
        .reset(reset),
        .person_detected(person_detected),
        .door_open(door_open)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("automatic_door.vcd");
        $dumpvars(0, automatic_door_tb);

        // Initial values
        clk = 0;
        reset = 1;
        person_detected = 0;

        #10;

        // Release reset
        reset = 0;

        // --------------------------------
        // TEST 1: No Person
        // Door should remain CLOSED
        // --------------------------------

        #10;
        person_detected = 0;

        #10;

        // --------------------------------
        // TEST 2: Person Detected
        // Door should OPEN
        // --------------------------------

        person_detected = 1;

        #10;

        // --------------------------------
        // TEST 3: Person Still Present
        // Door remains OPEN
        // --------------------------------

        person_detected = 1;

        #10;

        // --------------------------------
        // TEST 4: Person Leaves
        // Door should CLOSE
        // --------------------------------

        person_detected = 0;

        #10;

        // --------------------------------
        // TEST 5: New Person Detected
        // Door should OPEN again
        // --------------------------------

        person_detected = 1;

        #10;

        // --------------------------------
        // TEST 6: Person Leaves
        // Door should CLOSE
        // --------------------------------

        person_detected = 0;

        #20;

        $finish;

    end

    // Display simulation output
    initial begin

        $monitor(
            "Time=%0t | Person=%b | Door_Open=%b",
            $time,
            person_detected,
            door_open
        );

    end

endmodule
