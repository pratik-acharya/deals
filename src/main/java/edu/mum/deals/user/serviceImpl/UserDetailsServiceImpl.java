package edu.mum.deals.user.serviceImpl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.deals.user.domain.Role;
import edu.mum.deals.user.domain.User;
import edu.mum.deals.user.repository.UserRepository;

public class UserDetailsServiceImpl implements UserDetailsService{
	@Autowired
	private UserRepository userRepository;

	@Override
	@Transactional(readOnly =true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByEmail(username);
		
		if(user==null){
			System.out.println("User not found");
			throw new UsernameNotFoundException("User not found");
		}else{
			System.out.println(user.getEmail());
		}
		return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), true, true, true, true, getGrantedAuthorities(user));
	}

	private Collection<GrantedAuthority> getGrantedAuthorities(User user) {
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(Role role: user.getRoles()){
			System.out.println(role);
			authorities.add(new SimpleGrantedAuthority("ROLE_"+role.getType()));
		}
		System.out.println(authorities);
		return authorities;
	}

}
