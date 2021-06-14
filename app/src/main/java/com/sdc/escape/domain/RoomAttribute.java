package com.sdc.escape.domain;

public class RoomAttribute {
	private int rno;
    private String reasoning;
    private String observation;
    private String horror;
    private String activity;

    
    public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getReasoning() {
        return this.reasoning;
    }

    public void setReasoning(String reasoning) {
        this.reasoning = reasoning;
    }

    public String getObservation() {
        return this.observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    public String getHorror() {
        return this.horror;
    }

    public void setHorror(String horror) {
        this.horror = horror;
    }

    public String getActivity() {
        return this.activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

}
