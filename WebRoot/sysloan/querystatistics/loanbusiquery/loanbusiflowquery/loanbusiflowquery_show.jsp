<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/taglib/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/taglib/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/struts-nested.tld" prefix="nested"%>
<%@ taglib uri="/WEB-INF/taglib/xpup-security.tld" prefix="security"%>
<%@ include file="/checkUrl.jsp"%>
<%@ page
	import="org.xpup.hafmis.sysloan.querystatistics.loanbusiquery.loanbusiflowquery.action.*"%>

<%
	String path = request.getContextPath();
	Object pagination = request.getSession(false).getAttribute(
			LoanBusiFlowQueryShowAC.PAGINATION_KEY);
	request.setAttribute("pagination", pagination);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<title>查询条件，业务流水信息列表</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link rel="stylesheet" href="<%=path%>/css/index.css" type="text/css">

</head>
<script language="javascript" src="<%=path%>/js/common.js"></script>

<script language="javascript" type="text/javascript">
/*---用来判断只输入一个日期YYYYMMDD---*/
function checkDate0(date)
{
   var tempDate1; 
   eval("tempDate1=document.all."+date);
   var strDate = tempDate1.value;
  if(strDate.length!=8)
  {
    alert("请输入八位的日期格式，例如20070101！");
    tempDate1.value="";
    tempDate1.focus();
    return false;
  }
  if(strDate.substring(0,4)<1900){
    alert("年份应该大于1900！");
    tempDate1.value="";
    tempDate1.focus();
    return false;
  }
  if(strDate.substring(4,6)>12 || strDate.substring(4,6)<1)
  {
    alert("月份应该在1-12月之间！");
    tempDate1.value="";
    tempDate1.focus();
    return false;
  }
  var tempStrDate=strDate.substring(6,8);
  var tempStrMonth=strDate.substring(4,6);
 if(tempStrMonth==2&&tempStrDate>29)
  {
    alert("日期不能大于29！");
    tempDate1.value="";
    tempDate1.focus();
    return false;
  }else if((tempStrMonth==1||tempStrMonth==3||tempStrMonth==5||tempStrMonth==7||tempStrMonth==8||tempStrMonth==10||tempStrMonth==12)&&tempStrDate>31){
    alert("日期不能大于31！");
    tempDate1.value="";
    tempDate1.focus();
    return false;
  }else if((tempStrMonth==2||tempStrMonth==4||tempStrMonth==6||tempStrMonth==9||tempStrMonth==11)&&tempStrDate>30){
    alert("日期不能大于30！");
    tempDate1.value="";
    tempDate1.focus();
    return false;
  }
  return true;
}

function checkDate1(){
  var date1 = document.forms[1].elements["beginBizDate"].value;
  var date2 = document.forms[1].elements["endBizDate"].value;
  //判断是否输入日期，如为空提示必须输入日期
  if((date1 == null || date1 == "") && (date2 == null || date2 == "")){
	alert("必须输入办理日期！");
    document.forms[1].elements["beginBizDate"].focus();
    return false;
   }
   if(date1 == null || date1 == ""){
	alert("请输入办理开始日期！");
    document.forms[1].elements["beginBizDate"].focus();
    return false;
   }
   if(date2 == null || date2 == ""){
	alert("请输入办理终止日期！");
    document.forms[1].elements["endBizDate"].focus();
    return false;
   }
  //起始日期不空
  if(date1 != "" ){
    var aa =checkDate0('beginBizDate');
    if(!aa){
    return false;
    }   
   }
  //终止日期不空
  if(date2 != "" ){
   var aa =checkDate0('endBizDate');
   if(!aa){
   return false;
   }   
  }  
}
 
function checkDate2(date1,date2){
   var tempDate1;
   var tempDate2;
   eval("tempDate1=document.all."+date1);
   eval("tempDate2=document.all."+date2);
   var strDate1 = tempDate1.value;
   var strDate2 = tempDate2.value;
   if(strDate1.length != 8)
   {
     alert("请输入八位的日期，格式为20070707！");
     tempDate1.value="";
     tempDate1.focus();
     return false;
   }
   if(strDate2.length != 8)
   {
     alert("请输入八位的日期，格式为20070707！");
     tempDate2.value="";
     tempDate2.focus();
     return false;
   }
    if(strDate1.substring(0,4)<1900)
   {
     alert("年份应该大于1900!");
     tempDate1.value="";
     tempDate1.focus();
     return false;
   }
   if(strDate2.substring(0,4)<1900)
   {
     alert("年份应该大于1900!");
     tempDate2.value="";
     tempDate2.focus();
     return false;
   }
   if(strDate1.substring(4,6)>12 || strDate1.substring(4,6)<1)
   {
     alert("月份应该在1-12月之间！");
     tempDate1.value="";
     tempDate1.focus();
     return false;
   }
   if(strDate2.substring(4,6)>12 || strDate2.substring(4,6)<1)
   {
     alert("月份应该在1-12月之间！");
     tempDate2.value="";
     tempDate2.focus();
     return false;
   }
   if((strDate1.substring(4,6)==01 || strDate1.substring(4,6)==03 ||
   strDate1.substring(4,6)==05 || strDate1.substring(4,6)==07 ||
   strDate1.substring(4,6)==08 || strDate1.substring(4,6)==10 ||
   strDate1.substring(4,6)==12)&&strDate1.substring(6,8)>31){
   alert("大月日期应该在1-31之间");
   tempDate1.value="";
   tempDate1.focus();
   return false;
   }
   if((strDate1.substring(4,6)==04 || 
   strDate1.substring(4,6)==06 || strDate1.substring(4,6)==09 || 
   strDate1.substring(4,6)==11)&&strDate1.substring(6,8)>30){
   alert("小月日期应该在1-30之间");
   tempDate1.value="";
   tempDate1.focus();
   return false;
   }
   if((strDate2.substring(4,6)==01 || strDate2.substring(4,6)==03 ||
   strDate2.substring(4,6)==05 || strDate2.substring(4,6)==07 ||
   strDate2.substring(4,6)==08 || strDate2.substring(4,6)==10 ||
   strDate2.substring(4,6)==12)&&strDate2.substring(6,8)>31){
   alert("大月日期应该在1-31之间");
   tempDate2.value="";
   tempDate2.focus();
   return false;
   }
   if((strDate2.substring(4,6)==04 || 
   strDate2.substring(4,6)==06 || strDate2.substring(4,6)==09 || 
   strDate2.substring(4,6)==11)&&strDate2.substring(6,8)>30){
   alert("小月日期应该在1-30之间");
   tempDate2.value="";
   tempDate2.focus();
   return false;
   }
   if(strDate1.substring(4,6)==02 && strDate1.substring(6,8)>29){
   alert("二月份日期应该在1-29之间");
   tempDate1.value="";
   tempDate1.focus();
   return false;
   }
   if((strDate2.substring(4,6)==02)&&strDate2.substring(6,8)>29){
   alert("二月份日期应该在1-29之间");
   tempDate2.value="";
   tempDate2.focus();
   return false;
   }
   if(strDate1>strDate2)
   {
    alert("起始日期应该不大于终止日期!");
    return false;
   }
   return true;
}

function gettr2(trindex) {
  tr=trindex;
  sureType();
}

function loads(){
	<logic:messagesPresent>
	var message = "<html:messages id="error"><bean:write name="error"/></html:messages>"
	alert(message);
	</logic:messagesPresent>
}

function sureType(){
    var bizType=document.getElementById(tr).childNodes[5].childNodes[0].innerHTML.trim();
    var id  = document.getElementById(tr).childNodes[17].innerHTML.trim();//PL203.FLOW_HEAD_ID
  	if(bizType=="批量回收" || bizType=="单笔回收" || bizType=="部分提前还款" || bizType=="一次性还清"){      	
     var contractId=document.getElementById(tr).childNodes[3].childNodes[0].innerHTML.trim();
     var originalitybizType=document.getElementById(tr).childNodes[16].innerHTML.trim();
     window.open('<%=path%>/sysloan/loancallbackTbForwardURLWindowAC.do?contractId='+contractId+'&headId='+id+'&type='+originalitybizType,'','width=700,height=450,top='+(window.screen.availHeight-450)/2+',left='+(window.screen.availWidth-700)/2+',scrollbars=yes');     
 	}
 	if(bizType=="发放"){  	
     window.open('<%=path%>/sysloan/loanaccordFindAC.do?id='+id,'','width=700,height=450,top='+(window.screen.availHeight-450)/2+',left='+(window.screen.availWidth-700)/2+',scrollbars=yes');     
 	}
 	if(bizType == "挂账"){ 	     	
     window.open('<%=path%>/sysloan/overPayFindAC.do?id='+id,'','width=700,height=450,top='+(window.screen.availHeight-450)/2+',left='+(window.screen.availWidth-700)/2+',scrollbars=yes');     
 	}
 	if(bizType == "保证金"){ 	     	
     window.open('<%=path%>/sysloan/bailFindAC.do?id='+id,'','width=700,height=450,top='+(window.screen.availHeight-450)/2+',left='+(window.screen.availWidth-700)/2+',scrollbars=yes');     
 	}
 	if(bizType == "错账调整"){ 	     	
     window.open('<%=path%>/sysloan/adjustAccountFindAC.do?id='+id,'','width=700,height=450,top='+(window.screen.availHeight-450)/2+',left='+(window.screen.availWidth-700)/2+',scrollbars=yes');     
 	}
 	if(bizType == "结转余额"){ 	     	
     window.open('<%=path%>/sysloan/loanBusiFlowQueryClearForwardURLWindowAC.do?flowHeadId='+id,'','width=700,height=450,top='+(window.screen.availHeight-450)/2+',left='+(window.screen.availWidth-700)/2+',scrollbars=yes');     
 	}
 	if(bizType == "结息"){
     window.open('<%=path%>/sysloan/loanBusiFlowQueryBailClearForwardURLWindowAC.do?flowHeadId='+id,'','width=700,height=450,top='+(window.screen.availHeight-450)/2+',left='+(window.screen.availWidth-700)/2+',scrollbars=yes');     
 	} 
 	if(bizType =="核销收回（中心）"||bizType =="核销收回（其他）")
 	{
 	 window.open('<%=path%>/sysloan/destoryBackTbWindowAC.do?id='+id,'','width=700,height=450,top='+(window.screen.availHeight-450)/2+',left='+(window.screen.availWidth-700)/2+',scrollbars=yes');
 	}
 	if(bizType =="呆账核销（中心）"||bizType =="呆账核销（其他）")
 	{
     var contractId=document.getElementById(tr).childNodes[3].childNodes[0].innerHTML.trim();
 	 window.open('<%=path%>/sysloan/badDebtDestroyTbForwardURLWindowAC.do?contractId='+contractId+'&headId='+id,'','width=700,height=450,top='+(window.screen.availHeight-450)/2+',left='+(window.screen.availWidth-700)/2+',scrollbars=yes,location=no, status=no');
 	}
 }

</script>
<body bgcolor="#FFFFFF" text="#000000" onclick="loads();"
	onContextmenu="return false">
	<jsp:include page="../../../../inc/sort.jsp">
		<jsp:param name="url" value="loanBusiFlowQueryShowAC.do" />
	</jsp:include>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="3%" align="right" valign="middle">
				<table width="21" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="112" align="center"></td>
					</tr>
					<tr>
						<td height="112" align="center"></td>
					</tr>
					<tr>
						<td height="112" align="center"></td>
					</tr>
					<tr>
						<td height="112" align="center"></td>
					</tr>
				</table>
			</td>
			<td width="97%" align="left" valign="top">
				<table width="98%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="7">
							<img src="<%=path%>/img/table_left.gif" width="7" height="37">
						</td>
						<td background="<%=path%>/img/table_bg_line.gif" width="10">
							&nbsp;
						</td>
						<td width="695" background="<%=path%>/img/table_bg_line.gif">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="112" height="37" align="center" valign="top"
										style="PADDING-top: 7px"></td>
									<td width="112" height="37" align="center"
										style="PADDING-top: 7px" valign="top"></td>
									<td width="112" height="37" align="center"
										style="PADDING-top: 7px" valign="top"></td>
									<td width="112" height="37" align="center"
										style="PADDING-top: 7px" valign="top"></td>
									<td width="112" height="37" align="center"
										style="PADDING-top: 7px" valign="top"></td>
								</tr>
							</table>

						</td>
						<td width="300">
							<table width="300" border="0" cellspacing="0" cellpadding="0"
								align="right">
								<tr>
									<td width="56">
										<img src="<%=path%>/img/title_banner.gif" width="37"
											height="24" align="right">
									</td>
									<td class=font14 bgcolor="#FFFFFF" align="center"
										valign="bottom">
										<font color="00B5DB">贷款业务查询&gt;贷款业务流水查询</font>
									</td>
									<td class=font14>
										&nbsp;
									</td>
								</tr>
							</table>
						</td>
						<td width="18">
							<img src="<%=path%>/img/table_bg_line.gif" width="18" height="37">
						</td>
						<td width="9">
							<img src="<%=path%>/img/table_right.gif" width="9" height="37">
						</td>
					</tr>
				</table>
				<table width="98%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="top" class=td3>
							<table width="95%" border="0" cellspacing="0" cellpadding="0"
								align="center">
								<tr>
									<td height="35">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="22" bgcolor="#CCCCCC" align="center" width="207">
													<b class="font14">查 询 条 件</b>
												</td>
												<td width="716" height="22" align="center"
													background="<%=path%>/img/bg2.gif">
													&nbsp;
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<html:form action="/loanBusiFlowQueryFindAC" style="margin: 0">
								<table border="0" width="95%" id="table1" cellspacing=1
									cellpadding=0 align="center">
									<tr>
										<td width="17%" class="td1">
											凭证编号
										</td>
										<td width="33%" colspan="3">
											<html:text name="loanBusiFlowQueryAF" property="docNum"
												styleClass="input3" onkeydown="enterNextFocus1();" />
										</td>
										<td width="17%" class="td1">
											合同编号
										</td>
										<td width="33%">
											<html:text name="loanBusiFlowQueryAF" property="contractId"
												styleClass="input3" onkeydown="enterNextFocus1();" />
										</td>
									</tr>
									<tr>
										<td width="17%" class="td1">
											扣款账号
										</td>
										<td width="33%" align="center" colspan="3">
											<html:text name="loanBusiFlowQueryAF" property="loanKouAcc"
												styleClass="input3" onkeydown="enterNextFocus1();" />
										</td>
										<td width="17%" class="td1">
											借款人姓名
										</td>
										<td align="center">
											<html:text name="loanBusiFlowQueryAF" property="borrowerName"
												styleClass="input3" onkeydown="enterNextFocus1();" />
										</td>
									</tr>
									<tr>
										<td width="17%" class="td1">
											业务类型
										</td>
										<td width="33%" align="center" colspan="3">
											<html:select name="loanBusiFlowQueryAF" property="bizType"
												styleClass="input3" onkeydown="enterNextFocus1();">
												<html:option value=""></html:option>
												<html:optionsCollection property="bizTypeMap"
													name="loanBusiFlowQueryAF" label="value" value="key" />
											</html:select>
										</td>
										<td width="17%" class="td1">
											制单人
										</td>
										<td align="center">

											<html:select name="loanBusiFlowQueryAF" property="makePerson"
												styleClass="input3" onkeydown="enterNextFocus1();">
												<html:option value=""></html:option>
												<html:options collection="operList" property="value"
													labelProperty="label" />
											</html:select>
										</td>
									</tr>
									<tr>
										<td width="17%" class="td1">
											业务状态
										</td>
										<td width="33%" align="center" colspan="3">
											<html:select name="loanBusiFlowQueryAF" property="bizSt"
												styleClass="input3" onkeydown="enterNextFocus1();">
												<html:option value=""></html:option>
												<html:optionsCollection property="bizStMap"
													name="loanBusiFlowQueryAF" label="value" value="key" />
											</html:select>
										</td>
										<td width="17%" class="td1">
											放款银行
										</td>
										<td align="center">
											<html:select name="loanBusiFlowQueryAF"
												property="loanBankName" styleClass="input3"
												onkeydown="enterNextFocus1();">
												<html:option value=""></html:option>
												<html:options collection="loanBankNameList" property="value"
													labelProperty="label" />
											</html:select>
										</td>
									</tr>
									<tr>
										<td width="17%" class="td1">
											办理日期
											<font color="#FF0000">*</font>
										</td>
										<td width="15%">
											<html:text name="loanBusiFlowQueryAF" property="beginBizDate"
												styleClass="input3" onkeydown="enterNextFocus1();" />
										</td>
										<td width="1%">
											至
										</td>
										<td width="14%">
											<html:text name="loanBusiFlowQueryAF" property="endBizDate"
												styleClass="input3" onkeydown="enterNextFocus1();" />
										</td>
										<td width="17%" class="td1">
											公积金还贷
										</td>
										<td width="33%" align="center" colspan="3">
											<html:select name="loanBusiFlowQueryAF"
												property="isGjjLoanback" styleClass="input3"
												onkeydown="enterNextFocus1();">
												<html:option value=""></html:option>
												<html:optionsCollection property="isGjjLoanbackMap"
													name="loanBusiFlowQueryAF" label="value" value="key" />
											</html:select>
										</td>
									</tr>
								</table>

								<table width="95%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td align="right">
											<html:submit property="method" styleClass="buttona"
												onclick="return checkDate1();">
												<bean:message key="button.search" />
											</html:submit>
										</td>
									</tr>
								</table>
								<table width="95%" border="0" cellspacing="0" cellpadding="0"
									align="center">
									<tr>
										<td class=h4>
											合计：发放金额
											<u>：<bean:write name="loanBusiFlowQueryAF"
													property="occurMoneyTotle" /> </u> 实还本金
											<u>：<bean:write name="loanBusiFlowQueryAF"
													property="reclaimCorpusTotle" /> </u> 实还利息
											<u>：<bean:write name="loanBusiFlowQueryAF"
													property="reclaimAccrualTotle" /> </u> 实还逾期利息
											<u>：<bean:write name="loanBusiFlowQueryAF"
													property="realPunishInterestTotle" /> </u> 实还总额
											<u>：<bean:write name="loanBusiFlowQueryAF"
													property="reclaimTotle" /> </u> 挂账金额
											<u>：<bean:write name="loanBusiFlowQueryAF"
													property="putUpMoneyTotle" /> </u>
										</td>
									</tr>
								</table>
							</html:form>
							<table width="95%" border="0" cellspacing="0" cellpadding="0"
								align="center">
								<tr>
									<td height="35">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="22" bgcolor="#CCCCCC" align="center" width="213">
													<b class="font14">业务流水信息列表</b>
												</td>
												<td width="710" height="22" align="center"
													background="<%=path%>/img/bg2.gif">
													&nbsp;
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<html:form action="/loanBusiFlowQueryMaintainAC"
								style="margin: 0">
								<table width="95%" border="0" cellspacing="0" cellpadding="3"
									align="center">
									<tr bgcolor="1BA5FF">
										<td align="center" height="6" colspan="1"></td>
									</tr>
								</table>
								<table width="95%" border="0" bgcolor="#76BEE9" cellspacing="1"
									cellpadding="3" align="center">
									<tr align="center" bgcolor="C4F0FF">
										<td height="23" bgcolor="C4F0FF">
											&nbsp;
										</td>

										<td align="center" class=td2>
											凭证编号
										</td>

										<td align="center" class=td2>
											<a href="javascript:sort('loankouacc')">扣款账号</a>
											<logic:equal name="pagination" property="orderBy"
												value="loankouacc">
												<logic:equal name="pagination" property="orderother"
													value="ASC">▲</logic:equal>
												<logic:equal name="pagination" property="orderother"
													value="DESC">▼</logic:equal>
											</logic:equal>
										</td>
										<td align="center" class=td2>
											<a href="javascript:sort('contractId')">合同编号</a>
											<logic:equal name="pagination" property="orderBy"
												value="contractId">
												<logic:equal name="pagination" property="orderother"
													value="ASC">▲</logic:equal>
												<logic:equal name="pagination" property="orderother"
													value="DESC">▼</logic:equal>
											</logic:equal>
										</td>
										<td align="center" class=td2>
											<a href="javascript:sort('borrowername')">借款人姓名</a>
											<logic:equal name="pagination" property="orderBy"
												value="borrowername">
												<logic:equal name="pagination" property="orderother"
													value="ASC">▲</logic:equal>
												<logic:equal name="pagination" property="orderother"
													value="DESC">▼</logic:equal>
											</logic:equal>
										</td>

										<td align="center" class=td2>
											<a href="javascript:sort('bizType')">业务类型</a>
											<logic:equal name="pagination" property="orderBy"
												value="bizType">
												<logic:equal name="pagination" property="orderother"
													value="ASC">▲</logic:equal>
												<logic:equal name="pagination" property="orderother"
													value="DESC">▼</logic:equal>
											</logic:equal>
										</td>

										<td align="center" class=td2>
											发放金额
										</td>
										<td align="center" class=td2>
											实还本金
										</td>
										<td align="center" class=td2>
											实还利息
										</td>
										<td align="center" class=td2>
											实还逾期利息
										</td>
										<td align="center" class=td2>
											实还总额
										</td>
										<td align="center" class=td2>
											挂账金额
										</td>
										<td align="center" class=td2>
											是否为公积金还贷
										</td>
										<td align="center" class=td2>
											<a href="javascript:sort('bizDate')">办理日期</a>
											<logic:equal name="pagination" property="orderBy"
												value="bizDate">
												<logic:equal name="pagination" property="orderother"
													value="ASC">▲</logic:equal>
												<logic:equal name="pagination" property="orderother"
													value="DESC">▼</logic:equal>
											</logic:equal>
										</td>
										<td align="center" class=td2>
											业务状态
										</td>
										<td align="center" class=td2>
											制单人
										</td>
									</tr>
									<logic:notEmpty name="loanBusiFlowQueryAF" property="list">
										<%
												int j = 0;
												String strClass = "";
										%>
										<logic:iterate name="loanBusiFlowQueryAF" property="list"
											id="element" indexId="i">
											<%
														j++;
														if (j % 2 == 0) {
															strClass = "td8";
														} else {
															strClass = "td9";
														}
											%>
											<tr align="left" id="tr<%=i%>"
												onclick='gotoClickpp("<%=i%>", idAF);'
												onMouseOver='this.style.background="#eaeaea"'
												onMouseOut='gotoColorpp("<%=i%>", idAF);'
												class="<%=strClass%>" onDblClick="">
												<td valign="top">
													<p align="left">
														<input id="s<%=i%>" type="radio" name="id"
															value="<bean:write name="element" property="flowHeadId"/>"
															<%if(new Integer(0).equals(i)) out.print("checked"); %>>
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="docNum" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="loanKouAcc" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="contractId" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="borrowerName" />
													</p>
												</td>
												<td>
													<a href="#" onClick="gettr2('tr<%=i%>');" /><bean:write
															name="element" property="bizType" /> </a>
												</td>
												<td>
													<p>
														<bean:write name="element" property="occurMoney" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="reclaimCorpus" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="reclaimAccrual" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="realPunishInterest" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="reclaim" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="putUpMoney" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="isGjjLoanBack" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="bizDate" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="bizSt" />
													</p>
												</td>
												<td>
													<p>
														<bean:write name="element" property="makePerson" />
													</p>
												</td>
												<td style="display:none">
													<bean:write name="element" property="originalitybizType" />
												</td>
												<td style="display:none">
													<bean:write name="element" property="flowHeadId" />
												</td>
											</tr>

										</logic:iterate>
									</logic:notEmpty>
									<logic:empty name="loanBusiFlowQueryAF" property="list">
										<tr>
											<td colspan="9" height="30" style="color:red">
												没有找到与条件相符合的结果！
											</td>
										</tr>

									</logic:empty>
								</table>
								<table width="95%" border="0" cellspacing="0" cellpadding="3"
									align="center">
									<tr class="td1">
										<td align="center">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr align="center">
													<td align="left">
														共
														<bean:write name="pagination" property="nrOfElements" />
														项
													</td>
													<td align="right">
														<jsp:include page="../../../../inc/pagination.jsp">
															<jsp:param name="url" value="loanBusiFlowQueryShowAC.do" />
														</jsp:include>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
								<table width="95%" border="0" cellspacing="0" cellpadding="3"
									align="center">
									<tr valign="bottom">
										<td colspan="7" bgcolor="#FFFFFF" align="center" height="30">
											<logic:notEmpty name="loanBusiFlowQueryAF" property="list">
												<table border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td>
															<html:submit property="method" styleClass="buttona">
																<bean:message key="button.print" />
															</html:submit>
														</td>
													</tr>
												</table>
											</logic:notEmpty>
											<logic:empty name="loanBusiFlowQueryAF" property="list">
												<table border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td>
															<html:submit property="method" styleClass="buttona"
																disabled="true">
																<bean:message key="button.print" />
															</html:submit>
														</td>
													</tr>
												</table>
											</logic:empty>
										</td>
									</tr>
								</table>
							</html:form>
							<form action="loanBusiFlowQueryShowAC.do" name="Form1"></form>
				</table>
</body>
</html:html>

