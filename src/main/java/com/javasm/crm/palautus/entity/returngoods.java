package com.javasm.crm.palautus.entity;

public class returngoods {
    private Integer retutngoodsimei;

    private String returngoodsbrand;

    private String returngoodsname;

    private String returngoodsmodel;

    private String returngoodscolor;

    private String returngoodsfactory;

    private String returngoodsmessage;

    private String returngoodsconfig;

    private Integer returnoutid;

    public Integer getRetutngoodsimei() {
        return retutngoodsimei;
    }

    public void setRetutngoodsimei(Integer retutngoodsimei) {
        this.retutngoodsimei = retutngoodsimei;
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

    public String getReturngoodsconfig() {
        return returngoodsconfig;
    }

    public void setReturngoodsconfig(String returngoodsconfig) {
        this.returngoodsconfig = returngoodsconfig == null ? null : returngoodsconfig.trim();
    }

    public Integer getReturnoutid() {
        return returnoutid;
    }

    public void setReturnoutid(Integer returnoutid) {
        this.returnoutid = returnoutid;
    }

	@Override
	public String toString() {
		return "returngoods [retutngoodsimei=" + retutngoodsimei + ", returngoodsbrand=" + returngoodsbrand
				+ ", returngoodsname=" + returngoodsname + ", returngoodsmodel=" + returngoodsmodel
				+ ", returngoodscolor=" + returngoodscolor + ", returngoodsfactory=" + returngoodsfactory
				+ ", returngoodsmessage=" + returngoodsmessage + ", returngoodsconfig=" + returngoodsconfig
				+ ", returnoutid=" + returnoutid + "]";
	}

	public returngoods(Integer retutngoodsimei, String returngoodsbrand, String returngoodsname,
			String returngoodsmodel, String returngoodscolor, String returngoodsfactory, String returngoodsmessage,
			String returngoodsconfig, Integer returnoutid) {
		super();
		this.retutngoodsimei = retutngoodsimei;
		this.returngoodsbrand = returngoodsbrand;
		this.returngoodsname = returngoodsname;
		this.returngoodsmodel = returngoodsmodel;
		this.returngoodscolor = returngoodscolor;
		this.returngoodsfactory = returngoodsfactory;
		this.returngoodsmessage = returngoodsmessage;
		this.returngoodsconfig = returngoodsconfig;
		this.returnoutid = returnoutid;
	}

	public returngoods() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}