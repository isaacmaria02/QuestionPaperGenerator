package com.model;

import java.util.ArrayList;
import java.util.List;

public class Question {
	
	private String question;
	private List<String> choice = new ArrayList<>() ;
	private List<String> ans = new ArrayList<>();
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
		for(String x:choice)
		{
			this.choice.add(x);
		}
		
		
	}
	public List<String> getAns() {
		return ans;
	}
	public void setAns(List<String> ans) {
		for(String x:ans)
		{
			this.ans.add(x);
		}
		
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
