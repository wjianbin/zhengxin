package org.xpup.hafmis.sysloan.loanapply.giveacc.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class GiveAccForwardURLAC extends Action {
  public static final String PAGINATION_KEY = "org.xpup.hafmis.sysloan.loanapply.giveacc.action.HouseTbShowAC";

  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    request.setAttribute("type", "1");
    HttpSession session = request.getSession();
    session.setAttribute(PAGINATION_KEY, null);
    return mapping.findForward("to_giveacc_modify");
  }
}
