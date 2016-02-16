package calc;

import java.util.ArrayList;
import java.util.regex.Pattern;

public class calc 
{	
	Float sum;
	String append = "0";
	StringBuilder number = new StringBuilder();
	ArrayList<Float> numbers = new ArrayList<Float>();
	ArrayList<String> operations = new ArrayList<String>();
	
	public calc(){
	}
	public String print(String str){
		for(int i=0; i < str.length(); i++){
			operator(String.valueOf(str.charAt(i)));
		}
		return append;
	}
	private void operator(String str){
		if(operations.lastIndexOf("=") > 0){
			operations.clear();
		}
		boolean isNumber = Pattern.matches("^[0-9]*$", str);
		if(isNumber){
			number.append(str);
			if(append.equals("0")){
				append = str;
			}
			else if(append.equals("0")){
				
			}
			else{
				append += str;
			}
		}
		else if(str.equals(".")){
			number.append(str);
			if(number.indexOf(".") < 0){
				append += str;
			}
		}
		else if(str.equals("=")){
			numbers.add(Float.parseFloat(number.toString()));
			numberClear();
			append = calculate();
			operations.add(str);
			clear();
		}
		else if(str.equals("ce") || str.equals("c")){
			append = "0";
			operations.clear();
			clear();
		}
		else{
			numbers.add(Float.parseFloat(number.toString()));
			numberClear();
			append += str;
			operations.add(str);
		}
		
	}
	private String calculate(){
		for(int i=0; i < operations.size(); i++){
			if(operations.get(i)==null){
				break;
			}
			if(sum==null){
				sum = (float) numbers.get(i);
			}
			
			if(operations.get(i).equals("+")){
				sum = sum + numbers.get(i+1);
			}
			else if(operations.get(i).equals("-")){
				sum = sum - numbers.get(i+1);
			}
			else if(operations.get(i).equals("*")){
				sum = sum * numbers.get(i+1);
			}
			else if(operations.get(i).equals("/")){
				sum = sum / numbers.get(i+1);
			}
		}
		return sum.toString();
	}
	private void numberClear(){
		number = null;
		number = new StringBuilder();
	}
	private void clear(){
		numbers.clear();
		numberClear();
		sum = null;
	}
}
