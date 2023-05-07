package com.jtspringproject.JtSpringProject.controller;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController{

	@GetMapping("/register")
	public String registerUser()
	{
		return "register";
	}
	@GetMapping("/contact")
	public String contact()
	{
		return "contact";
	}
	@GetMapping("/buy")
	public String buy()
	{
		return "buy";
	}

	@GetMapping("/thankyou")
	public String thankyou(){return "thankyou";}

	@GetMapping("/user/products")
	public String getproduct(Model model) {
		return "uproduct";
	}

	@RequestMapping(value = "newuserregister", method = RequestMethod.POST)
	public String newUseRegister(@RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("email") String email)
	{
		try
		{
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject","root","");
			PreparedStatement pst = con.prepareStatement("insert into users(username,password,email) values(?,?,?);");
			pst.setString(1,username);
			pst.setString(2, password);
			pst.setString(3, email);
			

			//pst.setString(4, address);
			int i = pst.executeUpdate();
			System.out.println("data base updated"+i);
			
		}
		catch(Exception e)
		{
			System.out.println("Exception:"+e);
		}
		return "redirect:/";
	}
	@GetMapping("/add_review")
	public String showAddReviewForm(Model model) {
		// Add any necessary model attributes here
		return "add_review";
	}

	@PostMapping("/add_review")
	public String addReview(@RequestParam("name") String name, @RequestParam("rating") int rating,
							@RequestParam("image") MultipartFile image, @RequestParam("text") String text) {

		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject","root","");
			PreparedStatement pst = conn.prepareStatement("insert into reviews(name, rating, image, text) values(?,?,?,?);");
			pst.setString(1, name);
			pst.setInt(2, rating);
			if(image != null && !image.isEmpty()) {
				pst.setBinaryStream(3, image.getInputStream());
			} else {
				pst.setNull(3, Types.BLOB);
			}
			pst.setString(4, text);
			pst.executeUpdate();
			System.out.println("database updated");
			conn.close();
		} catch(Exception e) {
			System.out.println("Exception: " + e);
		}
		return "redirect:/index";
	}


	@PostMapping("/process-payment")
	public String processPayment(@RequestParam("first-name") String firstName, @RequestParam("last-name") String lastName, @RequestParam String number,
								 @RequestParam String expiry, @RequestParam String cvc, @RequestParam String streetaddress,
								 @RequestParam String city, @RequestParam String zipcode, @RequestParam String email, HttpServletRequest request) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject","root","");

			// Get the user_id of the current logged in user
			String username = (String) request.getSession().getAttribute("username");
			PreparedStatement userStmt = conn.prepareStatement("SELECT user_id FROM users WHERE username = ?");
			userStmt.setString(1, username);
			ResultSet userResult = userStmt.executeQuery();
			int userId = -1;
			if (userResult.next()) {
				userId = userResult.getInt("user_id");
			}
			System.out.println("Username: " + username);
			System.out.println("User ID: " + userId);

			// Insert the payment details into the payments table
			PreparedStatement paymentStmt = conn.prepareStatement("INSERT INTO payments (first_name, last_name, card_number, expiry_date, cvc, street_address, city, zip_code, email, order_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

			// Convert expiry date to MySQL date format
			SimpleDateFormat format1 = new SimpleDateFormat("MM/yy");
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
			Date expiryDate = format1.parse(expiry);
			String expiryDateStr = format2.format(expiryDate);

			paymentStmt.setString(1, firstName);
			paymentStmt.setString(2, lastName);
			paymentStmt.setString(3, number);
			paymentStmt.setString(4, expiryDateStr);
			paymentStmt.setString(5, cvc);
			paymentStmt.setString(6, streetaddress);
			paymentStmt.setString(7, city);
			paymentStmt.setString(8, zipcode);
			paymentStmt.setString(9, email);
			paymentStmt.setInt(10, userId);

			int i = paymentStmt.executeUpdate();
			System.out.println("database updated"+i);

		} catch(Exception e) {
			System.out.println("Exception: " + e);
		}
		return "redirect:/thankyou";
	}


}
