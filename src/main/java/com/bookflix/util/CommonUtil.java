
package com.bookflix.util;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.bookflix.model.ProductOrder;
import com.bookflix.model.UserDtls;
import com.bookflix.service.UserService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;

@Component
public class CommonUtil {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private UserService userService;

	String msg = null;

	public Boolean sendMail(String url, String reciepentEmail) throws UnsupportedEncodingException, MessagingException {

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom("bookflix31@gmail.com", "BookFlix");
		helper.setTo(reciepentEmail);

		String content = "<p>Hello,</p>" + "<p>You have requested to reset your password.</p>"
				+ "<p>Click the link below to change your password:</p>" + "<p><a href=\"" + url
				+ "\">Change my password</a></p>";
		helper.setSubject("Password Reset");
		helper.setText(content, true);
		mailSender.send(message);
		return true;
	}

	public static String generateUrl(HttpServletRequest request) {
		String siteUrl = request.getRequestURL().toString();
		return siteUrl.replace(request.getServletPath(), "");
	}

	public Boolean sendMailForOrder(List<ProductOrder> orders, String status) throws Exception {

		if (orders == null || orders.isEmpty()) { throw new IllegalArgumentException("Order list is empty"); }

		ProductOrder firstOrder = orders.get(0); // To get user and address details
		StringBuilder productDetails = new StringBuilder();

		for (ProductOrder order : orders) {
			productDetails.append("<p><b>Product:</b></p>").append("<p>Name : ").append(order.getProduct().getTitle())
					.append("</p>").append("<p>Category : ").append(order.getProduct().getCategory()).append("</p>")
					.append("<p>Quantity : ").append(order.getQuantity()).append("</p>").append("<p>Price : ")
					.append(order.getPrice()).append("</p>").append("<p>Payment Type : ").append(order.getPaymentType())
					.append("</p>").append("<hr>");
		}

		String msg = "<p>Hello [[name]],</p>"
				+ "<p>Thank you for your order. Your current order status is <b>[[orderStatus]]</b>.</p>"
				+ "<p><b>Order Summary:</b></p>" + productDetails.toString();

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom("bookflix31@gmail.com", "BookFlix");
		helper.setTo(firstOrder.getOrderAddress().getEmail());

		msg = msg.replace("[[name]]", firstOrder.getOrderAddress().getFullName());
		msg = msg.replace("[[orderStatus]]", status);

		helper.setSubject("Your BookFlix Order Status");
		helper.setText(msg, true);
		mailSender.send(message);

		return true;
	}

	public Boolean sendMailForProductOrder(ProductOrder order, String status) throws Exception {

		msg = "<p>Hello [[name]],</p>" + "<p>Thank you order <b>[[orderStatus]]</b>.</p>"
				+ "<p><b>Product Details:</b></p>" + "<p>Name : [[productName]]</p>" + "<p>Category : [[category]]</p>"
				+ "<p>Quantity : [[quantity]]</p>" + "<p>Price : [[price]]</p>"
				+ "<p>Payment Type : [[paymentType]]</p>";

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom("bookflix31@gmail.com", "BookFlix");
		helper.setTo(order.getOrderAddress().getEmail());

		msg = msg.replace("[[name]]", order.getOrderAddress().getFullName());
		msg = msg.replace("[[orderStatus]]", status);
		msg = msg.replace("[[productName]]", order.getProduct().getTitle());
		msg = msg.replace("[[category]]", order.getProduct().getCategory());
		msg = msg.replace("[[quantity]]", order.getQuantity().toString());
		msg = msg.replace("[[price]]", order.getPrice().toString());
		msg = msg.replace("[[paymentType]]", order.getPaymentType());

		helper.setSubject("Product Order Status");
		helper.setText(msg, true);
		mailSender.send(message);
		return true;
	}

	public UserDtls getLoggedInUserDetails(Principal p) {
		String email = p.getName();
		UserDtls userDtls = userService.getUserByEmail(email);
		return userDtls;
	}

}
