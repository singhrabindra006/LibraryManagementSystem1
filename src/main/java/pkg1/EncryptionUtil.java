package pkg1;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.io.File;
import java.io.IOException;

public class EncryptionUtil {

    private static final String ALGORITHM = "AES";
    private static final String TRANSFORMATION = "AES/ECB/PKCS5Padding";
    private static final String KEY_FILE_PATH = System.getProperty("user.home") + File.separator + "key.txt"; // Use user's home directory

    // Generate and save the key if it doesn't exist
    public static SecretKey generateAndSaveKey() throws Exception {
        SecretKey secretKey;
        File keyFile = new File(KEY_FILE_PATH);

        if (keyFile.exists()) {
            secretKey = readKeyFromFile();
        } else {
            KeyGenerator keyGenerator = KeyGenerator.getInstance(ALGORITHM);
            secretKey = keyGenerator.generateKey();
            try (FileOutputStream keyOut = new FileOutputStream(KEY_FILE_PATH);
                 ObjectOutputStream oos = new ObjectOutputStream(keyOut)) {
                oos.writeObject(secretKey);
            }
        }

        return secretKey;
    }

    // Read the key from file
    public static SecretKey readKeyFromFile() throws IOException, ClassNotFoundException {
        try (FileInputStream keyIn = new FileInputStream(KEY_FILE_PATH);
             ObjectInputStream ois = new ObjectInputStream(keyIn)) {
            return (SecretKey) ois.readObject();
        }
    }

    // Encrypt password
    public static String encryptPassword(String password) throws Exception {
        SecretKey secretKey = generateAndSaveKey();
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);

        byte[] encryptedBytes = cipher.doFinal(password.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    // Decrypt password
    public static String decryptPassword(String encryptedPassword) throws Exception {
        SecretKey secretKey = readKeyFromFile();
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.DECRYPT_MODE, secretKey);

        byte[] encryptedBytes = Base64.getDecoder().decode(encryptedPassword);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        return new String(decryptedBytes, StandardCharsets.UTF_8);
    }
}
