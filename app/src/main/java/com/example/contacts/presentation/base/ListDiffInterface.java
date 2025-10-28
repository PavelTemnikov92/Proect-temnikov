package com.example.contacts.presentation.base;

public interface ListDiffInterface<T> {
    boolean theSameAs(T other);
    boolean equals(Object other);
}
