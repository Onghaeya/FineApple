<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navbar-default sidebar" role="navigation">
   <div class="sidebar-nav navbar-collapse">
      <ul class="nav" id="side-menu">
         <li class="login-info">
            <div id="profile">
               <img src="/Project/company/images/user.jpg"
                  style="width: 50px; margin: 10px; float: left">
               <div style="float: left; margin-top: 15px;">
                  <c:if test="${seq!=null}">
                  <div>${name}</div>
                  <div>${department} ${position}</div>
            </c:if>
                <c:if test="${seq==null}">
                  <div style="padding-top:10%;">로그인 해주세요</div>
            </c:if>
               </div>
            </div>

         </li>
         <li style="clear: both;"></li>
         <!--  <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div> -->
         <!-- /input-group 
                        </li>-->


         <!-- 김한주 : 근태 -->
         <li><a href="javascript:void(0)"><span class="glyphicon glyphicon-check"></span>&nbsp;&nbsp;근태 관리<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">   
               <li><a href="/Project/attendance/taskManage.do"><span class="glyphicon glyphicon-pencil"></span>　근태 작성 </a>
               <li><a href="/Project/attendance/taskList.do"><span class="glyphicon glyphicon-list-alt"></span>　근태 조회 </a>
               <li><a href="/Project/attendance/statistics.do"><i class="fa fa-bar-chart-o"></i>　근태 관련 통계 </a></li>
               <li><a href="/Project/attendance/bbs.do"><i class="fa fa-quote-left fa-fw"></i>　근태 관련 자유게시판</a></li>
            </ul></li>   
         <!-- ./김한주 : 근태 -->
         

        <!-- 결재 게시판 메뉴 -->      
         <li><a href="javascript:void(0)"><i class="fa fa-list-alt fa-fw"></i>&nbsp;&nbsp;결재 관리<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">   
               <li><a href="/Project/approval/draft/draftAdd.do"><i class="fa fa-pencil fa-fw"></i>　기안서 </a></li>
               <li><a href="/Project/approval/chart/view.do"><i class="fa fa-bar-chart-o"></i>　결재 건수 통계 </a></li>
               <li><a href="/Project/approval/board/list.do"><i class="fa fa-quote-left fa-fw"></i>　결재 관련 자유게시판 </a>
            </ul></li>      
         <!-- 결재 게시판 끝 -->      
         
           <!--       장윤하 로그인 자유게시판 메뉴 시작    -->
             
         <li><a href="javascript:void(0)"><i class="fa fa-gg"></i>&nbsp;&nbsp;회원 관리<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">   
             <li><a href="/Project/company/pages/login/register.jsp"><i class="fa fa-registered"></i>　회원가입</a></li>
            <li><a href="/Project/company/pages/login.jsp"><i class="fa fa-sign-in"></i>　로그인 페이지</a></li>
               <li><a href="/Project/company/pages/login/board/add.do"><i class="fa fa-list-ul"></i>　로그인 자유게시판 </a>
            </ul></li>      
    <!--      로그인 자유게시판 끝     -->  
           
      <!-- 부서별 게시판은 이거 하나 -->
         <li><a href="/Project/company/pages/department/frontpage.do"><i class="fa fa-th-list"></i>&nbsp;&nbsp;부서별 게시판<span class="fa arrow"></span></a>
         </li>
      <!-- 끝 -->
      
              <!-----------------------현진 ----------------------->
         <li><a href="javascript:void(0)">
            <i class="fa fa-smile-o fa-fw"></i>&nbsp;&nbsp;직급별 게시판<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
               <li><a href="javascript:void(0)"><i class="fa fa-pencil-square-o fa-fw"></i>&nbsp;직원 게시판<span class="fa arrow"></a> <ul class="nav nav-third-level">
               <!-- fa arrow를 쓰면 화살표모양 넣을수있음.. -->
                     <li><a href="/Project/company/pages/position/board/list.do"><i class="fa fa-hand-o-right fa-fw"></i>&nbsp;임원 게시판</a></li>
                     <li><a href="/Project/company/pages/position/board/list.do"><i class="fa fa-hand-o-right fa-fw"></i>&nbsp;사원 게시판</a></li>
                  </ul></li>
               <li><a href="javascript:void(0)"><i class="fa fa-calendar fa-fw"></i>&nbsp;일정 게시판<i class="fa arrow"></i></a> <ul class="nav nav-third-level">
               <!-- fa arrow를 쓰면 화살표모양 넣을수있음.. -->
                      <li><a href="/Project/company/pages/position/scheduleMain.do"><i class="fa  fa-clock-o fa-fw"></i>&nbsp;일정 관리</a></li>
                     <li><a href="/Project/company/pages/position/schedule/chart/pscview.do"><i class="fa  fa-bar-chart-o fa-fw"></i>&nbsp;일정 통계</a></li>
                  </ul></li>
              
               
            </ul></li>
            
          <!----------------------- 해나 ----------------------->      
            
      <li><a href="javascript:void(0)"><i class="fa fa-child fa-fw"></i>&nbsp;&nbsp;전체게시판<span class="fa arrow"></span></a>
         <ul class="nav nav-second-level">
            <li><a href="/Project/all/contact/list.do"><i class="fa  fa-table fa-fw"></i>　주소록</a></li>
            <li><a href="/Project/all/survey/list.do"><i class="fa fa-check fa-fw"></i>　설문조사</a></li>
            <li><a href="/Project/all/freeboard/list.do"><i class="fa fa-calendar-o fa-fw"></i>　자유게시판</a></li>
         </ul>
      </li>   

          <!----------------- 태현 모임 ---------------------------->
                 <li><a href="javascript:void(0)"><i
               class="fa fa-group"></i>&nbsp;&nbsp;모임 게시판<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
               <li><a href="javascript:void(0)">단기모임모집 </a></li>
               <li><a href="/Project/club/clublist.do">정기모임 </a></li>
               <li><a href="javascript:void(0)">나의 소속 모임 <span
                     class="fa arrow"></span></a>
                  <ul class="nav nav-third-level">
                  <c:if test="${myclublist ne null }">
                      <c:forEach items="${myclublist}" var="dto">
                     <li><a href="/Project/club/myclubboard.do?clubseq=${dto.seq}">${dto.name}</a></li>
                     
                     </c:forEach>
                  </c:if>
                  </ul></li>

            </ul></li>
   <!-------------------- 태현 모임ㅁ끝 -------------------->

      </ul>
   </div>
   <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
