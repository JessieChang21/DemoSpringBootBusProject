package tw.bus.members.validate;

import javax.persistence.Transient;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import tw.bus.members.model.Members;

public class MembersValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Members.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Members members = (Members) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email",		"", "電子郵件欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "membername", "", "姓名欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberpwd", 	"", "密碼欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberpwd2", "", "確認密碼欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailcheck", "", "請輸入電子郵件驗證碼");
		ValidationUtils.rejectIfEmpty(errors, "agreecheckbox", "", "請閱讀後同意");

		if (members.getMemberpwd().length()<8) {
			errors.rejectValue("memberpwd","", "密碼不能小於8個字元");
			
		}
		if(! members.getMemberpwd().equals(members.getMemberpwd2())) {
			errors.rejectValue("memberpwd2","", "密碼欄與確認密碼不一致");
		}
		if(! members.getEmailcheck().equals(members.getEmailcheck2())) {
			errors.rejectValue("emailcheck","", "電子郵件驗證碼不一致");
		}
		
	}
}
