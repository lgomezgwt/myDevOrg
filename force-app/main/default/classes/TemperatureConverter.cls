public class TemperatureConverter {
	// Takes a Fahrenheit temperatyre and return the Celsius equivalent.
    public static Decimal FarenheitToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}