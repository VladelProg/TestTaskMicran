/*
Данная схема реализует генерацию псевдослучайных последовательностей по заданому алгоритму
Всего последовательностей - 2^15 = 32768, далее идет повторение.
clk - тактовый сигнал
rst - сигнал сброса (к 1).
reg_out - выходная последовательность
*/
module TestTask (
  input wire clk,
  input wire rst,
  output wire reg_out
);

  reg [15:0] state; // Регистр состояния для хранения текущего значения LFSR
  assign reg_out = state[0]; 

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= 16'b1; // Начальное значение при сбросе равно 1
    end
    else begin
      // Обратная связь по полиному g(x) = 1 + x^14 + x^15
      state <= {state[13:0], state[15] ^ state[14] ^ state[0]};
    end
  end

endmodule
