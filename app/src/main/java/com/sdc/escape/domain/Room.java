package com.sdc.escape.domain;

public class Room {
    private int no;
    private String title;
    private String content;
    private int level;
    private int participant;

    public int getNo() {
        return this.no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getLevel() {
        return this.level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getParticipant() {
        return this.participant;
    }

    public void setParticipant(int participant) {
        this.participant = participant;
    }
}
