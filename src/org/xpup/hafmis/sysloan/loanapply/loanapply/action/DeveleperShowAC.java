/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package org.xpup.hafmis.sysloan.loanapply.loanapply.action;

import java.util.HashMap;

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
import org.xpup.hafmis.sysloan.loanapply.loanapply.bsinterface.ILoanapplyBS;
import org.xpup.hafmis.sysloan.loanapply.loanapply.form.DeveleperNewAF;

/**
 * MyEclipse Struts Creation date: 10-06-2007 XDoclet definition:
 * 
 * @struts.action validate="true"
 */
public class DeveleperShowAC extends Action {
  public static final String PAGINATION_KEY = "org.xpup.hafmis.sysloan.loanapply.loanapply.action.DeveleperShowAC";

  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {

    Pagination pagination = getPagination(PAGINATION_KEY, request);
    PaginationUtils.updatePagination(pagination, request);
    DeveleperNewAF develepernewAF = new DeveleperNewAF();

    String indexs = request.getParameter("indexs");
    String objInput = request.getParameter("objInput");
    if (indexs != null) {
      request.getSession().setAttribute("indexs", indexs);
    }
    if (objInput != null) {
      request.getSession().setAttribute("objInput", objInput);

    }
    
    String flag = request.getParameter("flag");
    // 如果是添加特殊申请则只能选特殊开发商
    ILoanapplyBS loanapplyBS = (ILoanapplyBS) BSUtils.getBusinessService(
        "loanapplyBS", this, mapping.getModuleConfig());
    try {
      SecurityInfo securityInfo = (SecurityInfo) request.getSession()
          .getAttribute("SecurityInfo");
      String fromFind = (String) request.getAttribute("fromFind");
      if(fromFind == null) {
        pagination.getQueryCriterions().put("developername", null);
      }
      develepernewAF = loanapplyBS.findDeveleperList(pagination, securityInfo,
          flag);
      request.setAttribute("develepernewAF", develepernewAF);
    } catch (Exception e) {
      e.printStackTrace();
    }

    return mapping.findForward("develeper_new");
  }

  private Pagination getPagination(String paginationKey,
      HttpServletRequest request) {
    Pagination pagination = (Pagination) request.getSession().getAttribute(
        paginationKey);
    if (pagination == null) {
      pagination = new Pagination(0, 10, 1, "p5.id", "DESC",
          new HashMap(0));
      request.getSession().setAttribute(paginationKey, pagination);
    }

    return pagination;
  }
}