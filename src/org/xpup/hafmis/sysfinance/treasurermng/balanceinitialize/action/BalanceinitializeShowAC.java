/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package org.xpup.hafmis.sysfinance.treasurermng.balanceinitialize.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.xpup.common.util.BSUtils;
import org.xpup.hafmis.orgstrct.dto.OfficeDto;
import org.xpup.hafmis.orgstrct.dto.SecurityInfo;
import org.xpup.hafmis.sysfinance.treasurermng.balanceinitialize.bsinterface.IBalanceinitializeBS;
import org.xpup.hafmis.sysfinance.treasurermng.balanceinitialize.form.BalanceinitializeAF;

/** 
 * MyEclipse Struts
 * Creation date: 10-19-2007
 * Copy Right Information   : 余额初始
 * Project                  : 文件名
 * @Version                 : 1.0
 * @author                  : 张列
 * 生成日期                   : 10-19-2007
 * XDoclet definition:
 * @struts.action path="/balanceinitializeShowAC" name="balanceinitializeAF" scope="request" validate="true"
 */
public class BalanceinitializeShowAC extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//BalanceinitializeAF balanceinitializeAF = (BalanceinitializeAF) form;
    // TODO Auto-generated method stub
    
    List officeList1 = null;
    //办事处放进 officeList 集合里
    try {
      //权限
      SecurityInfo securityInfo = (SecurityInfo) request.getSession()
      .getAttribute("SecurityInfo");
      // 取出用户权限办事处,显示在下拉菜单中
      List officeList = securityInfo.getOfficeList();
      officeList1 = new ArrayList();
      OfficeDto officedto = null;
      Iterator itr1 = officeList.iterator();
      while (itr1.hasNext()) {
        officedto = (OfficeDto) itr1.next();
        officeList1.add(new org.apache.struts.util.LabelValueBean(officedto
            .getOfficeName(), officedto.getOfficeCode()));
      }
      request.setAttribute("officeList1", officeList1);
      
      IBalanceinitializeBS balanceinitializeBS = (IBalanceinitializeBS) BSUtils.getBusinessService(
          "balanceinitializeBS", this, mapping.getModuleConfig());
      
      //权限拿出BOOKID
      String bookId = securityInfo.getBookId();
      if(request.getParameter("status")==null){
        if(request.getAttribute("debitError")!=null){
          BalanceinitializeAF balanceinitializeAF = new BalanceinitializeAF();
          balanceinitializeAF.setOfficeName((String)request.getAttribute("officeName"));
          request.setAttribute("balanceinitializeAF", balanceinitializeAF);
          request.setAttribute("subjectInfos", request.getAttribute("balanceinitializeList"));
        }else if(request.getAttribute("result") != null){
          BalanceinitializeAF balanceinitializeAF = new BalanceinitializeAF();
          balanceinitializeAF.setOfficeName((String)request.getAttribute("officeName"));
          request.setAttribute("balanceinitializeBT", "2");
          request.setAttribute("balanceinitializeAF", balanceinitializeAF);
          request.setAttribute("subjectInfos", request.getAttribute("balanceinitializeList"));
        }else{
          BalanceinitializeAF balanceinitializeAF = new BalanceinitializeAF();
          request.setAttribute("balanceinitializeAF", balanceinitializeAF);
          request.setAttribute("subjectInfos", balanceinitializeBS.getSubjectCodeName(bookId,""));
        }
      }else{
        //获得OFFICE
        String officeName = request.getParameter("officecode");
        BalanceinitializeAF balanceinitializeAF = new BalanceinitializeAF();
        balanceinitializeAF.setOfficeName(officeName);
        //余额初始 同一办事处下的SUBJECT_CODE中存在相同的值 返回INT 大于1有相同的值
        int temp_bt = balanceinitializeBS.getBalanceinitializeBT(bookId, officeName);
        if(temp_bt >1){
          request.setAttribute("balanceinitializeBT", "2");
        }
        request.setAttribute("balanceinitializeAF", balanceinitializeAF);
        request.setAttribute("subjectInfos", balanceinitializeBS.getSubjectCodeName(bookId,officeName));
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
		return mapping.findForward("to_balanceinitialize_new");
	}
}