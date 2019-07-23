package com.javasm.crm.goodsAndGifts.entity;


/**
 * Created by Mybatis Generator 2019/02/24
 */
public class Goodsquery {
	
    private Integer id;
    private String gname;
    private Integer filenumber;
    private String type;
    private String brand;
    private String model;
    private String color;
    private Integer price;
    private Integer number;
    private String status;
    private Integer code;
    public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Goodsquery() {
    }

    protected boolean canEqual(Object other) {
        return other instanceof com.javasm.crm.goodsAndGifts.entity.Goodsquery;
    }



	public Goodsquery(Integer id, String gname, Integer filenumber, String type, String brand, String model,
			String color, Integer price, Integer number, String status, Integer code) {
		super();
		this.id = id;
		this.gname = gname;
		this.filenumber = filenumber;
		this.type = type;
		this.brand = brand;
		this.model = model;
		this.color = color;
		this.price = price;
		this.number = number;
		this.status = status;
		this.code = code;
	}

	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((brand == null) ? 0 : brand.hashCode());
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result + ((color == null) ? 0 : color.hashCode());
		result = prime * result + ((filenumber == null) ? 0 : filenumber.hashCode());
		result = prime * result + ((gname == null) ? 0 : gname.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((model == null) ? 0 : model.hashCode());
		result = prime * result + ((number == null) ? 0 : number.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Goodsquery other = (Goodsquery) obj;
		if (brand == null) {
			if (other.brand != null)
				return false;
		} else if (!brand.equals(other.brand))
			return false;
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (color == null) {
			if (other.color != null)
				return false;
		} else if (!color.equals(other.color))
			return false;
		if (filenumber == null) {
			if (other.filenumber != null)
				return false;
		} else if (!filenumber.equals(other.filenumber))
			return false;
		if (gname == null) {
			if (other.gname != null)
				return false;
		} else if (!gname.equals(other.gname))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (model == null) {
			if (other.model != null)
				return false;
		} else if (!model.equals(other.model))
			return false;
		if (number == null) {
			if (other.number != null)
				return false;
		} else if (!number.equals(other.number))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Goodsquery [id=" + id + ", gname=" + gname + ", filenumber=" + filenumber + ", type=" + type
				+ ", brand=" + brand + ", model=" + model + ", color=" + color + ", price=" + price + ", number="
				+ number + ", status=" + status + ", code=" + code + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFilenumber() {
		return filenumber;
	}

	public void setFilenumber(Integer filenumber) {
		this.filenumber = filenumber;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}