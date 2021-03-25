module div_by3(
  input      clk_in,
  input      reset_n,
  output     clk_out
);

reg clk_out_a;
reg clk_out_b;
reg clk_out_c;


always @(posedge clk_in or negedge reset_n)
  begin
    if(!reset_n)
      begin
       clk_out_a <= 1'b0; 
      end 
    else
      begin
       clk_out_a <= (~clk_out_b && ~ clk_out_a);
      end
  end

always @(posedge clk_in or negedge reset_n)
  begin
    if(!reset_n)
      begin
       clk_out_b <= 1'b0; 
      end 
    else
      begin
       clk_out_b <= clk_out_a;
      end
  end

always @(negedge clk_in or negedge reset_n)
  begin
    if(!reset_n)
      begin
       clk_out_c <= 1'b0; 
      end 
    else
      begin
       clk_out_c <= clk_out_b; 
      end
  end

  assign clk_out = clk_out_c || clk_out_b ;

endmodule
