package com.fineapple.department.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.DTO.ProjectDTO;
import com.fineapple.DTO.ProjectDetailDTO;
import com.fineapple.DTO.ProjectDetailViewDTO;
import com.fineapple.DTO.ProjectListDTO;
import com.fineapple.DTO.ProjectTotalDTO;
import com.fineapple.DTO.ProjectUnitDTO;
import com.fineapple.DTO.ProjectUnitViewDTO;
import com.fineapple.DTO.ProjectViewDTO;
import com.fineapple.util.DBUtil;

public class ProjectDAO {
	
	private Connection conn; 
	
	/**
	 * 생성자(DB 연결)
	 */
	public ProjectDAO() {
		try {
			conn = DBUtil.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.ProjectDAO ###");
		}
	}
	
	/**
	 * 
	 */
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.close ###");
		}
	}

	/**
	 * 특정 부서의 프로젝트 목록 반환
	 * @param departmentSeq 부서 번호
	 * @return 프로젝트 목록
	 */
	public ArrayList<ProjectListDTO> getProjectList(String departmentSeq) {
		try {
			String sql = "select * from vProject where depSeq = " + departmentSeq + " order by seq desc";
			Statement stat = conn.createStatement();
			
			ArrayList<ProjectListDTO> list = new ArrayList<ProjectListDTO>();
			ResultSet rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				ProjectListDTO dto = new ProjectListDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setDepSeq(rs.getString("depSeq"));
				dto.setRespSeq(rs.getString("respSeq"));
				dto.setSubject(rs.getString("subject"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setType(rs.getString("type"));
				dto.setDepartment(rs.getString("department"));
				dto.setRespName(rs.getString("respName"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getProjectList ###");
			return null;
		}
	}

	/**
	 * 프로젝트 1건의 내용 반환
	 * @param seq 프로젝트 번호
	 * @return 프로젝트 내용
	 */
	public ProjectViewDTO getProjectView(String seq) {
		try {
			String sql = "select * from vProject where seq = " + seq;
			Statement stat = conn.createStatement();
			
			ProjectViewDTO dto = new ProjectViewDTO();
			ResultSet rs = stat.executeQuery(sql);
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setDepSeq(rs.getString("depSeq"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setRespSeq(rs.getString("respSeq"));
				dto.setSubject(rs.getString("subject"));
				dto.setGoal(rs.getString("goal"));
				dto.setContent(rs.getString("content"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setType(rs.getString("type"));
				dto.setDepartment(rs.getString("department"));
				dto.setRespName(rs.getString("respName"));
				dto.setEmpName(rs.getString("empName"));
			}
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getProjectView ###");
			return null;
		}
	}

	/**
	 * 프로젝트에 종속된 모든 단위와 그에 종속된 작업들을 반환
	 * @param pSeq 요청된 프로젝트 번호
	 * @return 프로젝트 단위 및 작업내용들
	 */
	public ArrayList<ProjectDetailViewDTO> getProjectDetailList(String pSeq) {
		try {
			String sql = "select * from vProjectDetail where pSeq = " + pSeq;
			Statement stat = conn.createStatement();
			
			ArrayList<ProjectDetailViewDTO> list = new ArrayList<ProjectDetailViewDTO>(); 
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				ProjectDetailViewDTO dto = new ProjectDetailViewDTO();
				dto.setuSeq(rs.getString("uSeq"));
				dto.setpSeq(rs.getString("pSeq"));
				dto.setWork(rs.getString("work"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setdSeq(rs.getString("dSeq"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setContent(rs.getString("content"));
				dto.setEmpName(rs.getString("empName"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getProjectDetailList ###");
			return null;
		}
	}

	/**
	 * 특정 부서의 현재 진행중인 프로젝트 목록을 반환하도록 하는 서비스
	 * @param departmentSeq 부서번호
	 * @return 현재 진행중인 프로젝트 목록
	 */
	public ArrayList<ProjectListDTO> getProjectListNow(String departmentSeq) {
		try {
			String sql = "select * from vProjectList where endDate >= sysdate and type = 'project' and depSeq = " + departmentSeq + " order by seq desc";
			Statement stat = conn.createStatement();
			
			ArrayList<ProjectListDTO> list = new ArrayList<ProjectListDTO>();
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				ProjectListDTO dto = new ProjectListDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setDepSeq(rs.getString("depSeq"));
				dto.setRespSeq(rs.getString("respSeq"));
				dto.setSubject(rs.getString("subject"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setType(rs.getString("type"));
				dto.setDepartment(rs.getString("department"));
				dto.setRespName(rs.getString("respName"));
				
				list.add(dto);
			}
			return list;
					
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getProjectListNow ###");
			return null;
		}
	}

	/**
	 * 부서장 혹은 사장이 작성한 새로운 프로젝트 혹은 공지사항을 적용
	 * @param dto 작성된 프로젝트 혹은 공지사항
	 * @return 처리 성공 여부
	 */
	public int writeProject(ProjectDTO dto) {
		try {
			String type = "";
			if (dto.getType().equals("no")) {	//프로젝트
				type = "project";
			} else {	//공지사항
				type = "notice";
			}
			String sql = "insert into tblProject (SEQ, DEPSEQ, EMPSEQ, RESPSEQ, SUBJECT, GOAL, CONTENT, STARTDATE, ENDDATE, TYPE) VALUES "
					+ "(projectSeq.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getDepSeq());
			stat.setString(2, dto.getEmpSeq());
			stat.setString(3, dto.getRespSeq());
			stat.setString(4, dto.getSubject());
			stat.setString(5, dto.getGoal());
			stat.setString(6, dto.getContent());
			stat.setString(7, dto.getStartDate());
			stat.setString(8, dto.getEndDate());
			stat.setString(9, type);
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.writeProject ###");
			return 0;
		}
	}

	/**
	 * 과장이 작성한 새로운 단위프로젝트를 적용
	 * @param dto 작성된 단위프로젝트
	 * @return 처리 성공 여부
	 */
	public int writeUnit(ProjectUnitDTO dto) {
		try {
			String sql = "insert into tblPUnit (SEQ, PSEQ, WORK, STARTDATE, ENDDATE) values "
					+ "(PUNITSEQ.nextval, ?, ?, ?, ?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getpSeq());
			stat.setString(2, dto.getWork());
			stat.setString(3, dto.getStartDate());
			stat.setString(4, dto.getEndDate());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.writeUnit ###");
			return 0;
		}
	}

	/**
	 * 사원이 작성한 새로운 프로젝트 업무를 적용하도록 하는 서비스
	 * @param dto 작성된 프로젝트 업무
	 * @return 처리 성공 여부
	 */
	public int writeDetail(ProjectDetailDTO dto) {
		try {
			String sql = "insert into tblPDetail (SEQ, UNITSEQ, EMPSEQ, CONTENT) values "
					+ "(PDETAILSEQ.nextval, ?, ?, ?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getUnitSeq());
			stat.setString(2, dto.getEmpSeq());
			stat.setString(3, dto.getContent());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.writeDetail ###");
			return 0;
		}
	}

	/**
	 * 현재 진행중인 프로젝트 단위 목록을 가져오도록 하는 서비스
	 * @param departmentSeq 부서번호
	 * @return 프로젝트 단위 목록
	 */
	public ArrayList<ProjectUnitViewDTO> getProjectUnitList(String departmentSeq) {
		try {
			String sql = "select * from vProjectUnit where depSeq = " + departmentSeq;
			Statement stat = conn.createStatement();
			
			ArrayList<ProjectUnitViewDTO> list = new ArrayList<ProjectUnitViewDTO>();
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				ProjectUnitViewDTO dto = new ProjectUnitViewDTO();
				dto.setSubject(rs.getString("subject"));
				dto.setuSeq(rs.getString("uSeq"));
				dto.setDepSeq(rs.getString("depSeq"));
				dto.setWork(rs.getString("work"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getProjectUnitList ###");
			return null;
		}
	}

	/**
	 * 프로젝트 단위 문서 반환
	 * @param seq 단위 번호
	 * @return 단위 문서
	 */
	public ProjectUnitViewDTO getProjectUnit(String seq) {
		try {
			String sql = "select * from vProjectUnit where uSeq = " + seq;
			Statement stat = conn.createStatement();
			
			ProjectUnitViewDTO dto = new ProjectUnitViewDTO();
			ResultSet rs = stat.executeQuery(sql);
			if (rs.next()) {
				dto.setuSeq(rs.getString("uSeq"));
				dto.setSubject(rs.getString("subject"));
				dto.setDepSeq(rs.getString("depSeq"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setWork(rs.getString("work"));
			}
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getProjectUnit ###");
			return null;
		}
	}

	/**
	 * 프로젝트 업무 문서 반환
	 * @param seq 업무 번호
	 * @return 업무 문서
	 */
	public ProjectDetailViewDTO getProjectDetail(String seq) {
		try {
			String sql = "select * from vProjectDetail where dSeq = " + seq;
			Statement stat = conn.createStatement();
			
			ProjectDetailViewDTO dto = new ProjectDetailViewDTO();
			ResultSet rs = stat.executeQuery(sql);
			if (rs.next()) {
				dto.setuSeq(rs.getString("uSeq"));
				dto.setpSeq(rs.getString("pSeq"));
				dto.setWork(rs.getString("work"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setdSeq(rs.getString("dSeq"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setContent(rs.getString("content"));
				dto.setEmpName(rs.getString("empName"));
			}
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getProjectDetail ###");
			return null;
		}
	}

	/**
	 * 현재 해당 부서에서 진행중인 모든 프로젝트와 종속된 단위 및 업무들을 반환
	 * @param departmentSeq 부서 번호
	 * @return 진행중인 모든 프로젝트와 종속 단위 및 업무
	 */
	public ArrayList<ProjectTotalDTO> getProjectTotal(String departmentSeq) {
		try {
			String sql = "select * from vProjectList where depSeq = " + departmentSeq + " and type = 'project' order by seq, useq, dseq asc";
			Statement stat = conn.createStatement();
			
			ArrayList<ProjectTotalDTO> tlist = new ArrayList<ProjectTotalDTO>();
			String compare = "";
			String compare2 = "";
			int count1 = 0;
			int count2 = 1;
			int count3 = 1;
			
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				ProjectTotalDTO dto = new ProjectTotalDTO();
									
				dto.setSeq(rs.getString("seq"));
				
				if (!compare.equals(rs.getString("seq"))) {	//기존에 읽어온 적 없는 프로젝트
					
					count1++;
					compare = rs.getString("seq");
					
					dto.setSubject(rs.getString("subject"));
					dto.setdContent(rs.getString("goal"));
					dto.setStartDate(rs.getString("startDate"));
					dto.setEndDate(rs.getString("endDate"));
					dto.setRespName(rs.getString("respName"));
					dto.setTotalSeq(count1+"");
					dto.setParentSeq("0");
					dto.setType("project");	//링크에서 바로 넘겨줄 값을 위해
					
					tlist.add(dto);	//프로젝트 원본
					System.out.println("프로젝트1 : "+dto.getTotalSeq());
					
					if (rs.getString("uSeq") != null) {	//uSeq를 발견
						
						count2 = 1;
						compare2 = rs.getString("uSeq");
						
						ProjectTotalDTO udto = getTotalUnit(rs.getString("uSeq"), count2);
						udto.setTotalSeq(count1+""+count2);
						udto.setParentSeq(count1+"");
						
						tlist.add(udto);
						System.out.println("프로젝트1-1 : "+udto.getTotalSeq());

						if (rs.getString("dSeq") != null) {	//dSeq를 발견
							
							count3 = 1;
							
							ProjectTotalDTO ddto = getTotalDetail(rs.getString("dSeq"), count3);
							ddto.setTotalSeq(count1+""+count2+""+count3);
							ddto.setParentSeq(count1+""+count2);
							
							tlist.add(ddto);
							System.out.println("프로젝트1-1-1 : "+ddto.getTotalSeq());
							
						} else {}	//dSeq 없음
					}
				} else {	//기존에 읽어온 적 있는 프로젝트
					
					if (rs.getString("dSeq") == null) {	//uSeq만 존재
						
						count2++;
						
						ProjectTotalDTO udto = getTotalUnit(rs.getString("uSeq"), count2);
						udto.setTotalSeq(count1+""+count2);
						udto.setParentSeq(count1+"");
						
						tlist.add(udto);
						System.out.println("프로젝트2-1 : "+udto.getTotalSeq());
						
					} else {	//dSeq도 존재
						
						count3++;
						
						ProjectTotalDTO ddto = getTotalDetail(rs.getString("dSeq"), count3);
						ddto.setTotalSeq(count1+""+count2+""+count3);
						ddto.setParentSeq(count1+""+count2);
						
						tlist.add(ddto);
						System.out.println("프로젝트2-2 : "+ddto.getTotalSeq());
					}
				}
			}
			return tlist;
					
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getProjectTotal ###");
			return null;
		}
	}
				
	/**
	 * 프로젝트를 불러오는 도중 종속된 것이 있는 경우
	 * @param uSeq 해당 단위 번호
	 * @param count2 
	 * @param count1 
	 * @param count2 
	 * @return 해당 단위
	 */
	private ProjectTotalDTO getTotalUnit(String uSeq, int count2) {
		try {
			String ssql = "select * from tblPUnit where seq = " + uSeq;
			Statement sstat = conn.createStatement();
			
			ProjectTotalDTO sdto = new ProjectTotalDTO();
			ResultSet srs = sstat.executeQuery(ssql);
			if (srs.next()) {
				sdto.setSeq(srs.getString("seq"));
				sdto.setSubject("프로젝트 단위" + count2);
				sdto.setdContent(srs.getString("work"));
				sdto.setStartDate(srs.getString("startDate"));
				sdto.setEndDate(srs.getString("endDate"));
				sdto.setRespName("");
				sdto.setType("units");
			}
			return sdto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getTotalUnit ###");
			return null;
		}
	}

	/**
	 * 단위를 불러오는 도중 종속된 것이 있는 경우
	 * @param dSeq 해당 작업 번호
	 * @param count2 
	 * @return 해당 작업
	 */
	private ProjectTotalDTO getTotalDetail(String dSeq, int count3) {
		try {
			String ssql = "select * from vProjectTotal where dSeq = " + dSeq;
			Statement sstat = conn.createStatement();
			
			ProjectTotalDTO sdto = new ProjectTotalDTO();
			ResultSet srs = sstat.executeQuery(ssql);
			if (srs.next()) {
				sdto.setSeq(srs.getString("dSeq"));
				sdto.setSubject("프로젝트 단위 업무" + count3);
				sdto.setdContent(srs.getString("dContent"));
				sdto.setStartDate(srs.getString("uStartDate"));
				sdto.setEndDate(srs.getString("uEndDate"));
				sdto.setRespName(srs.getString("dRespName"));
				sdto.setType("detail");							
			}
			return sdto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getTotalDetail ###");
			return null;
		}
	}

/*
public ArrayList<ProjectTotalDTO> getProjectTotal(String departmentSeq) {

		try {
			String sql = "select * from vProjectTotal where depSeq = " + departmentSeq + " and type = 'project' order by seq asc";
			Statement stat = conn.createStatement();
			
			ArrayList<ProjectTotalDTO> tlist = new ArrayList<ProjectTotalDTO>();
			String compare1 = "";
			String compare2 = "";
			int count1 = 1;
			int count2 = 1;
			int count3 = 1;
			String result = "";
			String parentsSeq = "";
			
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				ProjectTotalDTO dto = new ProjectTotalDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setDepSeq(rs.getString("depSeq"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setRespSeq(rs.getString("respSeq"));
				dto.setSubject(rs.getString("subject"));
				dto.setGoal(rs.getString("goal"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setRespName(rs.getString("respName"));
				dto.setDeparment(rs.getString("department"));
				dto.setType("project");	//링크에서 바로 넘겨줄 값을 위해
				
				if (rs.getString("uSeq") != null) {
					dto.setuSeq(rs.getString("uSeq"));
					dto.setpSeq(rs.getString("pSeq"));
					dto.setWork(rs.getString("work"));
					dto.setuStartDate(rs.getString("uStartDate"));
					dto.setuEndDate(rs.getString("uEndDate"));
					dto.setdRespName("");	//단위 담당자를 공란으로 표시하기 위함
					dto.setType("units");

					if (rs.getString("dSeq") != null) {
						dto.setdSeq(rs.getString("dSeq"));
						dto.setDuSeq(rs.getString("duSeq"));
						dto.setdEmpSeq(rs.getString("dEmpSeq"));
						dto.setdContent(rs.getString("dContent"));
						dto.setdRespName(rs.getString("dRespName"));
						dto.setRespName(rs.getString("dRespName"));	//작업 담당자를 담당자로 표시하기 위함
						dto.setType("detail");
					}
				}
				
			
				- 기본작업
				project/units/detail에 각 count를 이용해서 totalSeq로 사용할 값 얻기 
				사용변수 : subject, useq, dseq
				- 추가작업
				출력 시 변수명 통일을 위해 할 일 : (unit)work 존재 시-> subject로 / (subject)goal -> dContent로
				loop * 3
			
				
				//1. 동일 프로젝트인지 확인 (subject 이용)
				System.out.println("조건 전 : " + compare1 + " getS : " + rs.getString("subject"));
				
				if (compare1.equals("")) {	//최초 접근 시
					compare1 = rs.getString("subject");
				} else if (compare1.equals(rs.getString("subject"))) {	//동일 프로젝트	
				} else {	//다른 프로젝트(카운터1 증가, 비교대상 갱신)
					count1++;
					compare1 = rs.getString("subject");
				}
				System.out.println("조건 후 : " + count1);
				
				//2. 현재 dto에 단위 프로젝트가 있는지 확인 (uSeq 이용)
				if (rs.getString("uSeq") == null) {	//단위 프로젝트 없음
					result = count1 + "";
					parentsSeq = "0";
					count2 = 1;
					count3 = 1;
					System.out.println("단위가 없으면, 카운트1 : " + count1 + "결과 : " + result);

					//result 및 추가작업 이후 종료
					
				} else {	//단위 프로젝트 있음
//					System.out.println("단위1");
					if (compare2.equals("")) {	//최초 접근 시 compare2 초기화
						compare2 = rs.getString("uSeq");
						
				//3. 현재 dto에 있는 단위 프로젝트가 이전과 동일한 단위 프로젝트인지 확인 (uSeq 이용)
					} else {	//일반적인 경우(최초 접근이 아닐 시)
//						System.out.println("단위2");
						if (compare2.equals(rs.getString("uSeq"))) {	//동일한 단위 프로젝트
							
						} else {	//다른 단위 프로젝트(카운터2 증가, 비교대상 갱신)
							compare2 = rs.getString("uSeq");
//							System.out.println("단위3");
						}
				//4. 현재 dto에 작업이 있는지 확인 (dSeq 이용)
//						System.out.println("단위4");
						if (rs.getString("dSeq") == null) {	//작업 없음
							result = count1 + "" + count2;
							parentsSeq = count1 + "";
							count2++;
							count3 = 1;
							
//							System.out.println("단위5");
							//result 및 추가작업 이후 종료
							
						} else {	//작업 있음
							result = count1 + "" + count2 + "" + count3;
							parentsSeq = count1 + "" + count2;
							String set = "작업 " + count3;
							count2++;
							count3++;
							dto.setSubject(set);
							//result 및 추가작업 이후 종료
						}
					}
				}
				System.out.println("결과 : " + result + " 부모번호 : " + parentsSeq);
				dto.setTotalSeq(result);
				dto.setParentSeq(parentsSeq);
				
				tlist.add(dto);
			}
			return tlist;
					
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectDAO.getProjectTotal ###");
			return null;
		}
	}	
	*/
	
}