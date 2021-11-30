package tw.bus.announcemen.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import tw.bus.announcemen.model.LostAndFound;

public class LostAndFoundValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return LostAndFound.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
	
		ValidationUtils.rejectIfEmpty(errors, "itname", "LostAndFound.name.error" , "名稱欄位不能為空");
		ValidationUtils.rejectIfEmpty(errors, "itplace", "LostAndFound.place.error" , "地點欄位不能為空");
		ValidationUtils.rejectIfEmpty(errors, "itbussnumber", "LostAndFound.bussnumber.error" , "巴士編號欄位不能為空");
		ValidationUtils.rejectIfEmpty(errors, "itdate", "LostAndFound.date.error" , "日期欄位不能為空");

	}

}
