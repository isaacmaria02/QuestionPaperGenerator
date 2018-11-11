package com.model;

import java.util.List;

public class Question {
	
	private String question;
	private List<String> choice;
	private List<String> ans;
	private String category;
	private int difficulty;
	
	
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public List<String> getChoice() {
		return choice;
	}
	public void setChoice(List<String> choice) {
		this.choice = choice;
	}
	public List<String> getAns() {
		return ans;
	}
	public void setAns(List<String> ans) {
		this.ans = ans;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}
	@Override
	public String toString() {
		return "Question [question=" + question + ", choice=" + choice + ", ans=" + ans + ", category=" + category
				+ ", difficulty=" + difficulty + "]";
	}
	
	
	
	

}
