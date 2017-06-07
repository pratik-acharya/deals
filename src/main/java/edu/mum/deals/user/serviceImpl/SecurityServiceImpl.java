package edu.mum.deals.user.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import edu.mum.deals.user.service.SecurityService;

@Service
public class SecurityServiceImpl implements SecurityService{

	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private AuthenticationManager authenticationManager ;

	@Override
	public String findLoggedInUsername() {
		Object userDetails = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userDetails instanceof UserDetails){
			return ((UserDetails)userDetails).getUsername();
		}
		return null;
	}

	@Override
	public void autoLogin(String username, String password) {
		UserDetails userDetails = userDetailsService.loadUserByUsername(username);
		UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, password,userDetails.getAuthorities());
		authenticationManager.authenticate(usernamePasswordAuthenticationToken);
		if(usernamePasswordAuthenticationToken.isAuthenticated()){
			SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
			System.out.println("Autologin successful");
		}
	}

	@Override
	public boolean isGuest() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication instanceof AnonymousAuthenticationToken){
			return true;
			}
		return false;
	}

}
