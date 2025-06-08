<%-- 
    Jason Schriner 
    Module 3 
    6/8/25 
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Feedback</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h1>Please Leave a Review</h1>
        
       <%
            if(request.getMethod().equals("GET")){
        %>
        <!-- Form to display Input results -->
        <form action='Post.jsp' method='post'>
            <p>
    		<label>
        		How did you hear about us?
        		<br />
    		</label>

			    <select name='how_did_you_hear'>
			        <option selected='selected' value='nothing_selected'>Please Select an Option</option>
			        <option value='friend'>Friend or Family</option>
			        <option value='social_media'>Social Media</option>
			        <option value='google'>Google</option>
			        <option value='advertisement'>Advertisement</option>
			        <option value='website'>Our Website</option>
			        <option value='other'>Other</option>
			    </select>
			</p>
             <!-- Radio buttons for experience satisfaction -->
            <p>
            <label>
                   How Happy are you with your overall Experience?
                    <br />
                </label>
                <label>
                    Very Satisfied
                    <input name='experience' type='radio' value='Very Satisfied' checked='checked' />
                </label>
                <br />
                <label>
                    Satisfied
                    <input name='experience' type='radio' value='Satisfied' />
                </label>
                <br />
                <label>
                    Unsastified
                    <input name='experience' type='radio' value='Unsatisfied' />
                </label>
                <br />
                <label>
                    Not Satisfied or Dissatisfied
                    <input name='experience' type='radio' value='Neutral' />
                </label>
            </p>
             <!-- Radio buttons for how likely they are to return -->
            <p>
            <label>
                   How Likely are you to Dine here again?
                    <br />
                </label>
                <label>
                    Very Likely
                    <input name='dineAgain' type='radio' value='Very Likely' checked='checked' />
                </label>
                <br />
                <label>
                    Somewhat likely
                    <input name='dineAgain' type='radio' value='Somewhat Likely' />
                </label>
                <br />
                <label>
                    Likely
                    <input name='dineAgain' type='radio' value='Likely' />
                </label>
                <br />
                <label>
                    Unlikely
                    <input name='dineAgain' type='radio' value='Unlikely' />
                </label>
            </p>
             <!-- Checkboxes for what they liked -->
            <p>
             <label>
                   What are some things you enjoyed about your experience?
                    <br />
                    Please check all that apply.
                    <br />
                </label>
                <label>
                    Food
                    <input name='enjoyed' type='checkbox' value='Food' />
                    <br />
                </label>
                <label>
                    Atmosphere
                    <input name='enjoyed' type='checkbox' value='Atmosphere' />
                    <br />
                </label>
                <label>
                    Service
                    <input name='enjoyed' type='checkbox' value='Service' />
                    <br />
                </label>
                <label>
                    Value
                    <input name='enjoyed' type='checkbox' value='Value' />
                    <br />
                </label>
            </p> 
             <!-- Comment Section -->
            <p>
                <label>
                    Comments:
                    <br />
                </label>
                <textarea name='textarea' rows='6' cols='20'></textarea>
            </p>
            <p>
                <input type='submit' value='Submit' />
            </p>
            <p>
                <input type='reset' value='Clear Entries' />
            </p>
        </form>
        <%
            }
        %> 
       
</body>
</html>