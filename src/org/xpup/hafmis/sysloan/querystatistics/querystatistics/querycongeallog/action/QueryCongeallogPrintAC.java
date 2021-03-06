/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package org.xpup.hafmis.sysloan.querystatistics.querystatistics.querycongeallog.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.xpup.common.util.BSUtils;
import org.xpup.common.util.Pagination;
import org.xpup.common.util.PaginationUtils;
import org.xpup.hafmis.orgstrct.dto.SecurityInfo;
import org.xpup.hafmis.syscollection.systemmaintain.loanpara.bsinterface.ILoanDocNumDesignBS;
import org.xpup.hafmis.sysloan.querystatistics.querystatistics.querycongeallog.bsinterface.IQueryCongeallogBS;

/** 
 * MyEclipse Struts
 * Creation date: 01-31-2008
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class QueryCongeallogPrintAC extends Action {
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
    
    try {
      Pagination pagination =(Pagination)request.getSession().getAttribute("pagination");
      PaginationUtils.updatePagination(pagination, request);
      SecurityInfo securityInfo = (SecurityInfo) request.getSession()
          .getAttribute("SecurityInfo");
      IQueryCongeallogBS queryCongeallogBS = (IQueryCongeallogBS) BSUtils
      .getBusinessService("queryCongeallogBS", this, mapping
          .getModuleConfig());
      List list=queryCongeallogBS.queryCongeallogAllList(pagination, securityInfo);
      //List list=(List)request.getSession().getAttribute("allList");

      //String bizDate=securityInfo.getUserInfo().getBizDate();
      String bizDate=securityInfo.getUserInfo().getPlbizDate();
      String user=securityInfo.getUserName();
      ILoanDocNumDesignBS loanDocNumDesignBS = (ILoanDocNumDesignBS) BSUtils
      .getBusinessService("loanDocNumDesignBS", this, mapping.getModuleConfig());
      String userName="";
      try {
        String name = loanDocNumDesignBS.getNamePara();

        if (name.equals("1")) {
          userName = securityInfo.getUserName();
        } else {
          userName = securityInfo.getRealName();
        }

      } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
      request.setAttribute("cellList", list);
      request.setAttribute("bizDate", bizDate);
      request.setAttribute("user", userName);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return mapping.findForward("queryCongeallog_cell");
  }
}