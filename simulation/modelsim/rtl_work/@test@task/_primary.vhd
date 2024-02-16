library verilog;
use verilog.vl_types.all;
entity TestTask is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        reg_out         : out    vl_logic
    );
end TestTask;
