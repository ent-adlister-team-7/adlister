import org.mindrot.jbcrypt.BCrypt;

public class Tests {
    public static void main(String[] args) {
        System.out.println(BCrypt.checkpw("Test123!@#", "$2a$10$RpHm6dSSsG3oa1H4nO0T.uFat0i1HrVy7Xch7lRDp2q0S31Tjnr.m"));
    }
}
