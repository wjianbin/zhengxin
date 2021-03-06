package org.xpup.hafmis.orgstrct.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.xpup.common.util.BSUtils;
import org.xpup.common.util.Pagination;
import org.xpup.common.util.PaginationUtils;
import org.xpup.hafmis.orgstrct.bizsrvc.IToSecurityMngBS;
import org.xpup.hafmis.orgstrct.form.BankAssignRoleAF;
import org.xpup.hafmis.orgstrct.form.OfficeAssignRoleAF;

public class BankAssignRoleShowAC extends Action {
  public static final String PAGINATION_KEY = "org.xpup.hafmis.orgstrct.action.BankAssignRoleShowAC";
  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
      try {
      Pagination pagination = getPagination(PAGINATION_KEY, request); 
      PaginationUtils.updatePagination(pagination, request);  
      IToSecurityMngBS toSecurityMngBS = (IToSecurityMngBS) BSUtils
          .getBusinessService("toSecurityMngBS", this, mapping.getModuleConfig());
      BankAssignRoleAF bankAssignRoleAF = new BankAssignRoleAF(); 
      bankAssignRoleAF= toSecurityMngBS.findRoleBank(pagination);
      request.setAttribute("roleBanklist", bankAssignRoleAF.getRoleBanklist());
      request.setAttribute("sparelist", bankAssignRoleAF.getSparelist());
      request.setAttribute("bankAssignRoleAF", bankAssignRoleAF);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return mapping.findForward("show_rolebank");
  }  
  private Pagination getPagination(String paginationKey,
      HttpServletRequest request) {
    Pagination pagination = (Pagination) request.getSession().getAttribute(
        paginationKey);
    if (pagination == null) {
      pagination = new Pagination();
      request.getSession().setAttribute(paginationKey, pagination);
    }   
 
    return pagination;
  }

}
