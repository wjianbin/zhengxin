<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/taglib/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/taglib/struts-logic.tld" prefix="logic"%>
<%@taglib uri="/WEB-INF/taglib/struts-nested.tld" prefix="nested"%>
<%@ taglib uri="/WEB-INF/taglib/xpup-security.tld" prefix="security"%>
<%@ include file="/checkUrl.jsp"%>

<%@ page
	import="org.xpup.hafmis.syscollection.chgbiz.chgslarybase.action.ChgslarybaseTaShowAC"%>

<%
			Object pagination = request.getSession(false).getAttribute(
			ChgslarybaseTaShowAC.PAGINATION_KEY);
	request.setAttribute("pagination", pagination);
	String picktypes = (String) request.getAttribute("statetype");
	String path = request.getContextPath();
%>
<html:html>
<head>
	<title>工资基数调整</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/index.css" type="text/css">
</head>
<script language="javascript"
	src="<%=request.getContextPath()%>/js/common.js">
<script language="javascript"></script>

<script language="javascript" type="text/javascript">
var s1="";
var s2="";
var s3="";
var s4="";
var s5="";
var s6="";
var s7="";
var s7="";
var s8="";
var s9="";
var s10="";
var picktypes="<%=picktypes%>";
function gotoEnter(){
	if(event.keyCode==13){
		event.keyCode=9;
		executeAjax();
	}
}
function reportErrors() {
	<logic:messagesPresent>
	var message = "<html:messages id="error"><bean:write name="error"/></html:messages>"
	alert(message);
	</logic:messagesPresent>
	var orgid=document.chgslarybaseListAF.elements["org.id"].value;
	if(orgid!=""){
		document.chgslarybaseListAF.elements["org.id"].value=format(document.chgslarybaseListAF.elements["org.id"].value)+document.chgslarybaseListAF.elements["org.id"].value;
	}
	var count=document.chgslarybaseListAF.listCount.value;
	
	var pdpb1=0;
    var pdpb2=0;
    
	for(i=0;i<document.all.length;i++){
		if(document.all.item(i).type=="submit"){
			if(document.all.item(i).value=="批量导出"){
				s1=i;
			}
			if(document.all.item(i).value=="批量导入"){
				s2=i;
			}
			if(document.all.item(i).value=="添加"){
				s3=i;
			}
			if(document.all.item(i).value=="修改"){
				s4=i;
			}
			if(document.all.item(i).value=="删除"){
				s5=i;
			}
			if(document.all.item(i).value=="全部删除"){
				s6=i;
			}
			if(document.all.item(i).value=="启用"){
				s7=i;
			}
		}
	}
	if(orgid==""){
		document.all.item(s1).disabled="true";
		document.all.item(s2).disabled="true";
		document.all.item(s3).disabled="true";
		document.all.item(s4).disabled="true";
		document.all.item(s5).disabled="true";
	    document.all.item(s6).disabled="true";
		document.all.item(s7).disabled="true";
		
	}else if(count==1){

		document.all.item(s1).disabled="true";
		document.all.item(s2).disabled="true";
		document.all.item(s3).disabled="";
		document.all.item(s4).disabled="";
		document.all.item(s5).disabled="";
	    document.all.item(s6).disabled="";
		document.all.item(s7).disabled="";
	}else{

		document.all.item(s1).disabled="";
		document.all.item(s2).disabled="";
	    document.all.item(s3).disabled="";
	    document.all.item(s4).disabled="true";
		document.all.item(s5).disabled="true";
	    document.all.item(s6).disabled="true";
		document.all.item(s7).disabled="true";
	}
	
}

function backErrors(errors){
   	alert(errors);
}

function toPop(status){
	gotoOrgpop(status,'<%=request.getContextPath()%>','0');
}
function executeAjax()
{
   	var orgid=document.chgslarybaseListAF.elements["org.sid"].value;
    if(orgid==""){
		gotoOrgpop(status,'<%=request.getContextPath()%>','0');
	   	return false;
	}
    var queryString = "chgslarybaseTaFindAAC.do?";  
    queryString = queryString + "org.id="+orgid;
    findInfo(queryString);
    showlist()   
}
  
  
function getEnter()
{
   	if(event.keyCode==13)
   	{
   		var orgid=document.chgslarybaseListAF.elements["org.sid"].value;
       	if(orgid==""){
			gotoOrgpop(status,'<%=request.getContextPath()%>','0');
		   	return false;
		}
    	var queryString = "chgslarybaseTaFindAAC.do?";  
    	queryString = queryString + "org.id="+orgid;
    	findInfo(queryString);
    	showlist()    
   }
}
function showlist() {
   	document.Form1.submit();
}
function remove() {
 	var x=confirm("是否确定删除该记录?");
		if(!x){
	   	return false;
   	}
}
function removeall() {
 	var x=confirm("是否确定全部删除该记录?");
	if(!x){
	   	return false;
   	}
}
function checkData() {
	var chgMonth=document.chgslarybaseListAF.elements["chgMonth"].value;
	document.all.chgMonth2.value=chgMonth;
 
	if(document.chgslarybaseListAF.elements["chgMonth"].value.trim()==""){
	   alert("录入调整年月!");
	   return false;
	}
	   var str=checkMonth("chgMonth");
    if(!str){
    	return false;
    }
	 var x=confirm("是否确定启用?");
	if(!x){	 
	   return false;
	}
}
function update(){
	var chgMonth=document.chgslarybaseListAF.elements["chgMonth"].value;
	document.all.chgMonth2.value=chgMonth;
 
	if(document.chgslarybaseListAF.elements["chgMonth"].value.trim()==""){
	   alert("录入调整年月!");
	   return false;
	}
	var str=checkMonth("chgMonth");
    if(!str){
    	return false;
    }
}
function exportArray(){
	update();
 	var orgId=document.chgslarybaseListAF.elements["org.id"].value;
 	var orgName=document.chgslarybaseListAF.elements["org.orgInfo.name"].value;
   	var chgMonth=document.chgslarybaseListAF.elements["chgMonth"].value;
	window.open ('<%=path%>/syscollection/chgbiz/chgslarybase/chgslarybaseexport_array.jsp?orgId='+ orgId +'&orgName='+orgName+'&chgMonth='+chgMonth,'newwindow','height=190,width=350,top='+(window.screen.availHeight-190)/2+',left='+(window.screen.availWidth-350)/2+',toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	//看来这个留着备用把，因为使用他确定后，会弹出一个页面，在这个页面里出现导出的对话框。
	//window.showModalDialog('<%=path%>/syscollection/chgbiz/chgpay/chgpayexport_array.jsp?orgId='+ orgId +'&orgName='+orgName+'&chgMonth='+chgMonth,'newwindow','height=800,width=800,top=800,left=800,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	return false;
}

</script>
<body bgcolor="#FFFFFF" text="#000000" onload="return reportErrors()"
	onContextmenu="return false">
	<jsp:include page="../../../inc/sort.jsp">
		<jsp:param name="url" value="chgslarybaseTaShowAC.do" />
	</jsp:include>

	<table width="95%" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="7">
							<img src="<%=request.getContextPath()%>/img/table_left.gif"
								width="7" height="37">
						</td>
						<td
							background="<%=request.getContextPath()%>/img/table_bg_line.gif"
							width="55">
							&nbsp;
						</td>
						<td width="235"
							background="<%=request.getContextPath()%>/img/table_bg_line.gif">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="112" height="37"
										background="<%=request.getContextPath()%>/img/buttonbl.gif"
										align="center" valign="top" style="PADDING-top: 7px">
										办理变更
									</td>
									<td width="112" height="37"
										background="<%=request.getContextPath()%>/img/buttong.gif"
										align="center" style="PADDING-top: 7px" valign="top">
										<a href=" chgslarybaseTbForwardURLAC.do" class=a2>变更维护</a>
									</td>
								</tr>
							</table>
						</td>
						<td
							background="<%=request.getContextPath()%>/img/table_bg_line.gif"
							align="right">
							<table width="300" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="37">
										<img src="<%=request.getContextPath()%>/img/title_banner.gif"
											width="37" height="24">
									</td>
									<td width="189" class=font14 bgcolor="#FFFFFF" align="center"
										valign="bottom">
										<font color="00B5DB">变更业务&gt;工资基数调整</font>
									</td>
									<td width="74" class=font14>
										&nbsp;
									</td>
								</tr>
							</table>
						</td>
						<td width="9">
							<img src="<%=request.getContextPath()%>/img/table_right.gif"
								width="9" height="37">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class=td3>
				<table width="95%" border="0" cellspacing="0" cellpadding="0"
					align="center">
					<tr>
						<td height="35">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="22" bgcolor="#CCCCCC" align="center" width="117">
										<b class="font14">单 位 信 息</b>
									</td>
									<td height="22"
										background="<%=request.getContextPath()%>/img/bg2.gif"
										align="center">
										&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<html:form action="/chgslarybaseTaShowAC.do">
					<logic:equal name="chgslarybaseListAF" property="type" value="0">
						<table border="0" width="95%" id="table1" cellspacing=1
							cellpadding=3 align="center">
							<tr>
								<td width="17%" class="td1">
									单位编号
								</td>

								<td colspan="2" styleClass="input3">
									<html:text name="chgslarybaseListAF" property="org.sid"
										styleClass="input3" readonly="true" styleId="txtsearch"></html:text>
									<html:hidden name="chgslarybaseListAF" property="org.id" />
								</td>
								<td class="td1" width="17%">
									单位名称
								</td>
								<td width="33%">
									<html:text name="chgslarybaseListAF"
										property="org.orgInfo.name" styleClass="input3"
										readonly="true" />
								</td>
							</tr>
							<tr>
								<td width="17%" class="td1">
									单位缴率
								</td>
								<td colspan="2" styleClass="input3">
									<html:text name="chgslarybaseListAF" property="org.orgRate"
										styleClass="input3" readonly="true" />
								</td>
								<td width="17%" class="td1">
									<font face="宋体">职工缴率</font>
								</td>
								<td width="33%" styleClass="input3">
									<html:text name="chgslarybaseListAF" property="org.empRate"
										styleClass="input3" readonly="true" />
								</td>
							</tr>
							<tr>
								<td width="17%" class="td1">
									调整年月
								</td>
								<td width="26%" colspan="2">
									<html:text name="chgslarybaseListAF" property="chgMonth"
										styleClass="input3" styleId="txtsearch"></html:text>
								</td>
								<td width="17%" class="td1"></td>
								<td width="26%" colspan="2">

								</td>
							</tr>
							<tr>
								<td>
									<html:hidden name="chgslarybaseListAF" property="listCount"
										styleClass="input3" styleId="txtsearch"></html:hidden>
								</td>
							</tr>
						</table>
					</logic:equal>
					<logic:equal name="chgslarybaseListAF" property="type" value="1">

						<table border="0" width="95%" id="table1" cellspacing=1
							cellpadding=3 align="center">
							<tr>
								<td width="17%" class="td1">
									单位编号
								</td>
								<td width="22%">
									<html:text name="chgslarybaseListAF" property="org.sid"
										styleClass="input3" onkeydown="getEnter()"
										ondblclick="executeAjax();" styleId="txtsearch"></html:text>
									<html:hidden name="chgslarybaseListAF" property="org.id" />
								</td>
								<td width="11%">
									<input type="button" name="Submit3222" value="..."
										class="buttona" onclick="toPop(2)">
								</td>

								<td class="td1" width="17%">
									单位名称
								</td>
								<td width="33%">
									<html:text name="chgslarybaseListAF"
										property="org.orgInfo.name" styleClass="input3"
										readonly="true" />
								</td>
							</tr>
							<tr>
								<td width="17%" class="td1">
									单位缴率
								</td>
								<td colspan="2" styleClass="input3">
									<html:text name="chgslarybaseListAF" property="org.orgRate"
										styleClass="input3" readonly="true" />
								</td>
								<td width="17%" class="td1">
									<font face="宋体">职工缴率</font>
								</td>
								<td width="33%" styleClass="input3">
									<html:text name="chgslarybaseListAF" property="org.empRate"
										styleClass="input3" readonly="true" />
								</td>
							</tr>
							<tr>
								<td width="17%" class="td1">
									调整年月
									<font color="#FF0000">*</font>
								</td>
								<td width="26%" colspan="2">
									<html:text name="chgslarybaseListAF" property="chgMonth"
										styleClass="input3" styleId="txtsearch"></html:text>

								</td>
								<td width="17%" class="td1"></td>
								<td width="26%" colspan="2">

								</td>
							</tr>
							<tr>
								<td>
									<html:hidden name="chgslarybaseListAF" property="listCount"
										styleClass="input3" styleId="txtsearch"></html:hidden>
								</td>

							</tr>
						</table>
					</logic:equal>
				</html:form>
				<table width="95%" border="0" cellspacing="0" cellpadding="0"
					align="center">
					<tr>
						<td class=h4>
							合计：
							<br>
							调整前:汇缴金额
							<u>：<bean:write name="chgslarybaseListAF" property="data_1" />
							</u>
							<br>
							调整后:汇缴金额
							<u>：<bean:write name="chgslarybaseListAF" property="data_2" />
							</u> 增加工资基数
							<u>：<bean:write name="chgslarybaseListAF" property="data_7" />
							</u> 增加缴存金额
							<u>：<bean:write name="chgslarybaseListAF" property="data_9" />
							</u> 减少工资基数
							<u>：<bean:write name="chgslarybaseListAF" property="data_6" />
							</u> 减少缴存金额
							<u>：<bean:write name="chgslarybaseListAF" property="data_8" />
							</u>
						</td>
					</tr>
				</table>
				<table width="95%" border="0" cellspacing="0" cellpadding="0"
					align="center">
					<tr>
						<td height="35">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="22" bgcolor="#CCCCCC" align="center" width="154">
										<b class="font14">工资基数调整列表</b>
									</td>
									<td width="750" height="22" align="center"
										background="<%=request.getContextPath()%>/img/bg2.gif">
										&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table width="95%" border="0" cellspacing="0" cellpadding="3"
					align="center">
					<tr bgcolor="1BA5FF">
						<td align="center" height="6" colspan="1">
						</td>
					</tr>
				</table>

				<html:form action="/chgslarybaseTaMaintainAC" style="margin: 0">
					<table width="95%" border="0" bgcolor="#76BEE9" cellspacing="1"
						cellpadding="3" align="center">
						<tr>
							<td align="center" height="23" bgcolor="C4F0FF">
								&nbsp;
							</td>
							<td align="center" class=td2>
								<a href="javascript:sort('chgPaymentTail.empId')">职工编号</a>
								<logic:equal name="pagination" property="orderBy"
									value="chgPaymentTail.empId">
									<logic:equal name="pagination" property="orderother"
										value="ASC">▲</logic:equal>
									<logic:equal name="pagination" property="orderother"
										value="DESC">▼</logic:equal>
								</logic:equal>
							</td>
							<td align="center" class=td2>
								职工姓名
							</td>
							<td align="center" class=td2>
								证件号码
							</td>
							<td align="center" class=td2>
								调整前工资基数
							</td>
							<td align="center" class=td2>
								调整前单位缴额
							</td>
							<td align="center" class=td2>
								调整前职工缴额
							</td>
							<td align="center" class=td2>
								调整前缴额合计
							</td>
							<td align="center" class=td2>
								调整后工资基数
							</td>
							<td align="center" class=td2>
								调整后单位缴额
							</td>
							<td align="center" class=td2>
								调整后职工缴额
							</td>
							<td align="center" class=td2>
								调整后缴额合计
							</td>
						</tr>
						<logic:notEmpty name="chgslarybaseListAF" property="list">
							<%
									int j = 0;
									String strClass = "";
							%>
							<logic:iterate name="chgslarybaseListAF" property="list"
								id="element" indexId="i">
								<%
											j++;
											if (j % 2 == 0) {
												strClass = "td8";
											} else {
												strClass = "td9";
											}
								%>
								<tr id="tr<%=i%>" onclick='gotoClickpp("<%=i%>",idAF);'
									onMouseOver='this.style.background="#eaeaea"'
									onMouseOut='gotoColorpp("<%=i%>",idAF);' class="<%=strClass%>">
									<td valign="top">
										<p align="left">
											<input id="s<%=i%>" type="radio" name="id"
												value="<bean:write name="element" property="id"/>"
												<%if(new Integer(0).equals(i)) out.print("checked"); %>>
										</p>
									</td>
									<td valign="top">
										<p>
											<bean:write name="element" property="empId" format="000000" />
										</p>
									</td>
									<td valign="top">
										<p>
											<bean:write name="element" property="emp.empInfo.name" />
										</p>
									</td>
									<td valign="top">
										<p>
											<bean:write name="element" property="emp.empInfo.cardNum" />
										</p>
									</td>
									<td valign="top">
										<p>
											<bean:write name="element" property="oldSalaryBase" />
										</p>
									</td>

									<td valign="top">
										<p>
											<bean:write name="element" property="oldOrgPay" />
										</p>
									</td>
									<td valign="top">
										<p>
											<bean:write name="element" property="oldEmpPay" />
										</p>
									</td>
									<td valign="top">
										<p>
											<bean:write name="element" property="oldOrgPayEmpPaySum" />
										</p>
									</td>


									<td valign="top">
										<p>
											<bean:write name="element" property="salaryBase" />
										</p>
									</td>
									<td valign="top">
										<p>
											<bean:write name="element" property="orgPay" />
										</p>
									</td>
									<td valign="top">
										<p>
											<bean:write name="element" property="empPay" />
										</p>
									</td>
									<td valign="top">
										<p>
											<bean:write name="element" property="oldPaySum" />
										</p>
									</td>
								</tr>
							</logic:iterate>
						</logic:notEmpty>
						<logic:empty name="chgslarybaseListAF" property="list">
							<tr>
								<td colspan="12" height="30" style="color:red">
									没有找到与条件相符合结果！
								</td>
							</tr>
							<tr>
								<td colspan="12"></td>
							</tr>
						</logic:empty>
						<tr>
							<td colspan="12"></td>
						</tr>
					</table>

					<table width="95%" border="0" cellspacing="0" cellpadding="3"
						align="center">
						<tr class="td1">
							<td>
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td align="left">
											共
											<bean:write name="pagination" property="nrOfElements" />
											项
										</td>
										<td align="right">
											<jsp:include page="/inc/pagination.jsp">
												<jsp:param name="url" value="chgslarybaseTaShowAC.do" />
											</jsp:include>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table width="95%" border="0" cellspacing="0" cellpadding="3"
						align="center">
						<tr>
							<td align="center" height="6" colspan="1">
								<input type="hidden" name="chgMonth2" value="">
								<input type="Hidden" name="PKID"
									value="<bean:write name="chgslarybaseListAF" property="id"/>">
								<input type="Hidden" name="org.id"
									value="<bean:write name="chgslarybaseListAF" property="org.id"/>">
								<input type="Hidden" name="nrOfElements"
									value="<bean:write name="pagination" property="nrOfElements"/>">
								<input type="Hidden" name="orgRate"
									value="<bean:write name="chgslarybaseListAF" property="org.orgRate"/>">
								<input type="Hidden" name="org.orgInfo.name"
									value="<bean:write name="chgslarybaseListAF" property="org.orgInfo.name"/>">
								<input type="Hidden" name="empRate"
									value="<bean:write name="chgslarybaseListAF" property="org.empRate"/>">
								<input type="Hidden" name="payPrecision"
									value="<bean:write name="chgslarybaseListAF" property="org.payPrecision"/>">
							</td>
						</tr>
					</table>

					<table width="95%" border="0" cellspacing="0" cellpadding="3"
						align="center">
						<tr valign="bottom">
							<td colspan="7" bgcolor="#FFFFFF" align="center" height="30">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<security:orghave>
											<security:orgcannot>
												<td>
													<html:submit property="method" styleClass="buttonc"
														onclick="return update();">
														<bean:message key="button.pickup.data" />
													</html:submit>
												</td>
											</security:orgcannot>
										</security:orghave>
										<td>
											<html:submit property="method" styleClass="buttona"
												onclick="return exportArray()">
												<bean:message key="button.exports" />
											</html:submit>
										</td>
										<td>
											<html:submit property="method" styleClass="buttona"
												onclick="return update()">
												<bean:message key="button.imports" />
											</html:submit>
										</td>
										<td>
											<html:submit property="method" styleClass="buttona"
												onclick="return update()">
												<bean:message key="button.add" />
											</html:submit>
										</td>
										<td>
											<html:submit property="method" styleClass="buttona"
												onclick="return update()">
												<bean:message key="button.update" />
											</html:submit>
										</td>
										<td>
											<html:submit property="method" styleClass="buttona"
												onclick="return remove()">
												<bean:message key="button.delete" />
											</html:submit>
										</td>
										<td>
											<html:submit property="method" styleClass="buttona"
												onclick="return removeall()">
												<bean:message key="button.deleteall" />
											</html:submit>
										</td>
										<td>
											<html:submit property="method" styleClass="buttona"
												onclick="return checkData()">
												<bean:message key="button.use" />
											</html:submit>
										</td>
										<security:orghave>
											<security:orgcan>
												<td>
													<html:submit property="method" styleClass="buttona"
														onclick="return referConfirm();" disabled="true">
														<bean:message key="button.referring.data" />
													</html:submit>
												</td>
											</security:orgcan>
										</security:orghave>
										<security:orghave>
											<security:orgcan>
												<td>
													<html:submit property="method" styleClass="buttonc"
														onclick="return pprovalConfirm();" disabled="true">
														<bean:message key="button.pproval.data" />
													</html:submit>
												</td>
											</security:orgcan>
										</security:orghave>
										<logic:empty name="chgslarybaseListAF" property="list">
											<td>
												<html:submit property="method" styleClass="buttona"
													disabled="true">
													<bean:message key="button.database.exports" />
												</html:submit>
											</td>
										</logic:empty>
										<logic:notEmpty name="chgslarybaseListAF" property="list">
											<td>
												<html:submit property="method" styleClass="buttona"
													onclick="return update()">
													<bean:message key="button.database.exports" />
												</html:submit>
											</td>
										</logic:notEmpty>
									</tr>
								</table>
							</td>
						</tr>

					</table>
				</html:form>
				<form action="chgslarybaseTaShowAC.do" method="POST" name="Form1"
					id="Form1">
				</form>
	</table>
</html:html>
