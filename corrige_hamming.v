module corrige_hamming (
  input [14:0] entrada, 
  output reg [10:0] saida
);

wire [3:0] sindrome;
wire [3:0] pos_erro;
reg [14:0] entrada_corrigida;

assign sindrome[0] = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
assign sindrome[1] = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
assign sindrome[2] = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
assign sindrome[3] = ^entrada[14:7];
assign pos_erro = sindrome - 1;
  
always @(*) begin
  entrada_corrigida = entrada;
  if (sindrome != 0) begin
    entrada_corrigida[pos_erro] = ~entrada[pos_erro];
  end
end
always @(*) begin
  saida = {
    entrada_corrigida[14],      
    entrada_corrigida[13],      
    entrada_corrigida[12],      
    entrada_corrigida[11],      
    entrada_corrigida[10],      
    entrada_corrigida[9],      
    entrada_corrigida[8],      
    entrada_corrigida[6],
    entrada_corrigida[5],
    entrada_corrigida[4],
    entrada_corrigida[2]};
end
endmodule
