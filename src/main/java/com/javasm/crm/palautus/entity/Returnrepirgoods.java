package com.javasm.crm.palautus.entity;

public class Returnrepirgoods {
    private Integer retutnrepairgoodsimei;

    private String returnrepirgoodsbrand;

    private String returnrepirgoodsname;

    private String returnrepirgoodsmodel;

    private String returnrepirgoodscolor;

    private String returnrepirgoodsfactory;

    private String returnrepirgoodsmessage;

    private String returnrepirgoodsstatus;

    private Integer returnrepirgoodsbeforeimei;

    public Integer getRetutnrepairgoodsimei() {
        return retutnrepairgoodsimei;
    }

    public void setRetutnrepairgoodsimei(Integer retutnrepairgoodsimei) {
        this.retutnrepairgoodsimei = retutnrepairgoodsimei;
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

    public Integer getReturnrepirgoodsbeforeimei() {
        return returnrepirgoodsbeforeimei;
    }

    public void setReturnrepirgoodsbeforeimei(Integer returnrepirgoodsbeforeimei) {
        this.returnrepirgoodsbeforeimei = returnrepirgoodsbeforeimei;
    }

	@Override
	public String toString() {
		return "Returnrepirgoods [retutnrepairgoodsimei=" + retutnrepairgoodsimei + ", returnrepirgoodsbrand="
				+ returnrepirgoodsbrand + ", returnrepirgoodsname=" + returnrepirgoodsname + ", returnrepirgoodsmodel="
				+ returnrepirgoodsmodel + ", returnrepirgoodscolor=" + returnrepirgoodscolor
				+ ", returnrepirgoodsfactory=" + returnrepirgoodsfactory + ", returnrepirgoodsmessage="
				+ returnrepirgoodsmessage + ", returnrepirgoodsstatus=" + returnrepirgoodsstatus
				+ ", returnrepirgoodsbeforeimei=" + returnrepirgoodsbeforeimei + "]";
	}

	public Returnrepirgoods(Integer retutnrepairgoodsimei, String returnrepirgoodsbrand, String returnrepirgoodsname,
			String returnrepirgoodsmodel, String returnrepirgoodscolor, String returnrepirgoodsfactory,
			String returnrepirgoodsmessage, String returnrepirgoodsstatus, Integer returnrepirgoodsbeforeimei) {
		super();
		this.retutnrepairgoodsimei = retutnrepairgoodsimei;
		this.returnrepirgoodsbrand = returnrepirgoodsbrand;
		this.returnrepirgoodsname = returnrepirgoodsname;
		this.returnrepirgoodsmodel = returnrepirgoodsmodel;
		this.returnrepirgoodscolor = returnrepirgoodscolor;
		this.returnrepirgoodsfactory = returnrepirgoodsfactory;
		this.returnrepirgoodsmessage = returnrepirgoodsmessage;
		this.returnrepirgoodsstatus = returnrepirgoodsstatus;
		this.returnrepirgoodsbeforeimei = returnrepirgoodsbeforeimei;
	}

	public Returnrepirgoods() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
    
}