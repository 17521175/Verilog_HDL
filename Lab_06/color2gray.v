module color2gray; 

reg [7:0] hexfile[0:7084031];      //declaring hexadecimal file to store input image
reg [7:0] grayfile[0:2361343];     //declaring converted gray file - hexdecimal
reg [7:0] red[0:2361343];          //red color values
reg [7:0] blue[0:2361343];         //blue color values
reg [7:0] green[0:2361343];        //green color values
integer file;
integer i, j, k;
reg [9:0] val;
reg clk;

initial begin
  clk = 0; 
  $readmemh("image.hex", hexfile);        
  i = 0;
  j = 0;
  k = 0;
  forever begin
    #1 clk = ~clk;
  end
end
always @ (posedge clk) begin
		if(i < 2361344)	begin
		  red[i] = hexfile[k];           //transferring values of RGB from image hexfile to red, green, blue registers
		  green[i] = hexfile[k+1];
		  blue[i] = hexfile[k+2];
		  val = red[i]+green[i]+blue[i];    //sum of RGB is stored in a larger register to prevent overflow
		  grayfile[i] = (val)/8'h03;        //divinding sum by 3 to obtain grayscale value
		  k = k + 3;
		  i = i + 1;
		end
end	

initial begin	
	file = $fopen("grayimage.hex", "w");          
end
always @ (posedge clk) begin
		if(j < 2361344)	begin
		  $fwrite(file, "%x\n", grayfile[j]);
		  j = j + 1;
		end
end	
endmodule 





