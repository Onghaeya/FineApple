package com.fineapple.approval.chart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.fineapple.util.DBUtil;


public class ChartDAO {
	
	private Connection conn = null;	
	
	public ChartDAO() {
		conn = DBUtil.getConnection();
	}// 생성자 
	
	public ArrayList<ChartDTO> list() {
		
		try {
			
			String sql = "select seq, approvalcategoryname from approvalCategory order by approvalcategoryname asc";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			ArrayList<ChartDTO> list = new ArrayList<ChartDTO>();//큰상자
			
			while(rs.next()){
				ChartDTO dto = new ChartDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setApprovalcategoryname(rs.getString("approvalcategoryname"));
				
				list.add(dto);
			}
			
			rs.close();
			
			for(ChartDTO dto : list){
				sql = "select to_char(addDate, 'yyyy') as year, sum(num) as num from approvalAdd where aseq = ? group by to_char(addDate, 'yyyy') order by to_char(addDate, 'yyyy') asc";
				PreparedStatement pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getSeq());
				
				ResultSet subrs = pstat.executeQuery();
				ArrayList<ChartSubDTO> sublist
					= new ArrayList<ChartSubDTO>();
				
				while (subrs.next()) {
					//년도별 매출
					//레코드 1건 -> DTO 1건 //1년마다
					ChartSubDTO subdto = new ChartSubDTO();
					subdto.setYear(subrs.getInt("year"));//년도
					subdto.setNum(subrs.getInt("num"));//매출합
					sublist.add(subdto);//1명의 8년간 매출 실적이.. 추가
				}//while
				
				subrs.close();
				dto.setData(sublist);
				
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}//list()

}//ChartDAO


