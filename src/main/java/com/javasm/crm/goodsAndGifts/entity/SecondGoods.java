package com.javasm.crm.goodsAndGifts.entity;

public class SecondGoods {


	    private int sid;
	    private String sbrand;
	    private String smodel;
	    private String scolor;
	    private String sname;
	    private String stype;
	    private int smarketprice;
	    private int sshoppingprice;
	    private int sminrepertory;
	    private String sifpurchase;
	    private String status;
	    private int code;
		public SecondGoods() {
			super();
			// TODO Auto-generated constructor stub
		}
		public SecondGoods(int sid, String sbrand, String smodel, String scolor, String sname, String stype,
				int smarketprice, int sshoppingprice, int sminrepertory, String sifpurchase, String status, int code) {
			super();
			this.sid = sid;
			this.sbrand = sbrand;
			this.smodel = smodel;
			this.scolor = scolor;
			this.sname = sname;
			this.stype = stype;
			this.smarketprice = smarketprice;
			this.sshoppingprice = sshoppingprice;
			this.sminrepertory = sminrepertory;
			this.sifpurchase = sifpurchase;
			this.status = status;
			this.code = code;
		}
		@Override
		public String toString() {
			return "SecondGoods [sid=" + sid + ", sbrand=" + sbrand + ", smodel=" + smodel + ", scolor=" + scolor
					+ ", sname=" + sname + ", stype=" + stype + ", smarketprice=" + smarketprice + ", sshoppingprice="
					+ sshoppingprice + ", sminrepertory=" + sminrepertory + ", sifpurchase=" + sifpurchase + ", status="
					+ status + ", code=" + code + "]";
		}
		public int getSid() {
			return sid;
		}
		public void setSid(int sid) {
			this.sid = sid;
		}
		public String getSbrand() {
			return sbrand;
		}
		public void setSbrand(String sbrand) {
			this.sbrand = sbrand;
		}
		public String getSmodel() {
			return smodel;
		}
		public void setSmodel(String smodel) {
			this.smodel = smodel;
		}
		public String getScolor() {
			return scolor;
		}
		public void setScolor(String scolor) {
			this.scolor = scolor;
		}
		public String getSname() {
			return sname;
		}
		public void setSname(String sname) {
			this.sname = sname;
		}
		public String getStype() {
			return stype;
		}
		public void setStype(String stype) {
			this.stype = stype;
		}
		public int getSmarketprice() {
			return smarketprice;
		}
		public void setSmarketprice(int smarketprice) {
			this.smarketprice = smarketprice;
		}
		public int getSshoppingprice() {
			return sshoppingprice;
		}
		public void setSshoppingprice(int sshoppingprice) {
			this.sshoppingprice = sshoppingprice;
		}
		public int getSminrepertory() {
			return sminrepertory;
		}
		public void setSminrepertory(int sminrepertory) {
			this.sminrepertory = sminrepertory;
		}
		public String getSifpurchase() {
			return sifpurchase;
		}
		public void setSifpurchase(String sifpurchase) {
			this.sifpurchase = sifpurchase;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public int getCode() {
			return code;
		}
		public void setCode(int code) {
			this.code = code;
		}

	    
	    
	    
	    

}