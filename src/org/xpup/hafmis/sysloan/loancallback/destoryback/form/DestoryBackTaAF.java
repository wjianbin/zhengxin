package org.xpup.hafmis.sysloan.loancallback.destoryback.form;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class DestoryBackTaAF extends ActionForm {
  private String loanKouAcc = "";// 贷款账号

  private String contractId = "";// 合同编号

  private String borrowerName = "";// 借款人姓名

  private String cardKind = ""; // 证件类型

  private String cardKindName = ""; // 显示证件类型对应的名称

  private String cardNum = ""; // 证件号码

  private BigDecimal overplusLoanMoney = new BigDecimal(0.00);//剩余本金

  private String loanMode = "";//还款方式

  private String loanModeName = "";//还款方式

  private BigDecimal noBackMoney = new BigDecimal(0.00);//核销未收回金额

  private BigDecimal backMoney = new BigDecimal(0.00);//收回金额

  private String backUnit = "";//收回单位
  
  private String assistantOrgId = "";//收回单位名称

  private String loanassistantorgId = "";// 收回单位ID

  public String getBorrowerName() {
    return borrowerName;
  }

  public void setBorrowerName(String borrowerName) {
    this.borrowerName = borrowerName;
  }

  public String getCardKind() {
    return cardKind;
  }

  public void setCardKind(String cardKind) {
    this.cardKind = cardKind;
  }

  public String getCardKindName() {
    return cardKindName;
  }

  public void setCardKindName(String cardKindName) {
    this.cardKindName = cardKindName;
  }

  public String getCardNum() {
    return cardNum;
  }

  public void setCardNum(String cardNum) {
    this.cardNum = cardNum;
  }

  public String getContractId() {
    return contractId;
  }

  public void setContractId(String contractId) {
    this.contractId = contractId;
  }

  public String getLoanKouAcc() {
    return loanKouAcc;
  }

  public void setLoanKouAcc(String loanKouAcc) {
    this.loanKouAcc = loanKouAcc;
  }

  public String getLoanMode() {
    return loanMode;
  }

  public void setLoanMode(String loanMode) {
    this.loanMode = loanMode;
  }

  public String getLoanModeName() {
    return loanModeName;
  }

  public void setLoanModeName(String loanModeName) {
    this.loanModeName = loanModeName;
  }

  public BigDecimal getNoBackMoney() {
    return noBackMoney;
  }

  public void setNoBackMoney(BigDecimal noBackMoney) {
    this.noBackMoney = noBackMoney;
  }

  public BigDecimal getOverplusLoanMoney() {
    return overplusLoanMoney;
  }

  public void setOverplusLoanMoney(BigDecimal overplusLoanMoney) {
    this.overplusLoanMoney = overplusLoanMoney;
  }

  public BigDecimal getBackMoney() {
    return backMoney;
  }

  public void setBackMoney(BigDecimal backMoney) {
    this.backMoney = backMoney;
  }

  public String getBackUnit() {
    return backUnit;
  }

  public void setBackUnit(String backUnit) {
    this.backUnit = backUnit;
  }

  public String getLoanassistantorgId() {
    return loanassistantorgId;
  }

  public void setLoanassistantorgId(String loanassistantorgId) {
    this.loanassistantorgId = loanassistantorgId;
  }

  public void reset(ActionMapping mapping, HttpServletRequest request) {
    loanKouAcc = "";// 贷款账号

    contractId = "";// 合同编号

    borrowerName = "";// 借款人姓名

    cardKind = ""; // 证件类型

    cardKindName = ""; // 显示证件类型对应的名称

    cardNum = ""; // 证件号码

    overplusLoanMoney = new BigDecimal(0.00);//剩余本金

    loanMode = "";//还款方式

    loanModeName = "";//还款方式

    noBackMoney = new BigDecimal(0.00);//核销未收回金额

    backMoney = new BigDecimal(0.00);//收回金额

    backUnit = "";//收回单位

    assistantOrgId = "";//收回单位名称

    loanassistantorgId = "";// 收回单位ID
  }

  public String getAssistantOrgId() {
    return assistantOrgId;
  }

  public void setAssistantOrgId(String assistantOrgId) {
    this.assistantOrgId = assistantOrgId;
  }

}
