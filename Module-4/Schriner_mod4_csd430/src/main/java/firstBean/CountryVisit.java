package firstBean;

/*
 * Jason Schriner
 * Module 4
 * 6/14/25
 */

public class CountryVisit implements java.io.Serializable {

    private String country;
    private String city;
    private String yearVisited;

    // No-arg constructor
    public CountryVisit() {}

    // Parameterized constructor
    public CountryVisit(String country, String city, String yearVisited) {
        this.country = country;
        this.city = city;
        this.yearVisited = yearVisited;
    }

    // Getter and Setter methods
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getYearVisited() {
        return yearVisited;
    }

    public void setYearVisited(String yearVisited) {
        this.yearVisited = yearVisited;
    }
}
