package com.jtspringproject.JtSpringProject.controller;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
								 @RequestParam String city, @RequestParam String zipcode, @RequestParam String email) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject","root","");
			PreparedStatement pst = conn.prepareStatement("insert into payments(first_name, last_name, card_number, expiry_date, cvc, street_address, city, zip_code, email) values(?,?,?,?,?,?,?,?,?);");

			// Convert expiry date to MySQL date format
			SimpleDateFormat format1 = new SimpleDateFormat("MM/yy");
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
			Date expiryDate = format1.parse(expiry);
			String expiryDateStr = format2.format(expiryDate);

			pst.setString(1, firstName);
			pst.setString(2, lastName);
			pst.setString(3, number);
			pst.setString(4, expiryDateStr);
			pst.setString(5, cvc);
			pst.setString(6, streetaddress);
			pst.setString(7, city);
			pst.setString(8, zipcode);
			pst.setString(9, email);

			int i = pst.executeUpdate();
			System.out.println("database updated"+i);

		} catch(Exception e) {
			System.out.println("Exception: " + e);
		}
		return "redirect:/thankyou";
	}

}
