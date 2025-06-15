package firstBean;

/*
 * Jason Schriner
 * Module 4
 * 6/14/25
 */

/*
 * I created this class to hold the data I used in Module 2
 * If I understood this project correctly I created a bean to
 * set and get the data and then created a jsp to display the data
 * but I needed to store the data somewhere
 */

import java.util.ArrayList;
import java.util.List;

public class TravelHistory {

    private List<CountryVisit> visits;

    public TravelHistory() {
        visits = new ArrayList<>();

        visits.add(new CountryVisit("Japan", "Misawa", "2003"));
        visits.add(new CountryVisit("Mexico", "Cozumel", "2006"));
        visits.add(new CountryVisit("Panama", "Panama City", "2006"));
        visits.add(new CountryVisit("Ukraine", "Cherkassy", "2017"));
        visits.add(new CountryVisit("Ukraine", "Kiev", "2018"));
    }

    public List<CountryVisit> getVisits() {
        return visits;
    }

    public void setVisits(List<CountryVisit> visits) {
        this.visits = visits;
    }
}
