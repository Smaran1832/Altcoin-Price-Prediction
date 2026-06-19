# Altcoin Price Movement Prediction

## Overview

This project predicts the price movement (up/down) of various altcoins using machine learning techniques. Altcoins are cryptocurrency alternatives to Bitcoin that exhibit high volatility due to market dynamics, sentiment factors, and socioeconomic influences. By analyzing historical price data, market indicators, and sentiment analysis, this study provides actionable insights for investors and trading platforms.

## Key Findings

- **Best Performance**: Ethereum price movement predicted with **99.05% accuracy** using Random Forest Classifier (with complete feature set)
- **Alternative Approach**: 87.34% accuracy using Linear Discriminant Analysis (with technical indicators only)
- **Critical Features**: Technical indicators from Ethereum OHLC data, binary direction features, and 5-day lag features are the most significant predictors
- **Multiple Altcoins Analyzed**: Ethereum, Binance Coin, Cardano, Litecoin, Monero, Stellar, Tron, and XRP

## Project Structure

```
Altcoin-Price-Prediction/
├── data/
│   ├── raw/                             # Original unmodified OHLC data per coin
│   │   ├── Cardano/
│   │   ├── Ethereum/
│   │   ├── Litecoin/
│   │   ├── Monero/
│   │   └── Stellar/
│   ├── processed/                       # Derived datasets (lag variants, feature-selected)
│   │   ├── Binance/
│   │   ├── Cardano/
│   │   ├── Ethereum/
│   │   ├── Litecoin/
│   │   ├── Monero/
│   │   ├── Stellar/
│   │   ├── Tron/
│   │   └── Feature_Selected_4Day_Lag/   # Optimal feature sets across all coins
│   └── market_reference/                # External reference data
│       # BTC, Gold, Oil, Nasdaq, S&P500, Total Market Cap, per-coin correlation inputs
│
├── experiments/                         # Per-coin CSV datasets + experiment notebooks
│   ├── Binance/
│   ├── Cardano/
│   ├── Ethereum/
│   ├── Litecoin/
│   ├── Monero/
│   ├── Ripple/
│   ├── Stellar/
│   └── Tron/
│
├── notebooks/
│   ├── data_collection/                 # News_Scrapper, TweetScrapper, VaderSentimentsScores, Downsampler
│   ├── modelling/                       # PycaretAllModels, Forward_Selection, Random_Forest_Importance
│   ├── experimentation/                 # Experimentation_framework, Feature_importance, Verification
│   └── correlation/                     # corr, btc, nasdaq_snp notebooks + reference data
│
└── models/
    └── ETH_raw_prediction_model.pkl     # Saved Ethereum prediction model
```

## Methodology

### 1. Data Collection

**Price Data**
- Daily OHLC (Open, High, Low, Close) prices
- Trading volume and market capitalization
- Period: 2016-2022 (2,556+ days)

**Market Indicators**
- Gold and Oil prices
- Nasdaq and S&P 500 indices (prices and volumes)
- Bitcoin prices (as leading indicator)

**Sentiment Data**
- **Twitter**: Collected cryptocurrency-related tweets, analyzed using VADER sentiment
- **News**: Scraped from Investing.com, CoinDesk, and Forbes
- **Sentiment Scores**: Compound sentiment scores aggregated daily

### 2. Feature Engineering Pipeline

The project implements two parallel feature engineering approaches:

#### Approach A: Complete Feature Set (Best Results)

**Step 1: Load Base Data**
- Load Ethereum original data (2016-2022) from `2022Ethereum_Original.xlsx`
- Contains: Market indicators, sentiment scores, and macroeconomic data

**Step 2: Create Binary Direction Features**
- Convert 10 continuous features to binary directional indicators (1 = increase, 0 = decrease)
- Features converted: Gold_Price, Oil_Price, Nasdaq_Close, S&P500_Close, BTC_Close, BTC_Volume, BTC_Market_Cap, Tweets_Count, Tweets_Vader_Sentiment, News_Vader_Sentiment

**Step 3: Remove Redundant Features**
- Drop original continuous versions after creating binary features
- Remove unused macroeconomic columns: Internet_Penetration_USA, Population_USA, GDP_USA, Inflation_USA
- Remove redundant market data: Nasdaq OHLC, S&P500 OHLC, BTC OHLC

**Step 4: Create Lag Features**
- Generate 5-day lag features for Ethereum_Change
- Features: Ethereum_Change_lag_1 through Ethereum_Change_lag_5
- Captures momentum and temporal dependencies

**Step 5: Standardize Continuous Features**
- Apply StandardScaler to: BTC_Volume, BTC_Market_Cap, Tweets_Count, Tweets_Vader_Sentiment, News_Vader_Sentiment
- Improves model convergence and performance

**Step 6: Load Ethereum Market Data**
- Load OHLC data from `data/market_reference/Alt_Coin_Yearly_Rank.xlsx`
- Clean and convert string prices to numeric

**Step 7: Generate Technical Indicators** (using `ta` library)
- **Volume**: ADI, OBV, CMF, Force Index, EMV, MFI, NVI
- **Volatility**: Bollinger Bands (BBM, BBH, BBL, BBW, BBP), ATR, Keltner Channels, Donchian Channels
- **Trend**: SMA, EMA, MACD, ADX, Aroon, CCI, DPO, Ichimoku, KST, Mass Index, TRIX, Vortex
- **Momentum**: RSI, Stochastic Oscillator, TSI, UO, Williams %R, AO, KAMA, PPO, ROC
- **Additional**: Bollinger Bands (bb_bbm, bb_bbh, bb_bbl), MACD components (macd, macd_signal, macd_diff), RSI

**Step 8: Prevent Data Leakage**
- Shift ALL market and technical indicator features by -1 day
- Ensures prediction uses current day data to predict next day movement
- Drop rows with NaN values after shifting

**Step 9: Join Datasets**
- Inner join Ethereum market data (with technical indicators) and sentiment/binary features
- Final dataset: ~2,551 rows × 120 features

**Step 10: Save Final Dataset**
- Export to `Ethereum_final_dataset.csv`

#### Approach B: Technical Indicators Only (Alternative)

- Uses only Ethereum market OHLC data and technical indicators
- No sentiment or binary features
- Final dataset: ~2,551 rows × 100 features
- Results in 87.34% accuracy with LDA

**Target Variable**
- Binary classification: 1 (price increase), 0 (price decrease)
- Based on next day close price movement

### 3. Data Preparation & Validation

**Dataset Specifications**
- Original data: 2,556 days (2016-2022)
- After preprocessing: 2,551 rows
- Complete feature set: 120 features (Approach A)
- Technical indicators only: 100 features (Approach B)

**Data Splitting**
- Train set: 70% (1,785 samples)
- Test set: 30% (766 samples)
- Temporal split preserving time series order

**PyCaret Configuration**
- Session ID: 123 (for reproducibility)
- Preprocessing: Enabled
- Imputation: Simple (mean for numeric)
- Fold Generator: StratifiedKFold
- Cross-validation: 10-fold
- Normalization: Applied automatically

### 4. Model Training & Evaluation

**Models Tested** (via PyCaret compare_models)
- Random Forest Classifier
- Gradient Boosting Classifier
- Light Gradient Boosting Machine (LightGBM)
- Ada Boost Classifier
- Decision Tree Classifier
- Extra Trees Classifier
- Linear Discriminant Analysis
- Quadratic Discriminant Analysis
- K-Neighbors Classifier
- Logistic Regression
- Ridge Classifier
- Naive Bayes
- SVM (Linear Kernel)
- Dummy Classifier (baseline)

**Evaluation Metrics**
- Accuracy, AUC, Recall, Precision, F1-Score
- Kappa (Cohen's Kappa)
- MCC (Matthews Correlation Coefficient)
- TT (Training Time in seconds)

## Results

### Approach A: Complete Feature Set (120 Features)

**Top Model Performance (Ethereum)**

| Model | Accuracy | AUC | Recall | Precision | F1 | Kappa | MCC | Time (s) |
|-------|----------|-----|--------|-----------|----|----|-----|----------|
| **Random Forest** | **99.05%** | **99.58%** | **99.00%** | **99.13%** | **99.06%** | **0.9810** | **0.9810** | **0.081** |
| Gradient Boosting | 98.71% | 99.73% | 98.67% | 98.79% | 98.73% | 0.9742 | 0.9743 | 0.526 |
| LightGBM | 98.71% | 99.80% | 98.78% | 98.69% | 98.73% | 0.9742 | 0.9744 | 0.296 |
| Ada Boost | 98.54% | 99.72% | 98.12% | 99.01% | 98.56% | 0.9709 | 0.9710 | 0.124 |
| Decision Tree | 98.38% | 98.37% | 98.45% | 98.36% | 98.40% | 0.9675 | 0.9677 | 0.019 |
| Extra Trees | 89.80% | 96.23% | 88.94% | 90.89% | 89.85% | 0.7961 | 0.7972 | 0.048 |
| Linear Discriminant Analysis | 87.34% | 95.30% | 87.83% | 87.45% | 87.55% | 0.7468 | 0.7483 | 0.013 |

### Approach B: Technical Indicators Only (100 Features)

**Top Model Performance (Ethereum)**

| Model | Accuracy | AUC | Recall | Precision | F1 | Kappa | MCC | Time (s) |
|-------|----------|-----|--------|-----------|----|----|-----|----------|
| **Random Forest** | **99.05%** | **99.78%** | **99.00%** | **99.12%** | **99.06%** | **0.9811** | **0.9811** | **0.070** |
| Gradient Boosting | 98.71% | 99.77% | 98.56% | 98.90% | 98.73% | 0.9742 | 0.9743 | 0.436 |
| LightGBM | 98.71% | 99.83% | 98.78% | 98.68% | 98.73% | 0.9742 | 0.9743 | 0.267 |
| Ada Boost | 98.60% | 99.77% | 98.34% | 98.90% | 98.62% | 0.9720 | 0.9721 | 0.117 |
| Decision Tree | 98.43% | 98.43% | 98.56% | 98.35% | 98.45% | 0.9686 | 0.9688 | 0.018 |

### Feature Importance

**Top Predictors** (in order of impact):
1. **Technical Indicators from Ethereum Market Data** (OHLC, Volume, Bollinger Bands, RSI, MACD)
2. **Binary Direction Features** (BTC price movement, Market indicators movement)
3. **Lag Features** (Previous 5 days of Ethereum price changes)
4. **Sentiment Features** (Twitter VADER scores, News sentiment - standardized)
5. **Market Indicators** (Nasdaq, S&P 500 binary movements)

### Performance by Altcoin

| Altcoin | Best Accuracy | Best Model | Feature Set |
|---------|---------------|------------|-------------|
| Ethereum | 99.05% | Random Forest | Complete (120 features) |
| Others | Similar trend expected | Random Forest/Gradient Boosting | Complete |

## Installation & Usage

### Requirements

```bash
pip install pandas numpy matplotlib
pip install pycaret ta scikit-learn
pip install beautifulsoup4 requests
pip install vaderSentiment
```

### Quick Start

```python
import pandas as pd
from pycaret.classification import *

# Load processed dataset
data = pd.read_csv('experiments/Ethereum/RawTechnical_plus_Old.csv')

# Setup experiment
clf = setup(data=data, target='Price_Direction', 
            session_id=123, normalize=True, transformation=True)

# Compare models
best_model = compare_models()

# Tune and finalize
tuned = tune_model(best_model)
final = finalize_model(tuned)

# Save model
save_model(final, 'eth_price_predictor')
```

### Data Collection Pipeline

1. **Scrape News**: Run `notebooks/data_collection/News_Scrapper.ipynb` to collect articles
2. **Scrape Tweets**: Run `notebooks/data_collection/TweetScrapper.ipynb` for social sentiment
3. **Calculate Sentiment**: Use `notebooks/data_collection/VaderSentimentsScores.ipynb`
4. **Process Features**: Run `notebooks/experimentation/Experimentation_framework.ipynb`

## Experiment Configurations

### Configuration 1: Complete Feature Set
- **Features**: 120 (Technical indicators + Sentiment + Binary + Lag features)
- **Best Model**: Random Forest (99.05% accuracy)
- **Dataset**: `experiments/Ethereum/Ethereum_final_dataset.csv`
- **Strengths**: Highest accuracy, captures all market dynamics
- **Use Case**: Maximum predictive power

### Configuration 2: Technical Indicators Only
- **Features**: 100 (Only Ethereum OHLC + Technical indicators)
- **Best Model**: Random Forest (99.05% accuracy)
- **Strengths**: No dependency on external data sources
- **Use Case**: Real-time trading without sentiment data

### Configuration 3: Linear Models (Interpretable)
- **Features**: 100-120
- **Best Model**: Linear Discriminant Analysis (87.34% accuracy)
- **Strengths**: Fast training (<0.02s), interpretable
- **Use Case**: When model interpretability is required

## Key Insights

1. **Exceptional Accuracy**: Random Forest achieves 99.05% accuracy with proper feature engineering and data preparation
2. **Technical Indicators Dominate**: Technical indicators from OHLC data are the strongest predictors (similar performance with/without sentiment data)
3. **Data Leakage Prevention**: Shifting all features by -1 day is critical - ensures model predicts future movement using only current information
4. **Binary Features Add Value**: Converting continuous features to directional indicators improves interpretability
5. **Lag Features Essential**: 5-day lag features capture momentum patterns crucial for prediction
6. **Fast Training**: Tree-based models train in <1 second, suitable for production deployment
7. **Model Selection**: Random Forest and Gradient Boosting consistently outperform linear models by ~12%
8. **Feature Standardization**: Standardizing volume and sentiment features improves all model types
9. **Cross-validation Stability**: 10-fold CV shows consistent results, indicating robust feature set
10. **Ensemble Methods**: Tree-based ensembles excel at capturing non-linear relationships in crypto markets

## Applications

- **Algo Trading Platforms**: Automated trading signals
- **Financial Advisors**: Portfolio diversification strategies
- **Risk Management**: Hedge against crypto volatility
- **Researchers**: Baseline for sentiment-driven crypto prediction

## Future Work

- Real-time prediction pipeline
- Deep learning models (LSTM, Transformer)
- Multi-step ahead forecasting
- Additional sentiment sources (Reddit, Telegram)
- Transfer learning across altcoins

## Contributors & References

This research demonstrates that machine learning combined with proper feature engineering and sentiment analysis can effectively predict cryptocurrency price movements, achieving state-of-the-art results of nearly 80% accuracy compared to existing literature benchmarks of 60-70%.

## License

This project is for educational and research purposes. Cryptocurrency trading involves significant risk. Use predictions responsibly.

---

**Note**: Past performance does not guarantee future results. This model should be used as one of many tools in investment decision-making, not as the sole basis for trading decisions.
