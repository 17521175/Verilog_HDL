module median;
  reg [7:0]memory[0:714659];
  reg [7:0]array[1:9];
  reg [7:0]temp;
  reg clk;
  integer flag, count, i, load, done;
  initial
  begin
    clk = 0;
    $readmemh("ImageHex.txt", memory);
    flag = 0;
    count = 1;
    load = 0;
    i = 0;
    done = 0;
    forever 
    begin
      #1  clk = ~clk;
    end
  end
  always @(posedge clk)
  begin
    //lay phan tu
    if (flag == 0 && i <= 714659 )
      begin
        array[1] = memory[i-3-1];
        array[2] = memory[i-3];
        array[3] = memory[i-3+1];
        array[4] = memory[i-1];
        if (load == 1)
          array[4] = temp;
        array[5] = memory[i];
        array[6] = memory[i+1];
        array[7] = memory[i+3-1];
        array[8] = memory[i+3];
        array[9] = memory[i+3+1];
        flag = 1;
        done = done + 11;
      end
    if (flag == 1 && count <= 9)
      begin
        if (array[1] > array[2])
          swap(array[1], array[2], array[1], array[2]);
        if (array[3] > array[4])
          swap(array[3], array[4], array[3], array[4]);
        if (array[5] > array[6])
          swap(array[5], array[6], array[5], array[6]);
        if (array[7] > array[8])
          swap(array[7], array[8], array[7], array[8]);
        flag = 2;
        count = count + 1;
      end
    if (flag == 2 && count <= 9)
      begin
        if (array[2] > array[3])
          swap(array[2], array[3], array[2], array[3]);
        if (array[4] > array[5])
          swap(array[4], array[5], array[4], array[5]);
        if (array[6] > array[7])
          swap(array[6], array[7], array[6], array[7]);
        if (array[8] > array[9])
          swap(array[8], array[9], array[8], array[9]);
        flag = 1;
        count = count + 1;
      end
    if (count == 9)
      begin
        temp = memory[i];
        memory[i] = array[5];
        count = 1;
        flag = 0;
        load = 1;
        i = i + 1;
        done = done + 8;
        if (i > 714659)
        begin
          $display("So chu ky xung: %d", done);
          $writememh("CleanImage.txt", memory);
          $stop;
        end
      end
  end
  task swap;
    input [7:0]a, b;
    output [7:0]outa, outb;
    begin
      assign outa = b;
      assign outb = a;
      done = done + 2;
    end
  endtask
endmodule

