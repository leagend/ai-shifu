import streamlit_authenticator as stauth

if __name__ == "__main__":
    # 设置你期望使用的明文密码，例如 "mysecretpassword"
    plaintext_password = "mysecretpassword"
    hashed_passwords = stauth.Hasher([plaintext_password]).generate()
    print("生成的哈希值为:", hashed_passwords) 