package com.fb.exportorder.module.customer.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fb.exportorder.models.Account;
import com.fb.exportorder.module.customer.repository.AccountRepository;

@Service("userDetailsService")
public class AccountSecurityServiceImpl implements UserDetailsService {

  @Autowired
  private AccountRepository accountRepository;

  @Transactional(readOnly = true)
  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

    Account account = accountRepository.findAccountByUsername(username);
    UserBuilder builder = null;
    if (account != null) {
      
      builder = org.springframework.security.core.userdetails.User.withUsername(username);
      builder.disabled(!account.isEnabled());
      builder.password(account.getPassword());
      String[] authorities = account.getAuthorities()
          .stream().map(a -> a.getAuthority()).toArray(String[]::new);

      builder.authorities(authorities);
    } else {
      throw new UsernameNotFoundException("User not found.");
    }
    return builder.build();
  }
}