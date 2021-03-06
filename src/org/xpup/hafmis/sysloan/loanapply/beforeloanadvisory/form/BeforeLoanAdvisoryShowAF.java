package org.xpup.hafmis.sysloan.loanapply.beforeloanadvisory.form;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts.action.ActionForm;

public class BeforeLoanAdvisoryShowAF extends ActionForm {
  
/**
   * 
   */

private String empname="";
private String empId="";
private String empCardnum="";
private String empAge="";
private String empOrgname="";
private String empOrgid="";
private String empSalaryBase="";
private String empMonthPay="";
private String empBalance="";
private String empStatus="";
private String empContinus="";

private String spouseName="";
private String spouseId="";
private String spouseCardnum="";
private String spouseAge="";
private String spouseOrgname="";
private String spouseOrgid="";
private String spouseSalaryBase="";
private String spouseMonthPay="";
private String spouseBalance="";
private String spouseStatus="";
private String spouseContinus="";

private String houseTotalPrice="";
private String houseType="";
private  Map houseTypeMap=new HashMap();
private String maxLoanMoney="";
private String maxLoanYear="";
private String monthBackMoney="";  // �»���Ϣ

private String officecode="";
private String sex="";

private String inputSalary="";
private String outLoanYear="";
private String outLoanMoney="";

public void reset()
{
  this.empAge="";
  this.empBalance="";
  this.empCardnum="";
  this.empContinus="";
  this.empId="";
  this.empMonthPay="";
  this.empname="";
  this.empOrgid="";
  this.empOrgname="";
  this.empSalaryBase="";
  this.empStatus="";
  this.spouseAge="";
  this.spouseBalance="";
  this.spouseCardnum="";
  this.spouseContinus="";
  this.spouseId="";
  this.spouseMonthPay="";
  this.spouseName="";
  this.spouseOrgid="";
  this.spouseOrgname="";
  this.spouseSalaryBase="";
  this.spouseStatus="";
  this.maxLoanMoney="";
  this.maxLoanYear="";
  this.outLoanMoney="";
  this.outLoanYear="";
}
public String getEmpAge() {
  return empAge;
}
public void setEmpAge(String empAge) {
  this.empAge = empAge;
}
public String getEmpBalance() {
  return empBalance;
}
public void setEmpBalance(String empBalance) {
  this.empBalance = empBalance;
}
public String getEmpCardnum() {
  return empCardnum;
}
public void setEmpCardnum(String empCardnum) {
  this.empCardnum = empCardnum;
}
public String getEmpContinus() {
  return empContinus;
}
public void setEmpContinus(String empContinus) {
  this.empContinus = empContinus;
}
public String getEmpId() {
  return empId;
}
public void setEmpId(String empId) {
  this.empId = empId;
}
public String getEmpMonthPay() {
  return empMonthPay;
}
public void setEmpMonthPay(String empMonthPay) {
  this.empMonthPay = empMonthPay;
}

public String getEmpOrgid() {
  return empOrgid;
}
public void setEmpOrgid(String empOrgid) {
  this.empOrgid = empOrgid;
}
public String getEmpOrgname() {
  return empOrgname;
}
public void setEmpOrgname(String empOrgname) {
  this.empOrgname = empOrgname;
}
public String getEmpSalaryBase() {
  return empSalaryBase;
}
public void setEmpSalaryBase(String empSalaryBase) {
  this.empSalaryBase = empSalaryBase;
}
public String getEmpStatus() {
  return empStatus;
}
public void setEmpStatus(String empStatus) {
  this.empStatus = empStatus;
}
public String getHouseTotalPrice() {
  return houseTotalPrice;
}
public void setHouseTotalPrice(String houseTotalPrice) {
  this.houseTotalPrice = houseTotalPrice;
}
public String getHouseType() {
  return houseType;
}
public void setHouseType(String houseType) {
  this.houseType = houseType;
}
public Map getHouseTypeMap() {
  return houseTypeMap;
}
public void setHouseTypeMap(Map houseTypeMap) {
  this.houseTypeMap = houseTypeMap;
}
public String getMaxLoanMoney() {
  return maxLoanMoney;
}
public void setMaxLoanMoney(String maxLoanMoney) {
  this.maxLoanMoney = maxLoanMoney;
}
public String getMaxLoanYear() {
  return maxLoanYear;
}
public void setMaxLoanYear(String maxLoanYear) {
  this.maxLoanYear = maxLoanYear;
}
public String getMonthBackMoney() {
  return monthBackMoney;
}
public void setMonthBackMoney(String monthBackMoney) {
  this.monthBackMoney = monthBackMoney;
}
public String getSpouseAge() {
  return spouseAge;
}
public void setSpouseAge(String spouseAge) {
  this.spouseAge = spouseAge;
}
public String getSpouseBalance() {
  return spouseBalance;
}
public void setSpouseBalance(String spouseBalance) {
  this.spouseBalance = spouseBalance;
}
public String getSpouseCardnum() {
  return spouseCardnum;
}
public void setSpouseCardnum(String spouseCardnum) {
  this.spouseCardnum = spouseCardnum;
}
public String getSpouseContinus() {
  return spouseContinus;
}
public void setSpouseContinus(String spouseContinus) {
  this.spouseContinus = spouseContinus;
}
public String getSpouseId() {
  return spouseId;
}
public void setSpouseId(String spouseId) {
  this.spouseId = spouseId;
}
public String getSpouseMonthPay() {
  return spouseMonthPay;
}
public void setSpouseMonthPay(String spouseMonthPay) {
  this.spouseMonthPay = spouseMonthPay;
}
public String getSpouseName() {
  return spouseName;
}
public void setSpouseName(String spouseName) {
  this.spouseName = spouseName;
}
public String getSpouseOrgid() {
  return spouseOrgid;
}
public void setSpouseOrgid(String spouseOrgid) {
  this.spouseOrgid = spouseOrgid;
}
public String getSpouseOrgname() {
  return spouseOrgname;
}
public void setSpouseOrgname(String spouseOrgname) {
  this.spouseOrgname = spouseOrgname;
}
public String getSpouseSalaryBase() {
  return spouseSalaryBase;
}
public void setSpouseSalaryBase(String spouseSalaryBase) {
  this.spouseSalaryBase = spouseSalaryBase;
}
public String getSpouseStatus() {
  return spouseStatus;
}
public void setSpouseStatus(String spouseStatus) {
  this.spouseStatus = spouseStatus;
}
public String getEmpname() {
  return empname;
}
public void setEmpname(String empname) {
  this.empname = empname;
}
public String getOfficecode() {
  return officecode;
}
public void setOfficecode(String officecode) {
  this.officecode = officecode;
}
public String getSex() {
  return sex;
}
public void setSex(String sex) {
  this.sex = sex;
}
public String getInputSalary() {
  return inputSalary;
}
public void setInputSalary(String inputSalary) {
  this.inputSalary = inputSalary;
}
public String getOutLoanMoney() {
  return outLoanMoney;
}
public void setOutLoanMoney(String outLoanMoney) {
  this.outLoanMoney = outLoanMoney;
}
public String getOutLoanYear() {
  return outLoanYear;
}
public void setOutLoanYear(String outLoanYear) {
  this.outLoanYear = outLoanYear;
}


}
