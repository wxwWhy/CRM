package com.javasm.crm.palautus.entity;

public class AfterSalesAppeal {
    private String projectname;

    private String projectword;

    private String projectproblem;

    private String projectanswer;

    private String projectscene;

    private String projectremark;

    private String projectmakeperson;

    private String projectmaketime;

    private String projectapproval;

    private String projectapprovaltime;

    private String projectapprovalstatus;
    
    private String projectapprovalmessage;

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname == null ? null : projectname.trim();
    }

    public String getProjectword() {
        return projectword;
    }

    public void setProjectword(String projectword) {
        this.projectword = projectword == null ? null : projectword.trim();
    }

    public String getProjectproblem() {
        return projectproblem;
    }

    public void setProjectproblem(String projectproblem) {
        this.projectproblem = projectproblem == null ? null : projectproblem.trim();
    }

    public String getProjectanswer() {
        return projectanswer;
    }

    public void setProjectanswer(String projectanswer) {
        this.projectanswer = projectanswer == null ? null : projectanswer.trim();
    }

    public String getProjectscene() {
        return projectscene;
    }

    public void setProjectscene(String projectscene) {
        this.projectscene = projectscene == null ? null : projectscene.trim();
    }

    public String getProjectremark() {
        return projectremark;
    }

    public void setProjectremark(String projectremark) {
        this.projectremark = projectremark == null ? null : projectremark.trim();
    }

    public String getProjectmakeperson() {
        return projectmakeperson;
    }

    public void setProjectmakeperson(String projectmakeperson) {
        this.projectmakeperson = projectmakeperson == null ? null : projectmakeperson.trim();
    }

    public String getProjectmaketime() {
        return projectmaketime;
    }

    public void setProjectmaketime(String projectmaketime) {
        this.projectmaketime = projectmaketime == null ? null : projectmaketime.trim();
    }

    public String getProjectapproval() {
        return projectapproval;
    }

    public void setProjectapproval(String projectapproval) {
        this.projectapproval = projectapproval == null ? null : projectapproval.trim();
    }

    public String getProjectapprovaltime() {
        return projectapprovaltime;
    }

    public void setProjectapprovaltime(String projectapprovaltime) {
        this.projectapprovaltime = projectapprovaltime == null ? null : projectapprovaltime.trim();
    }

    public String getProjectapprovalstatus() {
        return projectapprovalstatus;
    }

    public void setProjectapprovalstatus(String projectapprovalstatus) {
        this.projectapprovalstatus = projectapprovalstatus == null ? null : projectapprovalstatus.trim();
    }
    
    

	public String getProjectapprovalmessage() {
		return projectapprovalmessage;
	}

	public void setProjectapprovalmessage(String projectapprovalmessage) {
		this.projectapprovalmessage = projectapprovalmessage;
	}

	@Override
	public String toString() {
		return "AfterSalesAppeal [projectname=" + projectname + ", projectword=" + projectword + ", projectproblem="
				+ projectproblem + ", projectanswer=" + projectanswer + ", projectscene=" + projectscene
				+ ", projectremark=" + projectremark + ", projectmakeperson=" + projectmakeperson + ", projectmaketime="
				+ projectmaketime + ", projectapproval=" + projectapproval + ", projectapprovaltime="
				+ projectapprovaltime + ", projectapprovalstatus=" + projectapprovalstatus + ", projectapprovalmessage="
				+ projectapprovalmessage + "]";
	}

	public AfterSalesAppeal(String projectname, String projectword, String projectproblem, String projectanswer,
			String projectscene, String projectremark, String projectmakeperson, String projectmaketime,
			String projectapproval, String projectapprovaltime, String projectapprovalstatus,
			String projectapprovalmessage) {
		super();
		this.projectname = projectname;
		this.projectword = projectword;
		this.projectproblem = projectproblem;
		this.projectanswer = projectanswer;
		this.projectscene = projectscene;
		this.projectremark = projectremark;
		this.projectmakeperson = projectmakeperson;
		this.projectmaketime = projectmaketime;
		this.projectapproval = projectapproval;
		this.projectapprovaltime = projectapprovaltime;
		this.projectapprovalstatus = projectapprovalstatus;
		this.projectapprovalmessage = projectapprovalmessage;
	}

	public AfterSalesAppeal() {
		super();
		// TODO Auto-generated constructor stub
	}

	
    
    
    
}