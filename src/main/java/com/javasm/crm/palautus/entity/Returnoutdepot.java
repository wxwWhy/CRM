package com.javasm.crm.palautus.entity;

public class Returnoutdepot {
    private Integer outdepotid;

    private String retutngoodsimei;

    private String returngoodsbrand;

    private String returngoodsname;

    private String returngoodsmodel;

    private String returngoodscolor;

    private String returngoodsfactory;

    private String returngoodsmessage;

    private String textarea;

    private String location;

    private String area;

    private String remark;

    private String outdepotmark;

    private String maketableperson;

    private String maketabledate;

    private String approver;

    private String approvaltime;

    private String approvalstatus;

    private String approvalmessage;

    public Integer getOutdepotid() {
        return outdepotid;
    }

    public void setOutdepotid(Integer outdepotid) {
        this.outdepotid = outdepotid;
    }

    public String getRetutngoodsimei() {
        return retutngoodsimei;
    }

    public void setRetutngoodsimei(String retutngoodsimei) {
        this.retutngoodsimei = retutngoodsimei == null ? null : retutngoodsimei.trim();
    }

    public String getReturngoodsbrand() {
        return returngoodsbrand;
    }

    public void setReturngoodsbrand(String returngoodsbrand) {
        this.returngoodsbrand = returngoodsbrand == null ? null : returngoodsbrand.trim();
    }

    public String getReturngoodsname() {
        return returngoodsname;
    }

    public void setReturngoodsname(String returngoodsname) {
        this.returngoodsname = returngoodsname == null ? null : returngoodsname.trim();
    }

    public String getReturngoodsmodel() {
        return returngoodsmodel;
    }

    public void setReturngoodsmodel(String returngoodsmodel) {
        this.returngoodsmodel = returngoodsmodel == null ? null : returngoodsmodel.trim();
    }

    public String getReturngoodscolor() {
        return returngoodscolor;
    }

    public void setReturngoodscolor(String returngoodscolor) {
        this.returngoodscolor = returngoodscolor == null ? null : returngoodscolor.trim();
    }

    public String getReturngoodsfactory() {
        return returngoodsfactory;
    }

    public void setReturngoodsfactory(String returngoodsfactory) {
        this.returngoodsfactory = returngoodsfactory == null ? null : returngoodsfactory.trim();
    }

    public String getReturngoodsmessage() {
        return returngoodsmessage;
    }

    public void setReturngoodsmessage(String returngoodsmessage) {
        this.returngoodsmessage = returngoodsmessage == null ? null : returngoodsmessage.trim();
    }

    public String getTextarea() {
        return textarea;
    }

    public void setTextarea(String textarea) {
        this.textarea = textarea == null ? null : textarea.trim();
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getOutdepotmark() {
        return outdepotmark;
    }

    public void setOutdepotmark(String outdepotmark) {
        this.outdepotmark = outdepotmark == null ? null : outdepotmark.trim();
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
		return "Returnoutdepot [outdepotid=" + outdepotid + ", retutngoodsimei=" + retutngoodsimei
				+ ", returngoodsbrand=" + returngoodsbrand + ", returngoodsname=" + returngoodsname
				+ ", returngoodsmodel=" + returngoodsmodel + ", returngoodscolor=" + returngoodscolor
				+ ", returngoodsfactory=" + returngoodsfactory + ", returngoodsmessage=" + returngoodsmessage
				+ ", textarea=" + textarea + ", location=" + location + ", area=" + area + ", remark=" + remark
				+ ", outdepotmark=" + outdepotmark + ", maketableperson=" + maketableperson + ", maketabledate="
				+ maketabledate + ", approver=" + approver + ", approvaltime=" + approvaltime + ", approvalstatus="
				+ approvalstatus + ", approvalmessage=" + approvalmessage + "]";
	}

	public Returnoutdepot(Integer outdepotid, String retutngoodsimei, String returngoodsbrand, String returngoodsname,
			String returngoodsmodel, String returngoodscolor, String returngoodsfactory, String returngoodsmessage,
			String textarea, String location, String area, String remark, String outdepotmark, String maketableperson,
			String maketabledate, String approver, String approvaltime, String approvalstatus, String approvalmessage) {
		super();
		this.outdepotid = outdepotid;
		this.retutngoodsimei = retutngoodsimei;
		this.returngoodsbrand = returngoodsbrand;
		this.returngoodsname = returngoodsname;
		this.returngoodsmodel = returngoodsmodel;
		this.returngoodscolor = returngoodscolor;
		this.returngoodsfactory = returngoodsfactory;
		this.returngoodsmessage = returngoodsmessage;
		this.textarea = textarea;
		this.location = location;
		this.area = area;
		this.remark = remark;
		this.outdepotmark = outdepotmark;
		this.maketableperson = maketableperson;
		this.maketabledate = maketabledate;
		this.approver = approver;
		this.approvaltime = approvaltime;
		this.approvalstatus = approvalstatus;
		this.approvalmessage = approvalmessage;
	}

	public Returnoutdepot() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
    
}