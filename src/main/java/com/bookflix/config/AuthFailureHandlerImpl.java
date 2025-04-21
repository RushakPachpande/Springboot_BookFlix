
package com.bookflix.config;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.bookflix.model.UserDtls;
import com.bookflix.repository.UserRepository;
import com.bookflix.service.UserService;
import com.bookflix.util.AppConstant;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AuthFailureHandlerImpl extends SimpleUrlAuthenticationFailureHandler {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserService userService;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		String email = request.getParameter("username");

		UserDtls userDtls = userRepository.findByEmail(email);

		if (userDtls != null) {

			if (userDtls.getIsEnable()) {

				if (userDtls.getAccountNonLocked()) {

					if (userDtls.getFailedAttempt() < AppConstant.ATTEMPT_TIME) {
						userService.increaseFailedAttempt(userDtls);
					}
					else {
						userService.userAccountLock(userDtls);
						exception = new LockedException(
								"Your account is locked!!\nFailed attempt 3\nPlease wait for 10 seconds");
					}

				}
				else {

					if (userService.unlockAccountTimeExpired(userDtls)) {
						exception = new LockedException("Your account is unlocked!!\nPlease try to login");
					}
					else {
						exception = new LockedException("Your account is Locked!!\nPlease try after 10 seconds");
					}

				}

			}
			else {
				exception = new LockedException("Your account is INACTIVE");
			}

		}
		else {
			exception = new LockedException("Email or Password is invalid");
		}

		super.setDefaultFailureUrl("/signin?error");
		super.onAuthenticationFailure(request, response, exception);
	}

}
