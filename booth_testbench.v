module test_bench;
parameter N=8;
parameter alpha=3;
wire [(N+N)-1:0] ans;
reg start;
reg clk;
reg [N-1:0] data_inM,data_inQ;
wire [2:0] state;
wire clra,lda,shfta,ldq,shftq,clrq,shftff,clrff,addsub,ldm,clrm,ldcount,decr,comp;
wire [alpha:0] count;
wire [1:0] value;
wire [N-1:0] a,q;
wire qm1;
datapath dp(clk,clra,lda,shfta,ldq,data_inQ,shftq,clrq,shftff,clrff,addsub,data_inM,ldm,clrm,ldcount,decr,comp,ans,count,value,a,q,qm1);
controlpath con(clk,clra,lda,shfta,ldq,data_inQ,shftq,clrq,shftff,clrff,addsub,data_inM,ldm,clrm,ldcount,decr,comp,count,value,start,state);
initial 
begin
 clk=1'b0;
 start = 1'b1;
end
always #5 clk=~clk;
initial
begin
//$monitor($time,"data_inM=%b,data_inQ=%b,start=%b,ans=%b,A=%b,Q=%b,state=%d,value=%d,shiftA=%b,shiftq=%b",data_inM,data_inQ,start,ans,DUT.dp.a,DUT.dp.q,DUT.cp.state,DUT.dp.value,DUT.cp.shfta,DUT.cp.shfta);
#15 data_inM=8'b00011111;data_inQ=8'b00100111;
#1000 $finish;
end
endmodule