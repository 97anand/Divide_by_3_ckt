module tb_div_by3();

  reg      clk_in  ;
  reg      reset_n ;
  wire     clk_out ;

  div_by3 div_by3_i(
      .clk_in  (clk_in  ),
      .reset_n (reset_n ),
      .clk_out (clk_out )
  );

always
  begin
    #5 clk_in = ~clk_in;
  end

initial
begin
 clk_in  = 1'b0 
 reset_n = 1'b0;
 #10;
 reset_n = 1'b1;
 #200000;
 $finish();
end	
endmodule

