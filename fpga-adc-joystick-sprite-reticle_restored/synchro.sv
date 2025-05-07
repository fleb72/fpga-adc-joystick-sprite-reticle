module synchro (
    input logic clk25,  // Horloge rapide 25 MHz
    input logic [11:0] CH, // Signal encodeur (+1, -1, ou 0)
    output logic [11:0] synchro_CH // Impulsion unique et verrouillée
    );

logic [11:0] locked_CH;

always_ff @(posedge clk25) begin
    locked_CH <= CH;  // Stocke la nouvelle direction
end

assign synchro_CH = locked_CH; // Sortie stabilisée

endmodule
