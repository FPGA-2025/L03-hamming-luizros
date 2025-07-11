module injetor(
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output reg [14:0] saida
);

integer i;

always @(*) begin
  saida = entrada; //  sem erro
  if (erro) begin
    for (i = 0; i < 15; i = i + 1) begin
      if (i == n) begin
        saida[i] = ~entrada[i]; // ~ n
      end
    end
  end
end

endmodule
