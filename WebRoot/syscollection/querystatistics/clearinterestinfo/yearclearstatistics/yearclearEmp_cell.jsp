<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List" %>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="logic" %>
<%@ page import="org.xpup.hafmis.syscollection.querystatistics.clearinterestinfo.yearclearstatistics.dto.*" %>
<%@ page import="org.xpup.hafmis.common.util.BusiTools" %>
<%@ include file="/checkUrl.jsp"%>
<%
   String path=request.getContextPath();
 %>
<html>
<head>
<script src="<%=path%>/js/common.js"></script>
</head>
<script type="text/javascript">
	function load(){	
	loginReg();
	document.forms(0).Cell1.openfile("<%=path%>/syscollection/querystatistics/clearinterestinfo/yearclearstatistics/report/yearclearEmp.cll","");

	var orgid;
	var orgname;
	var empid;
	var empname;
	var oldblance_cell;
	var interest_cell;
	var blance_cell;
	var preIntegral=[];
	var curIntegral=[];
	var preRate=[];
	var curRate=[];
	var preinterest=[];
	var curinterest=[];
	var i=0;
	<%
    		List list=(List) request.getSession().getAttribute("list");
    		String oldblance = (String)request.getSession().getAttribute("oldblance");
    		String interest = (String)request.getSession().getAttribute("interest");
    		String blance = (String)request.getSession().getAttribute("blance");

  			YearclearstatisticsHeadDTO dto=null;
  			for(int j=0;j<list.size();j++)
  			{
  				dto=(YearclearstatisticsHeadDTO)list.get(j);
  				String tempid = dto.getOrgcode().toString();
				String orgid = 	BusiTools.convertTenNumber(tempid);
 	%>	
				preIntegral[i]=<%=dto.getPreIntegral()%>;
				curIntegral[i]=<%=dto.getCurIntegral()%>;
				preRate[i]=<%=dto.getPreRate()%>;
				curRate[i]=<%=dto.getCurRate()%>;
				preinterest[i]=<%=dto.getPreinterest()%>;
				curinterest[i]=<%=dto.getCurinterest()%>;
				orgid="<%=orgid%>";
				orgname="<%=dto.getOrgname() %>"
				empid=format("<%=dto.getEmpcode()%>")+<%=dto.getEmpcode()%>;
				empname="<%=dto.getEmpname() %>"
				i++;
 	<%
 			}
 	%>
 		var totalLine=orgname.length;			//总的行数
		var totalPageLine=40;					//每页显示多少行
		var pageTotal=totalLine/totalPageLine;	//总共分几页
		var pageCurrent=0;						//当前页
		var completeline=0;						//记录行的
		
		oldblance_cell=<%=oldblance%>;
		interest_cell=<%=interest%>;
		blance_cell=<%=blance%>;
		
		for(k = 0 ; k < totalLine; k++){
			if(k%totalPageLine==0&&k>0)
			{
				document.forms(0).Cell1.ReDraw();
				pageCurrent++;	
				completeline=k-2;				
				document.forms(0).Cell1.insertSheetFromFile("<%=path%>/syscollection/querystatistics/clearinterestinfo/yearclearstatistics/report/yearclearEmp.cll",0,1,pageCurrent);
				document.forms(0).Cell1.setSheetLabel(pageCurrent,"第"+(pageCurrent+1)+"页")	
			}
			if(pageCurrent==0)
			{
					document.forms(0).Cell1.S(2,3,0,orgid);
					document.forms(0).Cell1.S(6,3,0,orgname);
					document.forms(0).Cell1.S(2,4,0,empid);
					document.forms(0).Cell1.S(6,4,0,empname);
					document.forms(0).Cell1.d(2,5,0,oldblance_cell);
					document.forms(0).Cell1.d(6,5,0,interest_cell);
					document.forms(0).Cell1.d(2,6,0,blance_cell);
					
				document.forms(0).Cell1.d(1,k+9,0,preIntegral[k]);
				document.forms(0).Cell1.d(2,k+9,0,curIntegral[k]);
				document.forms(0).Cell1.d(3,k+9,0,preRate[k]);
				document.forms(0).Cell1.d(4,k+9,0,curRate[k]);
				document.forms(0).Cell1.d(5,k+9,0,preinterest[k]);
				document.forms(0).Cell1.d(6,k+9,0,curinterest[k]);
				
			}else{//向第一页后的所有页插数据
					document.forms(0).Cell1.S(2,3,pageCurrent,orgid);
					document.forms(0).Cell1.S(6,3,pageCurrent,orgname);
					document.forms(0).Cell1.S(2,4,pageCurrent,empid);
					document.forms(0).Cell1.S(6,4,pageCurrent,empname);
					document.forms(0).Cell1.d(2,5,pageCurrent,oldblance_cell);
					document.forms(0).Cell1.d(6,5,pageCurrent,interest_cell);
					document.forms(0).Cell1.d(2,6,pageCurrent,blance_cell);
					
				document.forms(0).Cell1.d(1,k-completeline+7,pageCurrent,preIntegral[k]);
				document.forms(0).Cell1.d(2,k-completeline+7,pageCurrent,curIntegral[k]);
				document.forms(0).Cell1.d(3,k-completeline+7,pageCurrent,preRate[k]);
				document.forms(0).Cell1.d(4,k-completeline+7,pageCurrent,curRate[k]);
				document.forms(0).Cell1.d(5,k-completeline+7,pageCurrent,preinterest[k]);
				document.forms(0).Cell1.d(6,k-completeline+7,pageCurrent,curinterest[k]);
				
			}	
		}
		
				document.forms(0).Cell1.AllowExtend=false;
				document.forms(0).Cell1.AllowDragdrop=false;
				document.forms(0).Cell1.WorkbookReadonly=true;	

}
	function printsheet(){//真正的打印
		var k=document.forms(0).Cell1.GetCurSheet();//显示打印预览那个页面--固定
		document.forms(0).Cell1.PrintSheet(1,k);//固定...
	}
	function printPreview(){
		var k=document.forms(0).Cell1.GetCurSheet();//显示打印预览那个页面
		document.forms(0).Cell1.printPreviewEx(1,k,false);
	}
	function Button1_onclick()
	{
		document.forms(0).Cell1.SaveFile();
	}
	function Button2_onclick()
	{
		document.forms(0).Cell1.ExportPdfFile("d:\\aa",-1,1,1);
	}
	function Button3_onclick()
	{
		document.forms(0).Cell1.PrintPageSetup();
	}
	function Button4_onclick()
	{
		document.forms(0).Cell1.FindDialogEx( 0,"");
	}
		function Button5_onclick()
	{
		document.forms(0).Cell1.ImportExcelDlg();
	}
		
</script>
<script language="JScript.Encode">
eval(unescape('function%20LoginRegister%28%29//%u6CE8%u518CCELL%0D%0A%20%7B%20%0D%0A%20document.forms%280%29.Cell1.Login%28%22%u6C88%u9633%u91D1%u8F6F%u79D1%u6280%u6709%u9650%u516C%u53F8%22%2C%22%22%2C%2213100104509%22%2C%220740-1662-7775-3003%22%29%3B%20%20%20%20%0D%0A%20%7D'))
</script>
<body onload = "load();"  onContextmenu="return false"> 
<form action="">
<table align="center">
	<tr><OBJECT id=Cell1 style= "LEFT:0px;WIDTH:700px;  TOP:0px;HEIGHT:400px" codeBase="http://192.168.1.44:8088/hafmis/CellWeb5.CAB#version=5,3,7,321" classid=clsid:3F166327-8030-4881-8BD2-EA25350E574A VIEWASTEXT><PARAM NAME="_Version" VALUE="65536"><PARAM NAME="_ExtentX" VALUE="10266"><PARAM NAME="_ExtentY" VALUE="7011"><PARAM NAME="_StockProps" VALUE= "0"></OBJECT></tr> 
	<tr><input type="button" name="print" value = "打印预览" onclick = "printPreview();"/>
		<INPUT id="Button1" onclick="Button1_onclick()" type="button" value="另存为Excel" name="Button1">
		<INPUT id="Button1" onclick="Button2_onclick()" type="button" value="另存为pdf" name="Button1">
		<INPUT id="Button3" style="WIDTH: 100px" onclick="Button3_onclick()" type="button" value="页面设置">
		<INPUT id="Button3" style="WIDTH: 100px" onclick="Button4_onclick()" type="button" value="查找对话框">
		<INPUT id="Button3" style="WIDTH: 100px" onclick="Button5_onclick()" type="button" value="excel导入">
		<INPUT id="Button1" onclick="printsheet()" type="button" value=" 打印 " name="Button1">
		<INPUT id="Button3" onclick="javascript:history.back();" type="button" value=" 返回 ">	
	</tr>
</table>
</form>
</body>
</html>
