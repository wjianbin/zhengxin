package org.xpup.hafmis.orgstrct.bizsrvc;

import java.util.List;

import org.xpup.common.exception.BusinessException;
import org.xpup.common.util.Pagination;
import org.xpup.hafmis.orgstrct.domain.CollBank;
import org.xpup.hafmis.orgstrct.dto.SecurityInfo;
import org.xpup.hafmis.orgstrct.form.BankAssignRoleAF;
import org.xpup.hafmis.orgstrct.form.BankAssignUserAF;
import org.xpup.hafmis.orgstrct.form.CollBankTaAF;
import org.xpup.hafmis.orgstrct.form.OfficeAssignRoleAF;
import org.xpup.hafmis.orgstrct.form.OfficeAssignUserAF;
import org.xpup.hafmis.orgstrct.form.RoleToSecurityAF;
import org.xpup.hafmis.orgstrct.form.UserAssignBookAF;
import org.xpup.hafmis.orgstrct.form.UserAssignUsersAF;
import org.xpup.hafmis.orgstrct.form.UserToSecurityAF;

public interface IToSecurityMngBS{
  public int findBank(String code);
  public void setNull(String id) throws Exception;
  public List  findUsersList()throws Exception;
  public List  findUser(Pagination pagination)throws Exception;
  public List findOffice(String username)throws Exception;
  public UserToSecurityAF findTree(Pagination pagination,SecurityInfo securityInfo)throws Exception;
//  public Integer findBankCountsByofficecode(String username,String officecode);
//  public Integer findOrgCountsByBankid(String username,String officecode,String bankid);
  public void deleteUserOrg(String username,String [] orgid)throws BusinessException;
  public void addUserOrg(String username,String [] orgid)throws BusinessException;
  public void addAllUserOrg(Pagination pagination,SecurityInfo securityInfo)throws BusinessException;
  public void deleteAllUserOrg(String username)throws BusinessException;
  public void addUserOffice(String username,String office)throws BusinessException;
  public void addUserBank(String username,String collBankId)throws BusinessException;
  public RoleToSecurityAF findRoleTree(Pagination pagination)throws Exception;
  public void addRoleOrg(String roleid,String [] orgid)throws BusinessException;
  public void addAllRoleOrg(Pagination pagination)throws BusinessException;
  public void deleteRoleOrg(String roleid,String [] orgid)throws BusinessException;
  public void deleteAllRoleOrg(String roleid)throws BusinessException;
  public void addRoleOffice(String roleid,String office)throws BusinessException;
  public void addRoleBank(String roleid,String collbankid)throws BusinessException;
  public OfficeAssignRoleAF findRoleOffice(Pagination pagination)throws BusinessException;
  public void addRoleOffice(String roleid,String officeid[])throws BusinessException;
  public void addAllRoleOffice(String roleid)throws BusinessException;
  public void deleteRoleOffice(String roleid,String officeid[])throws BusinessException;
  public void deleteAllRoleOffice(String roleid)throws BusinessException;
  public BankAssignRoleAF findRoleBank(Pagination pagination);
  public void addRoleBank(String roleid,String bankid[])throws BusinessException;
  public void addAllRoleBank(Pagination pagination)throws BusinessException;
  public void deleteRoleBank(String roleid,String bankid[])throws BusinessException;
  public void deleteAllRoleBank(String roleid)throws BusinessException;
  public void addRoleAssignOffice(String roleid,String office)throws BusinessException;
  public OfficeAssignUserAF findUserOffice(Pagination pagination,SecurityInfo securityInfo)throws BusinessException;
  public void addUserOffice(String username,String officeid[])throws BusinessException;
  public void addAllUserOffice(String username,SecurityInfo securityInfo)throws BusinessException;
  public void deleteUserOffice(String username,String officeid[])throws BusinessException;
  public void deleteAllUserOffice(String username)throws BusinessException;
  public BankAssignUserAF findUserBank(Pagination pagination,SecurityInfo securityInfo);
  public void addUserBank(String username,String bankid[])throws BusinessException;
  public void addAllUserBank(Pagination pagination,SecurityInfo securityInfo)throws BusinessException;
  public void deleteUserBank(String username,String bankid[])throws BusinessException;
  public void deleteAllUserBank(String username)throws BusinessException;
  public void addUserAssignOffice(String username,String office)throws BusinessException;
  public UserAssignUsersAF findUserUsers(Pagination pagination,SecurityInfo securityInfo)throws BusinessException;
  public void addUserUsers(String username,String subusername[])throws BusinessException;
  public void addAllUserUsers(String username,SecurityInfo securityInfo)throws BusinessException;
  public void deleteUserUser(String username,String subusername[])throws BusinessException;
  public void deleteAllUserUser(String username)throws BusinessException;
  public CollBankTaAF findBankListByUser(Pagination pagination,SecurityInfo securityInfo)throws Exception;
  public List findOffice(SecurityInfo securityInfo);
  public void addCollBankInfo(String office,String collBankName,SecurityInfo securityInfo,String collectionbankacc,String contactprsn,String contacttel,String centername)throws BusinessException;
  public CollBank findCollBank(String collBankid);
  public void editCollBank(CollBankTaAF collBankTaAF,SecurityInfo securityInfo)throws BusinessException;
  public void cancelCollBank(String collBankid,SecurityInfo securityInfo);
  public void delCancelCollBank(String collBankid,SecurityInfo securityInfo);
  public UserAssignBookAF findBookUsers(Pagination pagination,SecurityInfo securityInfo)throws BusinessException;
  public void addUserBook(String username,String[] bookId)throws BusinessException;
  public void addAllUserBook(String username,SecurityInfo securityInfo)throws BusinessException;
  public void deleteUserBook(String username,String bookid[])throws BusinessException;
  public void deleteAllUserBook(String username,SecurityInfo securityInfo)throws BusinessException;
}