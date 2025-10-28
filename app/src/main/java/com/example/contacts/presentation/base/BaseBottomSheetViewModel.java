package com.example.contacts.presentation.base;

import androidx.lifecycle.ViewModel;

public abstract class BaseBottomSheetViewModel extends ViewModel {
    abstract public void onApplyClick();
    abstract public void onResetClick();
}
