`timescale 1ns / 1ps

/*
*	Four digit dynamic display driver for the CoolRunner-II Starter Board.
*	The display is common anode.
*
*	@Author: Y. Gorbounov, June.2017
*/

module display 
  	(
		input clk, rst,
		input [15:0] data,
		output reg [3:0] ANODE,
		output reg A, B, C, D, E, F, G
	);

	/*****************************************************************
	-	clock divider
	-	to obtain 1kHz frequency with 50% duty cycle
	-	roughly for 10kHz clock:	4-bit counter:		10kHz / 16 = 625
	-	roughly for 100kHz clock:	7-bit counter:		100kHz / 128 = 781.25
	-	roughly for 1MHz clock:	10-bit counter:	1MHz / 1024 = 976,5625
	*****************************************************************/
  
	parameter 				n = 6;
	reg 		[n-1:0] 	counter = 0;
	reg 		[1:0] 		select = 0;
	
	always @(posedge clk or posedge rst)
		if(rst)
			counter <= 0;
		else
			if(&counter)
				counter <= 0;
			else
				counter <= counter + 1;
	
	always @(posedge clk or posedge rst)
		if(rst)
			select <= 0;
		else
			if(&counter)
				select <= select + 1;
  
	/*****************************************************************
	-	end of clock divider
	*****************************************************************/

	/*****************************************************************
	-	multiplexer
	*****************************************************************/
  
	reg [3:0] digit;
		
	always @(data or select)
		case(select)
			2'b00: digit <= data[3:0];
			2'b01: digit <= data[7:4];
			2'b10: digit <= data[11:8];
			2'b11: digit <= data[15:12];
			default: digit <= 4'b0000;
		endcase
	/*****************************************************************
	-	end of multiplexer
	*****************************************************************/

	/*****************************************************************
	-	anode switching: switch according to multiplexer
	*****************************************************************/
  
	always @(select or rst)
		if(rst)
			ANODE <= 4'b1111;
		else
			case(select)
				2'b00: ANODE <= 4'b0111;
				2'b01: ANODE <= 4'b1011;
				2'b10: ANODE <= 4'b1101;
				2'b11: ANODE <= 4'b1110;
				default: ANODE <= 4'b1111;
			endcase
	/*****************************************************************
	-	end of cathode switching
	*****************************************************************/

	/*****************************************************************
	-	hexadecimal to 7 segment decoder
	*****************************************************************/
	always @(digit)
		case(digit)
			4'h0: // 0 (dec), 0 (hex): ABCDEFG => 0000001
				begin A<=0; B<=0; C<=0; D<=0; E<=0; F<=0; G<=1; end
			4'h1: // 1 (dec), 1 (hex): ABCDEFG => 1001111
				begin	A<=1; B<=0; C<=0; D<=1; E<=1; F<=1; G<=1; end
			4'h2: // 2 (dec), 2 (hex): ABCDEFG => 0010010
				begin A<=0; B<=0; C<=1; D<=0; E<=0; F<=1; G<=0; end
			4'h3: // 3 (dec), 3 (hex): ABCDEFG => 0000110
				begin A<=0; B<=0; C<=0; D<=0; E<=1; F<=1; G<=0; end
			4'h4: // 4 (dec), 4 (hex): ABCDEFG => 1001100
				begin A<=1; B<=0; C<=0; D<=1; E<=1; F<=0; G<=0; end
			4'h5: // 5 (dec), 5 (hex): ABCDEFG => 0100100
				begin A<=0; B<=1; C<=0; D<=0; E<=1; F<=0; G<=0; end
			4'h6: // 6 (dec), 6 (hex): ABCDEFG => 0100000
				begin A<=0; B<=1; C<=0; D<=0; E<=0; F<=0; G<=0; end
			4'h7: // 7 (dec), 7 (hex): ABCDEFG => 0001111
				begin A<=0; B<=0; C<=0; D<=1; E<=1; F<=1; G<=1; end
			4'h8: // 8 (dec), 8 (hex): ABCDEFG => 0000000
				begin A<=0; B<=0; C<=0; D<=0; E<=0; F<=0; G<=0; end
			4'h9: // 9 (dec), 9 (hex): ABCDEFG => 0000100
				begin A<=0; B<=0; C<=0; D<=0; E<=1; F<=0; G<=0; end
			4'ha: //10 (dec), A (hex): ABCDEFG => 0001000
				begin A<=0; B<=0; C<=0; D<=1; E<=0; F<=0; G<=0; end
			4'hb: //11 (dec), B (hex): ABCDEFG => 1100000
				begin A<=1; B<=1; C<=0; D<=0; E<=0; F<=0; G<=0; end
			4'hc: //12 (dec), C (hex): ABCDEFG => 0110001
				begin A<=0; B<=1; C<=1; D<=0; E<=0; F<=0; G<=1; end
			4'hd: //13 (dec), D (hex): ABCDEFG => 1000010
				begin A<=1; B<=0; C<=0; D<=0; E<=0; F<=1; G<=0; end
			4'he: //14 (dec), E (hex): ABCDEFG => 0110000
				begin A<=0; B<=1; C<=1; D<=0; E<=0; F<=0; G<=0; end
			4'hf: //15 (dec), F (hex): ABCDEFG => 0111000
				begin A<=0; B<=1; C<=1; D<=1; E<=0; F<=0; G<=0; end
			default: // 0 (dec), 0 (hex): ABCDEFG => 0000001
				begin A<=0; B<=0; C<=0; D<=0; E<=0; F<=0; G<=1; end
		endcase
	/*****************************************************************
	-	end of hexadecimal to 7 segment decoder
	*****************************************************************/

endmodule