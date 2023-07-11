import java.util.*;
import java.io.*;

class Machine{
    public static void main(String...args) throws IOException {
        File file = new File("input.txt");
        Scanner sc = new Scanner(file);
        PrintWriter pw = new PrintWriter("output.txt");

        while(sc.hasNextLine()){
            String[] fields = sc.nextLine().split(" ");
            if(fields.length==2){
                pw.println(String.format("LDA R0,%s",fields[1]));
                pw.println(String.format("STA %s,R0",fields[0]));
            }
            else if(fields.length==4){
                pw.println(String.format("LDA R0,%s",fields[1]));
               switch(fields[2]){
                case "+":
                    pw.println(String.format("ADD R0,%s",fields[3]));
                break;
              case "-":
                    pw.println(String.format("SUB R0,%s",fields[3]));
                break;
                case "*":
                    pw.println(String.format("MUL R0,%s",fields[3]));
                break;
                case "/":
                    pw.println(String.format("DIV R0,%s",fields[3]));
                break;
                default:
                    pw.println("UNSUPPORTED");
                
               }
                pw.println(String.format("STA %s,R0",fields[0]));
            }
        }
        pw.close();
        sc.close();
       
    }
}