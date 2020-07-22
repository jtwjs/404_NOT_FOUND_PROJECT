package com.spring.util;

public class PageMaker {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int calcEnd;
	private int page_num;
	private int page_amount;
	private int total;
	
	public PageMaker(int page_num, int page_amount, int total) {
		
		this.page_num = page_num;
		this.page_amount = page_amount;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(this.page_num / 10.0)) * 10;
    	this.startPage = this.endPage - 9;
    	
    	this.calcEnd = (int)(Math.ceil((this.total * 1.0) / this.page_amount));
    	
    	if(this.endPage > this.calcEnd) {
    		this.endPage = this.calcEnd;
    	}
    	
    	this.prev = this.startPage > 1;
    	this.next = this.endPage < this.calcEnd;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getCalcEnd() {
		return calcEnd;
	}

	public void setCalcEnd(int calcEnd) {
		this.calcEnd = calcEnd;
	}

	public int getPage_num() {
		return page_num;
	}

	public void setPage_num(int page_num) {
		this.page_num = page_num;
	}

	public int getPage_amount() {
		return page_amount;
	}

	public void setPage_amount(int page_amount) {
		this.page_amount = page_amount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
