public class BigClass {
    public int number;
    public String text;

    public BigClass(){
        this.number = 0;
        this.text = null;
    }
    public BigClass(int number){
        setNumber(number);
        this.text = null;
    }
    public BigClass(String text){
        this.number = 0;
        setText(text);
    }
    public BigClass(int number, String text){
        setNumber(number);
        setText(text);
    }

    public int getNumber() {
        return number;
    }
    public void setNumber(int number){
        if(number < 0){
            System.out.println("Please enter a positive number. All negative numbers will be rejected.");
        } else {
            this.number = number;
        }
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void toUpperCase(){
        this.text = this.text.toUpperCase();
    }
    public void toNull(){
        this.text = null;
    }
}
