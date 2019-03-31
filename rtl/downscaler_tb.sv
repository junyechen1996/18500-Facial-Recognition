`include "vj_weights.vh"

module downscaler_tb();

  localparam [31:0] pyramid_widths[`PYRAMID_LEVELS-1:0] = `PYRAMID_WIDTHS;
  localparam [31:0] pyramid_heights[`PYRAMID_LEVELS-1:0] = `PYRAMID_HEIGHTS;
  logic [pyramid_heights[0]-1:0][pyramid_widths[0]-1:0][31:0] images0;
  logic [pyramid_heights[9]-1:0][pyramid_widths[9]-1:0][31:0] images9;

  downscaler #(.PYRAMID_INDEX(8),
               .WIDTH_LIMIT(pyramid_widths[9]),
               .HEIGHT_LIMIT(pyramid_heights[9]))
             down1(.input_img(images0), .output_img(images9));
                   
  initial begin
    for (int i = 0; i < pyramid_heights[0]; i=i+1) begin
      for (int j = 0; j < pyramid_widths[0]; j=j+1) begin
        if (i < 60 && j < 80) images0[i][j] = 'd0;
        else if (i >= 60 && j < 80) images0[i][j] = 'd2;
        else if (i < 60 && j >= 80) images0[i][j] = 'd1;
        else images0[i][j] = 'd3;
      end
    end
    #10
    for (int i = 0; i < pyramid_heights[0]; i=i+1) begin
      for (int j = 0; j < pyramid_widths[0]; j=j+1) begin
        $write("%0d", images0[i][j]);
      end
      $write("\n");
    end
    $display("----------------------------------------------------------");
    for (int i = 0; i < pyramid_heights[9]; i=i+1) begin
      for (int j = 0; j < pyramid_widths[9]; j=j+1) begin
        $write("%0d", images9[i][j]);
      end
      $write("\n");
    end
  end

endmodule