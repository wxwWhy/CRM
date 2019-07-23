package com.javasm.crm.palautus.entity;

public class Returnindepot {
    private Integer indepotid;

    private String retutnrepairgoodsimei;

    private String returnrepirgoodsbrand;

    private String returnrepirgoodsname;

    private String returnrepirgoodsmodel;

    private String returnrepirgoodscolor;

    private String returnrepirgoodsfactory;

    private String returnrepirgoodsmessage;

    private String returnrepirgoodsstatus;

    private String returnrepirgoodsbeforeimei;

    private String location;

    private String area;

    private String indepotmark;

    private String maketableperson;

    private String maketabledate;

    private String approver;

    private String approvaltime;

    private String approvalstatus;

    private String approvalmessage;

    public Integer getIndepotid() {
        return indepotid;
    }

    public void setIndepotid(Integer indepotid) {
        this.indepotid = indepotid;
    }

    public String getRetutnrepairgoodsimei() {
        return retutnrepairgoodsimei;
    }

    public void setRetutnrepairgoodsimei(String retutnrepairgoodsimei) {
        this.retutnrepairgoodsimei = retutnrepairgoodsimei == null ? null : retutnrepairgoodsimei.trim();
    }

    public String getReturnrepirgoodsbrand() {
        return returnrepirgoodsbrand;
    }

    public void setReturnrepirgoodsbrand(String returnrepirgoodsbrand) {
        this.returnrepirgoodsbrand = returnrepirgoodsbrand == null ? null : returnrepirgoodsbrand.trim();
    }

    public String getReturnrepirgoodsname() {
        return returnrepirgoodsname;
    }

    public void setReturnrepirgoodsname(String returnrepirgoodsname) {
        this.returnrepirgoodsname = returnrepirgoodsname == null ? null : returnrepirgoodsname.trim();
    }

    public String getReturnrepirgoodsmodel() {
        return returnrepirgoodsmodel;
    }

    public void setReturnrepirgoodsmodel(String returnrepirgoodsmodel) {
        this.returnrepirgoodsmodel = returnrepirgoodsmodel == null ? null : returnrepirgoodsmodel.trim();
    }

    public String getReturnrepirgoodscolor() {
        return returnrepirgoodscolor;
    }

    public void setReturnrepirgoodscolor(String returnrepirgoodscolor) {
        this.returnrepirgoodscolor = returnrepirgoodscolor == null ? null : returnrepirgoodscolor.trim();
    }

    public String getReturnrepirgoodsfactory() {
        return returnrepirgoodsfactory;
    }

    public void setReturnrepirgoodsfactory(String returnrepirgoodsfactory) {
        this.returnrepirgoodsfactory = returnrepirgoodsfactory == null ? null : returnrepirgoodsfactory.trim();
    }

    public String getReturnrepirgoodsmessage() {
        return returnrepirgoodsmessage;
    }

    public void setReturnrepirgoodsmessage(String returnrepirgoodsmessage) {
        this.returnrepirgoodsmessage = returnrepirgoodsmessage == null ? null : returnrepirgoodsmessage.trim();
    }

    public String getReturnrepirgoodsstatus() {
        return returnrepirgoodsstatus;
    }

    public void setReturnrepirgoodsstatus(String returnrepirgoodsstatus) {
        this.returnrepirgoodsstatus = returnrepirgoodsstatus == null ? null : returnrepirgoodsstatus.trim();
    }

    public String getReturnrepirgoodsbeforeimei() {
        return returnrepirgoodsbeforeimei;
    }

    public void setReturnrepirgoodsbeforeimei(String returnrepirgoodsbeforeimei) {
        this.returnrepirgoodsbeforeimei = returnrepirgoodsbeforeimei == null ? null : returnrepirgoodsbeforeimei.trim();
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getIndepotmark() {
        return indepotmark;
    }

    public void setIndepotmark(String indepotmark) {
        this.indepotmark = indepotmark == null ? null : indepotmark.trim();
    }

    public String getMaketableperson() {
        return maketableperson;
    }

    public void setMaketableperson(String maketableperson) {
        this.maketableperson = maketableperson == null ? null : maketableperson.trim();
    }

    public String getMaketabledate() {
        return maketabledate;
    }

    public void setMaketabledate(String maketabledate) {
        this.maketabledate = maketabledate == null ? null : maketabledate.trim();
    }

    public String getApprover() {
        return approver;
    }

    public void setApprover(String approver) {
        this.approver = approver == null ? null : approver.trim();
    }

    public String getApprovaltime() {
        return approvaltime;
    }

    public void setApprovaltime(String approvaltime) {
        this.approvaltime = approvaltime == null ? null : approvaltime.trim();
    }

    public String getApprovalstatus() {
        return approvalstatus;
    }

    public void setApprovalstatus(String approvalstatus) {
        this.approvalstatus = approvalstatus == null ? null : approvalstatus.trim();
    }

    public String getApprovalmessage() {
        return approvalmessage;
    }

    public void setApprovalmessage(String approvalmessage) {
        this.approvalmessage = approvalmessage == null ? null : approvalmessage.trim();
    }

	@Override
	public String toString() {
		return "Returnindepot [indepotid=" + indepotid + ", retutnrepairgoodsimei=" + retutnrepairgoodsimei
				+ ", returnrepirgoodsbrand=" + returnrepirgoodsbrand + ", returnrepirgoodsname=" + returnrepirgoodsname
				+ ", returnrepirgoodsmodel=" + returnrepirgoodsmodel + ", returnrepirgoodscolor="
				+ returnrepirgoodscolor + ", returnrepirgoodsfactory=" + returnrepirgoodsfactory
				+ ", returnrepirgoodsmessage=" + returnrepirgoodsmessage + ", returnrepirgoodsstatus="
				+ returnrepirgoodsstatus + ", returnrepirgoodsbeforeimei=" + returnrepirgoodsbeforeimei + ", location="
				+ location + ", area=" + area + ", indepotmark=" + indepotmark + ", maketableperson=" + maketableperson
				+ ", maketabledate=" + maketabledate + ", approver=" + approver + ", approvaltime=" + approvaltime
				+ ", approvalstatus=" + approvalstatus + ", approvalmessage=" + approvalmessage + "]";
	}

	public Returnindepot(Integer indepotid, String retutnrepairgoodsimei, String returnrepirgoodsbrand,
			String returnrepirgoodsname, String returnrepirgoodsmodel, String returnrepirgoodscolor,
			String returnrepirgoodsfactory, String returnrepirgoodsmessage, String returnrepirgoodsstatus,
			String returnrepirgoodsbeforeimei, String location, String area, String indepotmark, String maketableperson,
			String maketabledate, String approver, String approvaltime, String approvalstatus, String approvalmessage) {
		super();
		this.indepotid = indepotid;
		this.retutnrepairgoodsimei = retutnrepairgoodsimei;
		this.returnrepirgoodsbrand = returnrepirgoodsbrand;
		this.returnrepirgoodsname = returnrepirgoodsname;
		this.returnrepirgoodsmodel = returnrepirgoodsmodel;
		this.returnrepirgoodscolor = returnrepirgoodscolor;
		this.returnrepirgoodsfactory = returnrepirgoodsfactory;
		this.returnrepirgoodsmessage = returnrepirgoodsmessage;
		this.returnrepirgoodsstatus = returnrepirgoodsstatus;
		this.returnrepirgoodsbeforeimei = returnrepirgoodsbeforeimei;
		this.location = location;
		this.area = area;
		this.indepotmark = indepotmark;
		this.maketableperson = maketableperson;
		this.maketabledate = maketabledate;
		this.approver = approver;
		this.approvaltime = approvaltime;
		this.approvalstatus = approvalstatus;
		this.approvalmessage = approvalmessage;
	}

	public Returnindepot() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}