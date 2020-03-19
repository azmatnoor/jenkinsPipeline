import org.junit.jupiter.api.Test;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

public class BigClass1_Test {
    @Test
    void TestBigClass() {
        BigClass b1 = new BigClass();
        BigClass b2 =  new BigClass(0);
        BigClass b3 = new BigClass("null");
        BigClass b4 = new BigClass(0,"null");

        assertEquals(0, b1.number);
        assertNull(b1.text);
        assertEquals(0, b2.number);
        assertNull(b2.text);
        assertEquals(0, b3.number);
        assertEquals("null", b3.text);
        assertEquals(0, b4.number);
        assertEquals("null", b4.text);

    }
    @Test
    void TestBigClass_setNumber(){

        BigClass b2 =  new BigClass(1);
        BigClass b4 = new BigClass(1,"null");
        b2.setNumber(1);

        assertEquals(1, b2.getNumber());
        assertEquals(1, b4.number);

    }
    @Test
    void TestBigClass_setText () {
        BigClass b3 = new BigClass("null");
        BigClass b4 = new BigClass(1,"null");
        b3.setText("text");
        b4.setText("text");


        assertEquals("text", b3.getText());
        assertEquals("text", b4.getText());


    }

    @Test
    void ToUpperCase_Test(){
        BigClass b1 = new BigClass("text");

        b1.toUpperCase();
        assertEquals("TEXT", b1.text);

    }
}


