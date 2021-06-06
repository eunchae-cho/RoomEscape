package com.sdc.escape.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


public class Reservation {
    private int no;
    private String roomTime;
    private Date reservatedDate;
  // @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
    private String doDate;
    // cancel =>  default: 0, 예약 취소: 1
    private int cancel;
    private Date canceledDate;
    private int participant;
    private String price;
    private int uno;
    private int rno;
    // status => default / 예약: 0, 예약취소: 1, 종료: 2
    private int status;
    private Room room;

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
    
    public String getDoDate() {
		return doDate;
	}

	public void setDoDate(String doDate) {
		this.doDate = doDate;
	}

	public int getCancel() {
        return this.cancel;
    }

    public void setCancel(int cancel) {
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}
}
