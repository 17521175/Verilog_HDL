module traffLight(reset, clk, northSouth, eastWest);

// Internal constants
parameter numBit = 2;
parameter delaySize = 4;
parameter state0 = 3'b000, state1 = 3'b001, state2 = 3'b010, state3 = 3'b011, state4 = 3'b100, state5 = 3'b101;
parameter off = 3'b000, red = 3'b100, yellow = 3'b010, green = 3'b001;
parameter delay3s = 3, delay15s = 15;

// IO ports declare
input reset, clk;
output [numBit:0] northSouth, eastWest;

// Output datatype
reg [numBit:0] northSouth, eastWest;

// Internal variables
reg [numBit:0] state;
reg [delaySize:0] count;

// Seq logic
always @ (posedge clk or negedge reset) begin
	if(reset == 0) begin
		state <= state0;
		count <= 0;
	end
	else begin
		case(state)
			state0: if(count < 15) begin
					       state <= state0;
					       count <= count + 1;
				      end
				      else begin
					       state <= state1;
					       count <= 0;	
				      end
			state1: if(count < 3) begin
					       state <= state1;
					       count <= count + 1;
				      end
				      else begin
					       state <= state2;
					       count <= 0;	
				      end
			state2: if(count < 3) begin
					       state <= state2;
					       count <= count + 1;
				      end
				      else begin
					       state <= state3;
				  	      count <= 0;	
				      end
			state3: if(count < 15) begin
					       state <= state3;
					       count <= count + 1;
				      end
				      else begin
					       state <= state4;
					       count <= 0;	
				      end
			state4: if(count < 3) begin
					       state <= state4;
					       count <= count + 1;
				      end
				      else begin
					       state <= state5;
					       count <= 0;	
				      end
			state5:	if(count < 3) begin
					       state <= state5;
					       count <= count + 1;
				      end
				      else begin
					       state <= state0;
					       count <= 0;	
				      end
			default: state <= state0;
		endcase
	end
end

// Output logic
always @ (state) begin
	case(state)
		state0: begin
		        northSouth <= green;
			eastWest <= red;
			end
		state1: begin
		        northSouth <= yellow;
			eastWest <= red;
			end
		state2: begin
		        northSouth <= red;
			eastWest <= red;
			end
		state3: begin
		        northSouth <= red;
			eastWest <= green;
			end
		state4: begin
		        northSouth <= red;
			eastWest <= yellow;
			end
		state5: begin
		        northSouth <= red;
			eastWest <= red;
			end
    		default: begin   
		         northSouth <= off;
			 eastWest <= off;
			 end
	endcase
end
endmodule	