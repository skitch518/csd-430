package tag.example;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/*
 * Jason Schriner
 * Module 10
 * 7/20/25
 * Custom Tag example code
 */

// We create a custom tag handler class
public class MyCustomTagHandler extends SimpleTagSupport {
    
	// Need to declare any variable that we might need to import
	private String message;

    
	// Setter method
	public void setMessage(String message) {
        this.message = message;
    }

    
    // Need to override otherwise it will automatically be called
	// logic is contained inside this method
    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        out.println("Custom Tag says: " + message);
    }
}
