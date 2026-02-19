// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed under the Creative Commons Public Domain.
// SPDX-FileCopyrightText: 2026 Tom and contributors
// SPDX-License-Identifier: CC0-1.0

// Test that a module with a C++ reserved keyword name is handled correctly

// verilator lint_off SYMRSVDWORD

module register (
    input wire clk,
    input wire d,
    output reg q
);
    always @(posedge clk) q <= d;
endmodule

module t (
    /*AUTOARG*/
    // Inputs
    clk
);

    input clk;

    reg d;
    wire q;

    register u_reg (
        .clk(clk),
        .d(d),
        .q(q)
    );

    integer cyc = 0;

    always @(posedge clk) begin
        cyc <= cyc + 1;
        d <= cyc[0];
        if (cyc == 5) begin
            $write("*-* All Finished *-*\n");
            $finish;
        end
    end

endmodule
