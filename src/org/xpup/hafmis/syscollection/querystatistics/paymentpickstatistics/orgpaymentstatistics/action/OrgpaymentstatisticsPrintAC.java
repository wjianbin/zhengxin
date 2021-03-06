package org.xpup.hafmis.syscollection.querystatistics.paymentpickstatistics.orgpaymentstatistics.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.xpup.common.util.Pagination;
import org.xpup.hafmis.syscollection.querystatistics.paymentpickstatistics.orgpaymentstatistics.form.OrgpaymentAF;
/**
 * 
 * @author �����
 *
 */
public class OrgpaymentstatisticsPrintAC extends Action{

  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
    // TODO Auto-generated method stub
    OrgpaymentAF orgpaymentAF = new OrgpaymentAF();
    Pagination pagination = (Pagination)request.getSession().getAttribute(OrgpaymentstatisticsShowAC.PAGINATION_KEY);
    orgpaymentAF.setOrgId(pagination.getQueryCriterions().get("orgId")+"");
    orgpaymentAF.setOrgName(pagination.getQueryCriterions().get("orgName")+"");
    orgpaymentAF.setPay_month(pagination.getQueryCriterions().get("payMonth")+"");
    request.setAttribute("orgpaymentAF", orgpaymentAF);
    return mapping.findForward("to_cell.jsp");
  }

}
