package com.mycompany.app;

import java.util.ArrayList;
import java.util.List;

public class NNCollection {

    private List<NameNumber> nnList;

    public NNCollection() {
        nnList = new ArrayList<>();
    }

    public void addNameNumber(NameNumber nn) {
        nnList.add(nn);
    }

    public void displayAll() {
        for (NameNumber nn : nnList) {
            nn.display();
        }
    }
}
