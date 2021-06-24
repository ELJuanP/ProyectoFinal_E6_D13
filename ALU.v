`timescale 1ns/1ns
module ALU(
    input [31:0]EA,
    input [31:0]EB,
    input [3:0]sel,
    output reg[31:0]res,
    output reg flag 
);
always @*
begin
    case(sel)
    4'd0:
    begin 
        res = (EA + EB);
    end
    4'd1:
    begin
        res = (EA - EB);
    end
    4'd2:
    begin
        res = (EA & EB);
    end
    4'd3:
    begin
        res = (EA | EB);
    end
    4'd4:
    begin
        res = (EA < EB)?32'b1 : 32'b0;
    end

    4'd5:
    begin
    res = EA << 0;
    end

    4'd6:
    begin
    res = (EA * EB);
    end

    4'd7:
    begin
    res = (EA / EB);
    end
	
	4'd8:
    begin
		res = (EA != EB)?32'b0 : 32'b1;
    end
	
	4'd9:
    begin
		res = (EA > 0)?32'b0 : 32'b1;
    end


    default
    begin
        res = 32'bx;
    end
    endcase

    if (res) 
    begin
        flag <= 0;
    end
    else
    begin
        flag <= 1;
    end
end
endmodule
