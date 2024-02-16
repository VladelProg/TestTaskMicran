/*
Тестовая схема для проверки TestTask

*/
module tb_LFSR;

  reg clk, rst;
  wire reg_out;

  TestTask uut (
    .clk(clk),
    .rst(rst),
    .reg_out(reg_out)
  );

  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;  // Сброс после 10 тактов
  end

  always #5 clk = ~clk;  // Тактовый сигнал 5 пс

  initial begin
    $monitor("Time=%0t, reg_out=%b", $time, reg_out);
    #100;
  end

endmodule
