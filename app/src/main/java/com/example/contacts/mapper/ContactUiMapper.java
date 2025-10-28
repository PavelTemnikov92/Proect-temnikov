package com.example.contacts.mapper;

import android.text.TextUtils;

import com.example.contacts.model.MergedContact;
import com.example.contacts.presentation.main.ContactUi;
import com.example.contacts.utils.model.MergedContactUtils;
import com.example.contacts.utils.model.PhoneUtils;

public class ContactUiMapper {

    public ContactUi map(MergedContact contact) {
        String displayName = (contact.getFirstName() + " " + contact.getSurname()).trim();
        String phone = PhoneUtils.format(contact.getPhone());
        if (TextUtils.isEmpty(displayName)) {
            if (!TextUtils.isEmpty(phone)) {
                displayName = phone;
                phone = "";
            } else {
                displayName = contact.getEmail();
            }
        }
        return new ContactUi(
                displayName,
                phone,
                contact.getPhotoUri(),
                MergedContactUtils.getContactTypes(contact)
        );
    }
}
