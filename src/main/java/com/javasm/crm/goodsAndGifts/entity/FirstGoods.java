package com.javasm.crm.goodsAndGifts.entity;

public class FirstGoods {
	
	private int fid;
	private int ffilenumber;
	private String fbusinesspattern;
	private String fmedic;
	private String fbasepurchasepattern;
	private String fbasestandby;
	private String fbasecolor;
	private String fbasemodel;
	private String fbasebrand;
	private String fbasetype;
	private String fname;
	private String ftype;
	private double fpurchaseprice;
	private double fmarketprice;
	private double fshoppingmallprice;
	private int fminrepertory;
	private String fifpurchase;
	private int fsupplierid;
	public FirstGoods(int fid, int ffilenumber, String fbusinesspattern, String fmedic, String fbasepurchasepattern,
			String fbasestandby, String fbasecolor, String fbasemodel, String fbasebrand, String fbasetype,
			String fname, String ftype, double fpurchaseprice, double fmarketprice, double fshoppingmallprice,
			int fminrepertory, String fifpurchase, int fsupplierid) {
		super();
		this.fid = fid;
		this.ffilenumber = ffilenumber;
		this.fbusinesspattern = fbusinesspattern;
		this.fmedic = fmedic;
		this.fbasepurchasepattern = fbasepurchasepattern;
		this.fbasestandby = fbasestandby;
		this.fbasecolor = fbasecolor;
		this.fbasemodel = fbasemodel;
		this.fbasebrand = fbasebrand;
		this.fbasetype = fbasetype;
		this.fname = fname;
		this.ftype = ftype;
		this.fpurchaseprice = fpurchaseprice;
		this.fmarketprice = fmarketprice;
		this.fshoppingmallprice = fshoppingmallprice;
		this.fminrepertory = fminrepertory;
		this.fifpurchase = fifpurchase;
		this.fsupplierid = fsupplierid;
	}
	public FirstGoods() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "FirstGoods [fid=" + fid + ", ffilenumber=" + ffilenumber + ", fbusinesspattern=" + fbusinesspattern
				+ ", fmedic=" + fmedic + ", fbasepurchasepattern=" + fbasepurchasepattern + ", fbasestandby="
				+ fbasestandby + ", fbasecolor=" + fbasecolor + ", fbasemodel=" + fbasemodel + ", fbasebrand="
				+ fbasebrand + ", fbasetype=" + fbasetype + ", fname=" + fname + ", ftype=" + ftype
				+ ", fpurchaseprice=" + fpurchaseprice + ", fmarketprice=" + fmarketprice + ", fshoppingmallprice="
				+ fshoppingmallprice + ", fminrepertory=" + fminrepertory + ", fifpurchase=" + fifpurchase
				+ ", fsupplierid=" + fsupplierid + "]";
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getFfilenumber() {
		return ffilenumber;
	}
	public void setFfilenumber(int ffilenumber) {
		this.ffilenumber = ffilenumber;
	}
	public String getFbusinesspattern() {
		return fbusinesspattern;
	}
	public void setFbusinesspattern(String fbusinesspattern) {
		this.fbusinesspattern = fbusinesspattern;
	}
	public String getFmedic() {
		return fmedic;
	}
	public void setFmedic(String fmedic) {
		this.fmedic = fmedic;
	}
	public String getFbasepurchasepattern() {
		return fbasepurchasepattern;
	}
	public void setFbasepurchasepattern(String fbasepurchasepattern) {
		this.fbasepurchasepattern = fbasepurchasepattern;
	}
	public String getFbasestandby() {
		return fbasestandby;
	}
	public void setFbasestandby(String fbasestandby) {
		this.fbasestandby = fbasestandby;
	}
	public String getFbasecolor() {
		return fbasecolor;
	}
	public void setFbasecolor(String fbasecolor) {
		this.fbasecolor = fbasecolor;
	}
	public String getFbasemodel() {
		return fbasemodel;
	}
	public void setFbasemodel(String fbasemodel) {
		this.fbasemodel = fbasemodel;
	}
	public String getFbasebrand() {
		return fbasebrand;
	}
	public void setFbasebrand(String fbasebrand) {
		this.fbasebrand = fbasebrand;
	}
	public String getFbasetype() {
		return fbasetype;
	}
	public void setFbasetype(String fbasetype) {
		this.fbasetype = fbasetype;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public double getFpurchaseprice() {
		return fpurchaseprice;
	}
	public void setFpurchaseprice(double fpurchaseprice) {
		this.fpurchaseprice = fpurchaseprice;
	}
	public double getFmarketprice() {
		return fmarketprice;
	}
	public void setFmarketprice(double fmarketprice) {
		this.fmarketprice = fmarketprice;
	}
	public double getFshoppingmallprice() {
		return fshoppingmallprice;
	}
	public void setFshoppingmallprice(double fshoppingmallprice) {
		this.fshoppingmallprice = fshoppingmallprice;
	}
	public int getFminrepertory() {
		return fminrepertory;
	}
	public void setFminrepertory(int fminrepertory) {
		this.fminrepertory = fminrepertory;
	}
	public FirstGoods(int ffilenumber, String fbasecolor, String fbasemodel, String fbasebrand, String fbasetype) {
		super();
		this.ffilenumber = ffilenumber;
		this.fbasecolor = fbasecolor;
		this.fbasemodel = fbasemodel;
		this.fbasebrand = fbasebrand;
		this.fbasetype = fbasetype;
	}
	public String getFifpurchase() {
		return fifpurchase;
	}
	public void setFifpurchase(String fifpurchase) {
		this.fifpurchase = fifpurchase;
	}
	public int getFsupplierid() {
		return fsupplierid;
	}
	public void setFsupplierid(int fsupplierid) {
		this.fsupplierid = fsupplierid;
	}

	
	
	
	
	
}
