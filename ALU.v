`timescale 1ns/1ns

module ALU(
    input [31:0]op1,
    input [31:0]op2,
    input [3:0]sel,
    output reg[31:0]res,
    output reg ZF

);



always @*
begin
     case(sel)
        4'd1:
        begin
        res = op1 + op2;
        end

        4'd2:
        begin
        res = op1 - op2;
        end

        4'd3:
        begin
        res = op1 * op2;
        end

        4'd4:
        begin
        res = op1 / op2;
        end

        4'd5:
        begin
        res = op1 | op2;
        end

        4'd6:
        begin
        res = op1 ^ op2;
        end

        4'd7:
        begin
        res = op1 << 0;
        end

        4'd8:
        begin
        if (op1<op2)
	begin
	res <= 1;
	end
	else
	begin
	res <= 0;
	end
        end

        default:
        begin
        res = 32'dx;
        end

     endcase

    if(sel!=0)
        begin
        ZF <= 0;
        end

    else
        begin
        ZF <= 1;
        end
end
endmodule
