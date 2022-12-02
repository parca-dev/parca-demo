public class DemoJNI {

    static {
        System.loadLibrary("demo");
    }

    private native void nativeA1();
    private native void nativeA2();

    public void A1() {
        B1();
    }

    public void A2() {
        B2();
    }

    public void B1() {
        nativeA1();
    }

    public void B2() {
        nativeA2();
    }

    public static void main(String[] args) {
        DemoJNI obj = new DemoJNI();
        while (true) {
            System.out.println("A1");
            obj.A1();
            System.out.println("B1");
            obj.B1();
        }
    }
}
