package com.fb.exportorder.utilities;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Properties;

import javax.annotation.PostConstruct;

import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ResourceLoader;

import edu.vt.middleware.password.AlphabeticalSequenceRule;
import edu.vt.middleware.password.CharacterCharacteristicsRule;
import edu.vt.middleware.password.CharacterRule;
import edu.vt.middleware.password.DigitCharacterRule;
import edu.vt.middleware.password.LengthRule;
import edu.vt.middleware.password.LowercaseCharacterRule;
import edu.vt.middleware.password.MessageResolver;
import edu.vt.middleware.password.NonAlphanumericCharacterRule;
import edu.vt.middleware.password.NumericalSequenceRule;
import edu.vt.middleware.password.Password;
import edu.vt.middleware.password.PasswordData;
import edu.vt.middleware.password.QwertySequenceRule;
import edu.vt.middleware.password.RegexRule;
import edu.vt.middleware.password.Rule;
import edu.vt.middleware.password.RuleResult;
import edu.vt.middleware.password.UppercaseCharacterRule;
import edu.vt.middleware.password.WhitespaceRule;

public class PasswordValidator {
	
	@Autowired
	Environment passwordProperties;
	
	@Autowired ResourceLoader resourceLoader;
	
	List<Rule> ruleList = new ArrayList<>();
	
	edu.vt.middleware.password.PasswordValidator passwordValidator;
	
	@PostConstruct
	void inititializePasswordRules () throws IOException {
		
		Properties props = new Properties();
		
		props.load(resourceLoader.getResource("classpath:application.properties")
								 .getInputStream());
		
		MessageResolver messageResolver = new MessageResolver(props);
		
		int maxLength = Integer.parseInt(passwordProperties.getProperty("fbexport.password.validator.max-length"));
		int minLength = Integer.parseInt(passwordProperties.getProperty("fbexport.password.validator.min-length"));
		
		boolean isWhiteSpace = Boolean.parseBoolean(passwordProperties.getProperty("fbexport.password.validator.whitespace"));
		boolean isSpecialCharacters = Boolean.parseBoolean(passwordProperties.getProperty("fbexport.password.validator.special-characters"));
		boolean isCharacterRule  = Boolean.parseBoolean(passwordProperties.getProperty("fbexport.password.validator.character-rule"));
		
		int digitCharCount = Integer.parseInt(passwordProperties.getProperty("fbexport.password.validator.character-rule.digit-char-count"));
		int nonAlphaDigitCharCount = Integer.parseInt(passwordProperties.getProperty("fbexport.password.validator.character-rule.non-alpha-count"));
		
		int nonUpperCaseCount = Integer.parseInt(passwordProperties.getProperty("fbexport.password.validator.character-rule.uppercase-count"));
		int nonLowerCaseCount = Integer.parseInt(passwordProperties.getProperty("fbexport.password.validator.character-rule.lowercase-count"));
		
		boolean isAlphaSequence = Boolean.parseBoolean(passwordProperties.getProperty("fbexport.password.validator.alpha-sequence"));
		boolean isNumericSequence = Boolean.parseBoolean(passwordProperties.getProperty("fbexport.password.validator.numeric-sequence"));
		boolean isQwertySequence = Boolean.parseBoolean(passwordProperties.getProperty("fbexport.password.validator.qwerty-sequence"));
		
		System.out.println(nonUpperCaseCount);
		
		LengthRule lengthRule 
				= new LengthRule(minLength, maxLength);
		
		
		WhitespaceRule whiteSpace = (isWhiteSpace) ? new WhitespaceRule() : null;
		
		AlphabeticalSequenceRule alphabeticalSequenceRule 
							= (isAlphaSequence) ? new AlphabeticalSequenceRule() : null;
		
		NumericalSequenceRule numericalSequenceRule 
							= (isNumericSequence) ? new NumericalSequenceRule() : null;
		
		QwertySequenceRule qwertySequenceRule
							= (isQwertySequence) ? new QwertySequenceRule() : null;
							
		CharacterCharacteristicsRule charRule = null;
		
		if (isCharacterRule) {
			
			charRule = new CharacterCharacteristicsRule(); 
			List<CharacterRule> charRules = charRule.getRules();
			
			if (digitCharCount > 0)
				charRules.add(new DigitCharacterRule(digitCharCount));
			
			if (nonAlphaDigitCharCount > 0)
				charRules.add(new NonAlphanumericCharacterRule(nonAlphaDigitCharCount));
			
			if (nonUpperCaseCount > 0)
				charRules.add(new UppercaseCharacterRule(nonUpperCaseCount));
			
			if (nonLowerCaseCount > 0)
				charRules.add(new LowercaseCharacterRule(nonLowerCaseCount));
			
			charRule.setRules(charRules);
			charRule.setNumberOfCharacteristics(charRules.size());
		}
		
		System.out.println(charRule);
		
		List<Rule> ruleList = new ArrayList<>();
		
		ruleList.add(lengthRule);
		ruleList.add(whiteSpace);
		ruleList.add(charRule);
		ruleList.add(alphabeticalSequenceRule);
		ruleList.add(numericalSequenceRule);
		ruleList.add(qwertySequenceRule);
		
		ruleList.removeAll(Collections.singleton(null));
		
		passwordValidator 
				= new edu.vt.middleware.password.PasswordValidator(messageResolver, ruleList);
	
	}
	
	public RuleResult validate (String password) {
		
		return passwordValidator.validate(new PasswordData(new Password(password)));
		
	}
	
	public RuleResult validateSpecialCharacters (String password) {
		RegexRule specialCharacters = new RegexRule("^[a-zA-Z0-9\\x20]+$");
		return specialCharacters.validate(new PasswordData(new Password(password)));
	}
	
	public edu.vt.middleware.password.PasswordValidator getPasswordValidator () {
		return passwordValidator;
	}

}
