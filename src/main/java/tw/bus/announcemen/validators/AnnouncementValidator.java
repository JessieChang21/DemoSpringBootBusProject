package tw.bus.announcemen.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import tw.bus.announcemen.model.Announcement;

public class AnnouncementValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Announcement.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
	
		ValidationUtils.rejectIfEmpty(errors, "antitle", "Announcement.title.error" , "主旨欄位不能為空");
		ValidationUtils.rejectIfEmpty(errors, "ancontent", "Announcement.title.error" , "內容欄位不能為空");
		ValidationUtils.rejectIfEmpty(errors, "ancategory", "Announcement.title.error" , "類別欄位不能為空");

	}

}
