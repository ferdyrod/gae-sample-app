package models;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import java.util.Date;

/**
 * Created by ferdyrod on 5/2/17.
 */
@Entity
public class Motocicleta {
    @Id public Long id;

    public String make;
    public String model;
    public String year;
    @Index public Date created_at;


    public Motocicleta() {
        created_at = new Date();
    }


    public Motocicleta(String make, String model, String year) {
        this();

        this.make = make;
        this.model = model;
        this.year = year;
    }
}
