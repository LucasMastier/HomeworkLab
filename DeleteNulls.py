import pandas as pd

# Lire le fichier CSV
df = pd.read_csv(r"C:\Users\U1\Downloads\archive\user_reviews.csv\user_reviews.csv")

# Supprimer les lignes où reviewId est NULL ou vide
df_cleaned = df[df['reviewId'].notna() & (df['reviewId'] != '')]

# Sauvegarder le fichier nettoyé
df_cleaned.to_csv(r"C:\Users\U1\Downloads\archive\user_reviews.csv\user_reviews_clean.csv", index=False)
