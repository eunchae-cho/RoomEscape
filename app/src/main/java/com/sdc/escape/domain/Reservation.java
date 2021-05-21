package com.sdc.escape.domain;

import java.sql.Date;

public class Reservation {
    private int no;
    private String roomTime;
    private Date reservatedDate;
    private boolean cancel;
    private Date canceledDate;
    private int participant;
    private String price;
    private int uno;
    private int rno;

    public int getNo() {
        return this.no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getRoomTime() {
        return this.roomTime;
    }

    public void setRoomTime(String roomTime) {
        this.roomTime = roomTime;
    }

    public Date getReservatedDate() {
        return this.reservatedDate;
    }

    public void setReservatedDate(Date reservatedDate) {
        this.reservatedDate = reservatedDate;
    }

    public boolean isCancel() {
        return this.cancel;
    }

    public void setCancel(boolean cancel) {
        this.cancel = cancel;
    }

    public Date getCanceledDate() {
        return this.canceledDate;
    }

    public void setCanceledDate(Date canceledDate) {
        this.canceledDate = canceledDate;
    }
    
    public int getParticipant() {
    	return participant;
    }
    
    public void setParticipant(int participant) {
    	 this.participant = participant;
    }

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}
}
