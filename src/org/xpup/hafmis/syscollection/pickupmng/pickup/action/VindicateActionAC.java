/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package org.xpup.hafmis.syscollection.pickupmng.pickup.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 07-23-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class VindicateActionAC extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// ά����ȡ��Action���������ͨ����ȡ������Action
//    System.out.println("������ȡά����ForwardAction");
    request.getSession().removeAttribute(VindicateListShowAC.VINDICATE);
    request.getSession().removeAttribute("info");
    request.getSession().removeAttribute("orgList");
    return new ActionForward("/vindicateListShowAC.do");
	}
}