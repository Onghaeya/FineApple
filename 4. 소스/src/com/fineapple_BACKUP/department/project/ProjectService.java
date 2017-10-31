package com.fineapple.department.project;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.EmployeeDTO;
import com.fineapple.DTO.ProjectCommentDTO;
import com.fineapple.DTO.ProjectDTO;
import com.fineapple.DTO.ProjectDetailDTO;
import com.fineapple.DTO.ProjectDetailViewDTO;
import com.fineapple.DTO.ProjectListDTO;
import com.fineapple.DTO.ProjectTotalDTO;
import com.fineapple.DTO.ProjectUnitDTO;
import com.fineapple.DTO.ProjectUnitViewDTO;
import com.fineapple.DTO.ProjectViewDTO;
import com.fineapple.department.outcome.OutcomeDAO;

public class ProjectService {
	private ProjectDAO dao;
	private HttpSession session;
	
	public ProjectService(HttpSession session) {
		this.dao = new ProjectDAO();
		this.session = session;
	}

	/**
	 * 특정 부서의 프로젝트 목록을 반환하도록 하는 서비스
	 * @param departmentSeq 부서번호
	 * @return 프로젝트 목록
	 */
	public ArrayList<ProjectListDTO> getProjectList(String departmentSeq) {
		ArrayList<ProjectListDTO> list = dao.getProjectList(departmentSeq);
		for (ProjectListDTO dto : list) {
			dto.setSubject(dto.getSubject().replaceAll("<", "&lt;")); //스크립트 제거
			dto.setStartDate(dto.getStartDate().substring(0, 10));	//일자 일단위로 잘라내기
			dto.setEndDate(dto.getEndDate().substring(0, 10));
			if (dto.getSubject().length() > 20) {	//주제의 길이 자르기
				String subject = dto.getSubject().substring(0, 20);
				subject = subject + "..";
				dto.setSubject(subject);
			}
		}
		return list;
	}

	/**
	 * 프로젝트 1건의 내용을 반환하도록 하는 서비스
	 * @param seq 요청된 프로젝트 번호 
	 * @return 프로젝트 내용
	 */
	public ProjectViewDTO getProjectView(String seq) {
		ProjectViewDTO dto = dao.getProjectView(seq);
		dto.setSubject(dto.getSubject().replaceAll("<", "&lt;"));	//주제 스크립트 제거
		dto.setSubject(dto.getSubject().replaceAll("\r\n", "<br />"));
		dto.setGoal(dto.getGoal().replaceAll("<", "&lt;"));	//목표 스크립트 제거
		dto.setGoal(dto.getGoal().replaceAll("\r\n", "<br />"));
		dto.setContent(dto.getContent().replaceAll("<", "&lt;"));
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br />"));	//내용 스크립트 제거
		dto.setStartDate(dto.getStartDate().substring(0, 10));	//일자 일단위로 잘라내기
		dto.setEndDate(dto.getEndDate().substring(0, 10));
		
		/*ArrayList<ProjectCommentDTO> list = dto.getCommentList();
		for (ProjectCommentDTO cdto : list) {	//댓글 내용 스크립트 제거
			cdto.setContent(cdto.getContent().replaceAll("<", "&lt;"));
		}
		dto.setCommentList(list);*/
		return dto;
	}

	/**
	 * 프로젝트에 종속된 모든 단위와 그에 종속된 작업들을 반환하도록 하는 서비스
	 * @param pSeq 요청된 프로젝트 번호 
	 * @return 프로젝트 단위 및 작업내용들
	 */
	public ArrayList<ProjectDetailViewDTO> getProjectDetailList(String pSeq) {
		ArrayList<ProjectDetailViewDTO> list = dao.getProjectDetailList(pSeq);
		for (ProjectDetailViewDTO dto : list) {
			dto.setWork(dto.getWork().replaceAll("<", "&lt;").replaceAll("\r\n", "<br / >"));
			dto.setContent(dto.getContent().replaceAll("<", "&lt;").replaceAll("\r\n", "<br / >"));
			dto.setStartDate(dto.getStartDate().substring(0, 10));	//일자 일단위로 잘라내기
			dto.setEndDate(dto.getEndDate().substring(0, 10));
		}
		return list;
	}

	/**
	 * 해당 부서에 소속된 부서원들의 정보를 반환하도록 하는 서비스
	 * @param departmentSeq 요청한 부서 번호
	 * @return 부서원들의 정보
	 */
	public ArrayList<EmployeeDTO> getProjectPerson(String departmentSeq) {
		OutcomeDAO odao = new OutcomeDAO();
		return odao.getDepartmentEmployee(departmentSeq);
	}

	/**
	 * 특정 부서의 현재 진행중인 프로젝트 목록을 반환하도록 하는 서비스
	 * @param departmentSeq 부서번호
	 * @return 현재 진행중인 프로젝트 목록
	 */
	public ArrayList<ProjectListDTO> getProjectListNow(String departmentSeq) {
		ArrayList<ProjectListDTO> list = dao.getProjectListNow(departmentSeq);
		for (ProjectListDTO dto : list) {
			dto.setSubject(dto.getSubject().replaceAll("<", "&lt;")); //스크립트 제거
			dto.setSubject(dto.getSubject().replaceAll("\r\n", "<br / >"));
			dto.setStartDate(dto.getStartDate().substring(0, 10));	//일자 일단위로 잘라내기
			dto.setEndDate(dto.getEndDate().substring(0, 10));
		}
		return list;
	}

	/**
	 * 부서장 혹은 사장이 작성한 새로운 프로젝트 혹은 공지사항을 적용하도록 하는 서비스
	 * @param dto 작성된 프로젝트 혹은 공지사항
	 * @return 처리 성공 여부
	 */
	public int writeProject(ProjectDTO dto) {
		return dao.writeProject(dto);
	}

	/**
	 * 과장이 작성한 새로운 단위프로젝트를 적용하도록 하는 서비스
	 * @param dto 작성된 단위프로젝트
	 * @return 처리 성공 여부
	 */
	public int writeUnit(ProjectUnitDTO dto) {
		return dao.writeUnit(dto);
	}

	/**
	 * 사원이 작성한 새로운 프로젝트 업무를 적용하도록 하는 서비스
	 * @param dto 작성된 프로젝트 업무
	 * @return 처리 성공 여부
	 */
	public int writeDetail(ProjectDetailDTO dto) {
		return dao.writeDetail(dto);
	}

	/**
	 * 현재 진행중인 프로젝트 단위 목록을 가져오도록 하는 서비스
	 * @param departmentSeq 부서번호
	 * @return 프로젝트 단위 목록
	 */
	public ArrayList<ProjectUnitViewDTO> getProjectUnitList(String departmentSeq) {
		ArrayList<ProjectUnitViewDTO> list = dao.getProjectUnitList(departmentSeq);
		for (ProjectUnitViewDTO dto : list) {
			dto.setWork(dto.getWork().replaceAll("<", "&lt;")); //스크립트 제거
			dto.setWork(dto.getWork().replaceAll("\r\n", "<br / >"));	//개행문자
			if (dto.getWork().length() > 30) {
				dto.setWork(dto.getWork().substring(0, 30) + "..");
			}
			dto.setSubject(dto.getSubject().replaceAll("<", "&lt;"));
			dto.setStartDate(dto.getStartDate().substring(0, 10));	//일자 일단위로 잘라내기
			dto.setEndDate(dto.getEndDate().substring(0, 10));
		}
		return list;
	}

	/**
	 * 프로젝트 단위를 가져오도록 하는 서비스
	 * @param seq 단위 번호
	 * @return 단위 문서
	 */
	public ProjectUnitViewDTO getProjectUnit(String seq) {
		ProjectUnitViewDTO dto = dao.getProjectUnit(seq);
		dto.setWork(dto.getWork().replaceAll("<", "&lt;")); //스크립트 제거
		dto.setWork(dto.getWork().replaceAll("\r\n", "<br / >"));	//개행문자
		dto.setSubject(dto.getSubject().replaceAll("<", "&lt;"));
		dto.setStartDate(dto.getStartDate().substring(0, 10));	//일자 일단위로 잘라내기
		dto.setEndDate(dto.getEndDate().substring(0, 10));
		return dto;
	}

	/**
	 * 프로젝트 업무를 가져오도록 하는 서비스
	 * @param seq 업무 번호
	 * @return 업무 문서
	 */
	public ProjectDetailViewDTO getProjectDetail(String seq) {
		ProjectDetailViewDTO dto = dao.getProjectDetail(seq);
		dto.setWork(dto.getWork().replaceAll("<", "&lt;").replaceAll("\r\n", "<br / >"));
		dto.setContent(dto.getContent().replaceAll("<", "&lt;").replaceAll("\r\n", "<br / >"));
		dto.setStartDate(dto.getStartDate().substring(0, 10));	//일자 일단위로 잘라내기
		dto.setEndDate(dto.getEndDate().substring(0, 10));
		return dto;
	}

	/**
	 * 현재 해당 부서에서 진행중인 모든 프로젝트와 종속된 단위 및 업무들을 가져오도록 하는 서비스
	 * @param departmentSeq 부서 번호
	 * @return 진행중인 모든 프로젝트와 종속 단위 및 업무
	 */
	public ArrayList<ProjectTotalDTO> getProjectTotal(String departmentSeq) {
		
		ArrayList<ProjectTotalDTO> tlist = dao.getProjectTotal(departmentSeq);
		
		for (ProjectTotalDTO dto : tlist) {
			//스크립트 제거 및 개행문자 변경
			dto.setSubject(dto.getSubject().replaceAll("<", "&lt;"));
			dto.setSubject(dto.getSubject().replaceAll("\r\n", " "));
			if (dto.getdContent() != null) {				
				dto.setdContent(dto.getdContent().replaceAll("<", "&lt;"));
				dto.setdContent(dto.getdContent().replaceAll("\r\n", " "));				
			}
			if (dto.getSubject().length() > 15) {
				dto.setSubject(dto.getSubject().substring(0, 15));
			}
			
			//!percentage 추가, 일자 잘라내기
			dto.setPercentage(dateCalc(dto.getStartDate(), dto.getEndDate()));
			dto.setStartDate(dto.getStartDate().substring(0, 10));
			dto.setEndDate(dto.getEndDate().substring(0, 10));
			//!colorSet 추가
			dto.setColorSet(colorCalc(dto.getTotalSeq()));
		}
		return tlist;
	}
	
	/**
	 * 차트 구현에 필요한 pStyle(Color design)값을 구하기 위해 계산
	 * @param totalSeq pId값
	 * @return pStyle값
	 */
	private String colorCalc(String totalSeq) {
		try {
			String color = "ggroupblack";	//프로젝트인 경우 디자인(default)
			int orgColor = Integer.parseInt(totalSeq);
			int calColor = orgColor % 5;
			
			if (orgColor > 10) {	//대상이 단위 업무
				color = "gtaskblue";
			}
			if (orgColor > 100) {	//대상이 작업 업무
				if (calColor == 1) {
					color = "gtaskred";
				} else if (calColor == 2) {
					color = "gtaskyellow";			
				} else if (calColor == 3) {
					color = "gtaskgreen";
				} else if (calColor == 4) {
					color = "gtaskpurple";
				} else if (calColor == 0) {
					color = "gtaskpink";
				}
			}
			return color;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectService.colorCalc ###");
			return null;
		}
	}

	/**
	 * 차트 구현에 필요한 pComp(Progress Percentage)값을 구하기 위해 시작과 끝의 진행상태를 계산 
	 * @param startDate 시작일
	 * @param endDate 종료일
	 * @return 시작일과 종료일에 현재 날짜를 계산한 진행상태 값(%)
	 */
	private String dateCalc(String startDate, String endDate) {
		try {
			
			SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
			String inputString1 = startDate;
			String inputString2 = endDate;
			int result = 0;
		
	    Date date1 = myFormat.parse(inputString1);
	    Date date2 = myFormat.parse(inputString2);
	    Date currDate = new Date();
	    
	    long difference1 = date2.getTime() - date1.getTime();
	    difference1 = TimeUnit.DAYS.convert(difference1, TimeUnit.MILLISECONDS);
	    long difference2 = currDate.getTime() - date1.getTime();
	    difference2 = TimeUnit.DAYS.convert(difference2, TimeUnit.MILLISECONDS);

	    float dif1 = difference1;
	    float dif2 = difference2;
	    System.out.println(dif1 + "/" + dif2);
	    if (dif1 == 0.0) {
	    	dif1 = (float) 1.0; 
	    }
	    if (dif2 == 0.0) {
	    	dif2 = (float) 1.0; 
	    }
	    if (dif2 <= 0) {
	    	result = 0;
	    } else if (dif2 > dif1) {
	    	result = 100;
	    } else {
	    	result = Math.round((100 / dif1) * dif2);	    	
	    }

			return result+"";
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectCheck.dateCalc ###");
			return null;
		}
	}
}
