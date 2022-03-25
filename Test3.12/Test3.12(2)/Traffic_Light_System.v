module Traffic_Light_System(clk,s,hg,hy,hr,fg,fy,fr,t1,t2,t3,t_h,t_l,current_state,next_state,s1,s2,s3,ST);
input clk,s;
output hg,hy,hr,fg,fy,fr;
integer rst;
reg s0,s1,s2,s3,ST;
reg t1,t2,t3;
reg current_state,next_state;
time t_h,t_l;


	always@(posedge clk or negedge rst)
	begin
		if(!rst)
		current_state<=2'd0;
		else
		current_state<=next_state;
	end
	
	always@(s,current_state,t1,t2,t3)
	begin
		case(current_state)
			s0:	begin
				next_state=(t1&&s)?s1:s0;
				ST=(t1&&s)?1'b1:1'b0;			
				end
			s1:	begin
				next_state=(t3)?s2:s1;
				ST=(t3)?1'b1:1'b0;			
				end
			s2:	begin
				next_state=(t2||~s)?s3:s2;
				ST=(t2||~s)?1'b1:1'b0;			
				end
			s3:	begin
				next_state=(t3)?s0:s3;
				ST=(t3)?1'b1:1'b0;
				end
		endcase
	end

	always@(posedge clk or negedge rst)   //��ʱģ��
	begin
		if(!rst)
			{t_h,t_l}<=8'd0;
		else if(ST)             //�����ź���Ч˵���Ƶ���ɫ�ı����¼���
			{t_h,t_l}<=8'd0;
		else if((t_h==4'd5)&(t_l==4'd9))   //�ж��Ƿ������60
			begin
			{t_h,t_l}<={t_h,t_l};						
			end
		else if(t_l==4'd9)   //�жϸ�λ�Ƿ������������ʮλ��һ
			begin
			t_h<=t_h+1'b1;
			t_l<=4'd0;			
			end
		else begin
			t_h<=t_h;
			t_l<=t_l+1'b1;		
		end
	end
    assign t3=(t_h==4'd0)&(t_l==4'd4);   //���ɵ��̵Ƽ���ʱ��
	assign t2=(t_h==4'd2)&(t_l==4'd9);	 //	֧�ɵ��̵Ƽ���ʱ��
	assign t1=(t_h==4'd5)&(t_l==4'd9);   //�ƵƼ���ʱ��
	
	always@(current_state)
	begin
		case(current_state)
			s0:	begin
				{hg,hy,hr}=3'b100;  //���ɵ��̵�
				{fg,fy,fr}=3'b001;  //֧�ɵ����			
				end
			s1:	begin
				{hg,hy,hr}=3'b010;  //���ɵ��Ƶ�
				{fg,fy,fr}=3'b001;  //֧�ɵ����			
				end
			s2:	begin
				{hg,hy,hr}=3'b001;  //���ɵ����
				{fg,fy,fr}=3'b100;  //֧�ɵ��̵�			
				end		
			s3:	begin
				{hg,hy,hr}=3'b001;  //���ɵ����
				{fg,fy,fr}=3'b010;  //֧�ɵ��Ƶ�			
				end	
			endcase
	end
endmodule