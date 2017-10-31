package com.fineapple.position.chart;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.util.DBUtil;

public class PsChartDAO {

	private Connection conn = null;
	
	public PsChartDAO() {
		conn = DBUtil.getConnection();
	}
	
	

	public ArrayList<PSChartDTO> list() {

			System.out.println("ㅎㅇ");
		try {
			
			String sql = "select seq, name from tblscategory order by name";
			
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			ArrayList<PSChartDTO> list = new ArrayList<PSChartDTO>(); 	//큰상자
			
			while (rs.next()) {
				//레코드 1개 -> DTO 1개
				PSChartDTO dto = new PSChartDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				
				
				System.out.println(rs.getString("name"));
				//dto.setData(); 	//잠시 보류
				
				list.add(dto);
				
			}
			
			rs.close();
			
			
			//위에서 얻어온 원 5명의 매출 실적을 가져오기 위한 select 다시 실행 
			for (PSChartDTO dto : list) {
				
				sql = "SELECT to_char(startDate, 'yyyy')year, count(*) as count from TBLSCHEDULE WHERE categoryseq = ? GROUP BY to_char(startDate, 'yyyy') ORDER BY to_char(startDate, 'yyyy')";
				
				PreparedStatement pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getSeq());
				
				ResultSet subrs = pstat.executeQuery();
				
				ArrayList<PsChartSubDTO> sublist = new ArrayList<PsChartSubDTO>(); 		//중간 상자 (매출 실적)
				while (subrs.next()) {
					//년도별 매출
					//레코드 1건 -> DTO 1건 //1년마다 
					PsChartSubDTO subdto = new PsChartSubDTO();
					subdto.setYear(subrs.getInt("year"));	// 년도별
					System.out.println(subrs.getInt("count"));

					subdto.setCount(subrs.getInt("count"));	//업무량
					System.out.println("태현테스트"+subdto.getCount());
					if (String.valueOf(subdto.getCount()) == null) {
						subdto.setCount(0);
					}
					sublist.add(subdto); //1명의 8년간 매출 실적이 추가 
					
										
				}//while
				ArrayList<PsChartSubDTO> realsublist = new ArrayList<PsChartSubDTO>(); 
				int tempYear=2010;
				for(int i=0; i<9; i++){
					
					
					boolean isEqual=false;
					for(PsChartSubDTO sdto : sublist){
						if(sdto.getYear()==tempYear){
							isEqual=true;
							realsublist.add(sdto);
						}
					}
					if(isEqual){
						tempYear++;
						
						continue;
					}
					PsChartSubDTO temp = new PsChartSubDTO();
					temp.setYear(tempYear);
					temp.setCount(0);
					
					realsublist.add(temp);
					tempYear++;
				}
				
			
				subrs.close();
				
				dto.setData(realsublist);	//1명의 매출실적 추가 
			}
			
			//반환
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
