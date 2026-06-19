#!/usr/bin/env bash
# Run this script from the repo root in Git Bash:
#   bash restructure.sh

set -e  # stop immediately if any command fails

echo "=== Creating new directory structure ==="
mkdir -p data/raw/Cardano
mkdir -p data/raw/Ethereum
mkdir -p data/raw/Litecoin
mkdir -p data/raw/Monero
mkdir -p data/raw/Stellar
mkdir -p data/processed/Binance
mkdir -p data/processed/Cardano
mkdir -p data/processed/Ethereum
mkdir -p data/processed/Litecoin
mkdir -p data/processed/Monero
mkdir -p data/processed/Stellar
mkdir -p data/processed/Tron
mkdir -p data/processed/Feature_Selected_4Day_Lag
mkdir -p data/market_reference
mkdir -p experiments/Binance
mkdir -p experiments/Cardano
mkdir -p experiments/Ethereum
mkdir -p experiments/Litecoin
mkdir -p experiments/Monero
mkdir -p experiments/Ripple
mkdir -p experiments/Stellar
mkdir -p experiments/Tron
mkdir -p notebooks/data_collection
mkdir -p notebooks/modelling
mkdir -p notebooks/experimentation
mkdir -p notebooks/correlation
mkdir -p models

echo "=== Moving raw data ==="
git mv 'Cardano/2022Cardano_Original.xlsx'   'data/raw/Cardano/2022Cardano_Original.xlsx'
git mv 'Ethereum/2022Ethereum_Original.xlsx' 'data/raw/Ethereum/2022Ethereum_Original.xlsx'
git mv 'Ethereum/2022Coin_NumericBase.xlsx'  'data/raw/Ethereum/2022Coin_NumericBase.xlsx'
git mv 'Litecoin/2022Litecoin_Original.xlsx' 'data/raw/Litecoin/2022Litecoin_Original.xlsx'
git mv 'Monero/2022Monero_Original.xlsx'     'data/raw/Monero/2022Monero_Original.xlsx'
git mv 'Stellar/2022Stellar_Original.xlsx'   'data/raw/Stellar/2022Stellar_Original.xlsx'

echo "=== Moving processed/Binance ==="
git mv 'Binance/0 day lag individual.xlsx'                                                 'data/processed/Binance/0 day lag individual.xlsx'
git mv 'Binance/1 day lag individual.xlsx'                                                 'data/processed/Binance/1 day lag individual.xlsx'
git mv 'Binance/2 day lag combined.xlsx'                                                   'data/processed/Binance/2 day lag combined.xlsx'
git mv 'Binance/2 day lag individual.xlsx'                                                 'data/processed/Binance/2 day lag individual.xlsx'
git mv 'Binance/2022Binance_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx' 'data/processed/Binance/2022Binance_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'
git mv 'Binance/3 day lag combined.xlsx'                                                   'data/processed/Binance/3 day lag combined.xlsx'
git mv 'Binance/3 day lag individual.xlsx'                                                 'data/processed/Binance/3 day lag individual.xlsx'
git mv 'Binance/4 day lag combined.xlsx'                                                   'data/processed/Binance/4 day lag combined.xlsx'
git mv 'Binance/4 day lag individual.xlsx'                                                 'data/processed/Binance/4 day lag individual.xlsx'

echo "=== Moving processed/Cardano ==="
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved.xlsx'                                        'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin.xlsx'                         'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'         'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_1,2and3daylag.xlsx'           'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_1,2and3daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_1and2daylag.xlsx'             'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_1and2daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_1daylag.xlsx'                 'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_1daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_2daylag.xlsx'                 'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_2daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_3daylag.xlsx'                 'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_3daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_4daylag.xlsx'                 'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_bin_4daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num.xlsx'                         'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_1and2daylag.xlsx'             'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_1and2daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_1daylag.xlsx'                 'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_1daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_2daylag.xlsx'                 'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_2daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_BTC_bin_1and2daylag.xlsx'     'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_BTC_bin_1and2daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_BTC_bin_1daylag.xlsx'         'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_BTC_bin_1daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_BTC_bin_2daylag.xlsx'         'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_All_Change_num_BTC_bin_2daylag.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_BTC_num.xlsx'                                'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_BTC_num.xlsx'
git mv 'Cardano/2022Cardano_Original_LowCloseRemoved_BTC_num_bin.xlsx'                            'data/processed/Cardano/2022Cardano_Original_LowCloseRemoved_BTC_num_bin.xlsx'

echo "=== Moving processed/Ethereum ==="
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved.xlsx'                                         'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin.xlsx'                          'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'          'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_1,2and3daylag.xlsx'            'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_1,2and3daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_1and2daylag.xlsx'              'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_1and2daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_1daylag.xlsx'                  'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_1daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_2daylag.xlsx'                  'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_2daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_3daylag.xlsx'                  'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_3daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_4daylag.xlsx'                  'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_4daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num.xlsx'                          'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_1and2daylag.xlsx'              'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_1and2daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_1daylag - Copy.xlsx'           'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_1daylag - Copy.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_1daylag.xlsx'                  'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_1daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_2daylag.xlsx'                  'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_2daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_BTC_bin_1and2daylag.xlsx'      'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_BTC_bin_1and2daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_BTC_bin_2daylag.xlsx'          'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_All_Change_num_BTC_bin_2daylag.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_BTC_num.xlsx'                                 'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_BTC_num.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_BTC_num_bin.xlsx'                             'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_BTC_num_bin.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_BTC_num_bin_1and2day.xlsx'                    'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_BTC_num_bin_1and2day.xlsx'
git mv 'Ethereum/2022Ethereum_Original_LowCloseRemoved_BTC_num_bin_2day.xlsx'                        'data/processed/Ethereum/2022Ethereum_Original_LowCloseRemoved_BTC_num_bin_2day.xlsx'
git mv 'Correlation/2022Ethereum_Full_NoScaling_Vader_Binary_Close-Open_reduced_lagged.xlsx'         'data/processed/Ethereum/2022Ethereum_Full_NoScaling_Vader_Binary_Close-Open_reduced_lagged.xlsx'

echo "=== Moving processed/Litecoin ==="
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved.xlsx'                                        'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin.xlsx'                         'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'         'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_1,2and3daylag.xlsx'           'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_1,2and3daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_1and2daylag.xlsx'             'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_1and2daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_1daylag.xlsx'                 'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_1daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_2daylag.xlsx'                 'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_2daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_3daylag.xlsx'                 'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_3daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_4daylag.xlsx'                 'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_4daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num.xlsx'                         'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num_1and2daylag.xlsx'             'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num_1and2daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num_1daylag.xlsx'                 'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num_1daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num_2daylag.xlsx'                 'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num_2daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num_BTC_bin_1and2daylag.xlsx'     'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num_BTC_bin_1and2daylag.xlsx'
git mv 'Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num_BTC_bin_1daylag.xlsx'         'data/processed/Litecoin/2022Litecoin_Original_LowCloseRemoved_All_Change_num_BTC_bin_1daylag.xlsx'

echo "=== Moving processed/Monero ==="
git mv 'Monero/2022Monero_Original_LowCloseRemoved.xlsx'                                       'data/processed/Monero/2022Monero_Original_LowCloseRemoved.xlsx'
git mv 'Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin.xlsx'                        'data/processed/Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin.xlsx'
git mv 'Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'        'data/processed/Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'
git mv 'Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_1,2and3daylag.xlsx'          'data/processed/Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_1,2and3daylag.xlsx'
git mv 'Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_1and2daylag.xlsx'            'data/processed/Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_1and2daylag.xlsx'
git mv 'Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_1daylag.xlsx'                'data/processed/Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_1daylag.xlsx'
git mv 'Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_2daylag.xlsx'                'data/processed/Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_2daylag.xlsx'
git mv 'Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_3daylag.xlsx'                'data/processed/Monero/2022Monero_Original_LowCloseRemoved_All_Change_bin_3daylag.xlsx'

echo "=== Moving processed/Stellar ==="
git mv 'Stellar/2022Stellar_Original_LowCloseRemoved.xlsx'                                         'data/processed/Stellar/2022Stellar_Original_LowCloseRemoved.xlsx'
git mv 'Stellar/2022Stellar_Original_LowCloseRemoved_All_Change_bin.xlsx'                          'data/processed/Stellar/2022Stellar_Original_LowCloseRemoved_All_Change_bin.xlsx'
git mv 'Stellar/2022Stellar_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'          'data/processed/Stellar/2022Stellar_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag.xlsx'
git mv 'Stellar/2022Stellar_Original_LowCloseRemoved_All_Change_bin_1,2and3daylag.xlsx'            'data/processed/Stellar/2022Stellar_Original_LowCloseRemoved_All_Change_bin_1,2and3daylag.xlsx'

echo "=== Moving processed/Tron ==="
git mv 'Tron/0 day lag individual.xlsx' 'data/processed/Tron/0 day lag individual.xlsx'
git mv 'Tron/1 day lag individual.xlsx' 'data/processed/Tron/1 day lag individual.xlsx'
git mv 'Tron/2 day lag combined.xlsx'   'data/processed/Tron/2 day lag combined.xlsx'

echo "=== Moving processed/Feature_Selected_4Day_Lag ==="
git mv 'Feature Selected Four Day Lag/2022Binance_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'  'data/processed/Feature_Selected_4Day_Lag/2022Binance_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'
git mv 'Feature Selected Four Day Lag/2022Cardano_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'  'data/processed/Feature_Selected_4Day_Lag/2022Cardano_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'
git mv 'Feature Selected Four Day Lag/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx' 'data/processed/Feature_Selected_4Day_Lag/2022Ethereum_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'
git mv 'Feature Selected Four Day Lag/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx' 'data/processed/Feature_Selected_4Day_Lag/2022Litecoin_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'
git mv 'Feature Selected Four Day Lag/2022Monero_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'   'data/processed/Feature_Selected_4Day_Lag/2022Monero_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'
git mv 'Feature Selected Four Day Lag/2022Stellar_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'  'data/processed/Feature_Selected_4Day_Lag/2022Stellar_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'
git mv 'Feature Selected Four Day Lag/2022Tron_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'     'data/processed/Feature_Selected_4Day_Lag/2022Tron_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'
git mv 'Feature Selected Four Day Lag/2022XRP_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'      'data/processed/Feature_Selected_4Day_Lag/2022XRP_Original_LowCloseRemoved_All_Change_bin_1,2,3and4daylag_Best.xlsx'

echo "=== Moving market_reference ==="
git mv 'New_Experiments/Base_Datasets/Alt_Coin_Yearly_Rank.xlsx' 'data/market_reference/Alt_Coin_Yearly_Rank.xlsx'
git mv 'New_Experiments/Base_Datasets/BTC_Bucket_Based.xlsx'     'data/market_reference/BTC_Bucket_Based.xlsx'
git mv 'New_Experiments/Base_Datasets/GoldDailyData.xlsx'        'data/market_reference/GoldDailyData.xlsx'
git mv 'New_Experiments/Base_Datasets/Nasdaq_Regular.xlsx'       'data/market_reference/Nasdaq_Regular.xlsx'
git mv 'New_Experiments/Base_Datasets/OilDailyData.xlsx'         'data/market_reference/OilDailyData.xlsx'
git mv 'New_Experiments/Base_Datasets/S&P500_Regular.xlsx'       'data/market_reference/S&P500_Regular.xlsx'
git mv 'New_Experiments/Base_Datasets/Total_Market_Cap.csv'      'data/market_reference/Total_Market_Cap.csv'
git mv 'Correlation/Bitcoin_OHLC.csv'                            'data/market_reference/Bitcoin_OHLC.csv'
git mv 'Correlation/Change_Count.csv'                            'data/market_reference/Change_Count.csv'
git mv 'Correlation/Binance data.xlsx'                           'data/market_reference/Binance data.xlsx'
git mv 'Correlation/Cardano data.xlsx'                           'data/market_reference/Cardano data.xlsx'
git mv 'Correlation/Ethereum data.xlsx'                          'data/market_reference/Ethereum data.xlsx'
git mv 'Correlation/Litecoin data.xlsx'                          'data/market_reference/Litecoin data.xlsx'
git mv 'Correlation/Monero data.xlsx'                            'data/market_reference/Monero data.xlsx'
git mv 'Correlation/Stellar data.xlsx'                           'data/market_reference/Stellar data.xlsx'
git mv 'Correlation/Tether data.xlsx'                            'data/market_reference/Tether data.xlsx'
git mv 'Correlation/Tron data.xlsx'                              'data/market_reference/Tron data.xlsx'
git mv 'Correlation/USD_Coin data.xlsx'                          'data/market_reference/USD_Coin data.xlsx'
git mv 'Correlation/XRP data.xlsx'                               'data/market_reference/XRP data.xlsx'

echo "=== Moving experiments ==="
git mv 'New_Experiments/Experiment_sets/Binance/BNB_raw_technical_plus_old.csv'            'experiments/Binance/BNB_raw_technical_plus_old.csv'
git mv 'New_Experiments/Experiment_sets/Binance/Binance_experiments.ipynb'                 'experiments/Binance/Binance_experiments.ipynb'
git mv 'New_Experiments/Experiment_sets/Binance/Binance_final_dataset.csv'                 'experiments/Binance/Binance_final_dataset.csv'
git mv 'New_Experiments/Experiment_sets/Cardano/Cardano_experiments.ipynb'                 'experiments/Cardano/Cardano_experiments.ipynb'
git mv 'New_Experiments/Experiment_sets/Cardano/Cardano_final_dataset.csv'                 'experiments/Cardano/Cardano_final_dataset.csv'
git mv 'New_Experiments/Experiment_sets/Ethereum/Ethereum_experiments.ipynb'               'experiments/Ethereum/Ethereum_experiments.ipynb'
git mv 'New_Experiments/Experiment_sets/Ethereum/Ethereum_final_dataset.csv'               'experiments/Ethereum/Ethereum_final_dataset.csv'
git mv 'New_Experiments/New_Experiment_Scripts/Ethereum/ETH_raw_Technical_plus_old_with_Lags.csv' 'experiments/Ethereum/ETH_raw_Technical_plus_old_with_Lags.csv'
git mv 'New_Experiments/New_Experiment_Scripts/Ethereum/RawTechnical_plus_Old.csv'         'experiments/Ethereum/RawTechnical_plus_Old.csv'
git mv 'New_Experiments/Experiment_sets/Litecoin/Litecoin_experiments.ipynb'               'experiments/Litecoin/Litecoin_experiments.ipynb'
git mv 'New_Experiments/Experiment_sets/Litecoin/Litecoin_final_dataset.csv'               'experiments/Litecoin/Litecoin_final_dataset.csv'
git mv 'New_Experiments/Experiment_sets/Monero/Monero_experiments.ipynb'                   'experiments/Monero/Monero_experiments.ipynb'
git mv 'New_Experiments/Experiment_sets/Monero/Monero_final_dataset.csv'                   'experiments/Monero/Monero_final_dataset.csv'
git mv 'New_Experiments/Experiment_sets/Ripple/Ripple_experiments.ipynb'                   'experiments/Ripple/Ripple_experiments.ipynb'
git mv 'New_Experiments/Experiment_sets/Stellar/Stellar_experiments.ipynb'                 'experiments/Stellar/Stellar_experiments.ipynb'
git mv 'New_Experiments/Experiment_sets/Stellar/Stellar_final_dataset.csv'                 'experiments/Stellar/Stellar_final_dataset.csv'
git mv 'New_Experiments/Experiment_sets/Tron/Tron_experiments.ipynb'                       'experiments/Tron/Tron_experiments.ipynb'
git mv 'New_Experiments/Experiment_sets/Tron/Tron_final_dataset.csv'                       'experiments/Tron/Tron_final_dataset.csv'

echo "=== Moving notebooks/data_collection ==="
git mv 'Scripts/Data Collection and Processing/TweetScrapper.ipynb'               'notebooks/data_collection/TweetScrapper.ipynb'
git mv 'Scripts/Data Collection and Processing/News_Scrapper.ipynb'               'notebooks/data_collection/News_Scrapper.ipynb'
git mv 'Scripts/Data Collection and Processing/Downsampler_tweets_and_news.ipynb' 'notebooks/data_collection/Downsampler_tweets_and_news.ipynb'
git mv 'Scripts/Data Collection and Processing/VaderSentimentsScores.ipynb'       'notebooks/data_collection/VaderSentimentsScores.ipynb'

echo "=== Moving notebooks/modelling ==="
git mv 'Scripts/Data_Modelling/1_Iteration_Classifiers_Value_ (4).ipynb'           'notebooks/modelling/1_Iteration_Classifiers_Value_ (4).ipynb'
git mv 'Scripts/Data_Modelling/1_Iteration_Classifiers_Value_Full_75_25 (1).ipynb' 'notebooks/modelling/1_Iteration_Classifiers_Value_Full_75_25 (1).ipynb'
git mv 'Scripts/Data_Modelling/Forward_Selection (2).ipynb'                         'notebooks/modelling/Forward_Selection (2).ipynb'
git mv 'Scripts/Data_Modelling/PycaretAllModels.ipynb'                              'notebooks/modelling/PycaretAllModels.ipynb'
git mv 'Scripts/Data_Modelling/Random_Forest_Importance.ipynb'                      'notebooks/modelling/Random_Forest_Importance.ipynb'

echo "=== Moving notebooks/experimentation ==="
git mv 'New_Experiments/New_Experiment_Scripts/Experimentation_framework.ipynb' 'notebooks/experimentation/Experimentation_framework.ipynb'
git mv 'New_Experiments/New_Experiment_Scripts/Feature_importance.ipynb'        'notebooks/experimentation/Feature_importance.ipynb'
git mv 'New_Experiments/New_Experiment_Scripts/Verification.ipynb'              'notebooks/experimentation/Verification.ipynb'

echo "=== Moving notebooks/correlation ==="
git mv 'Correlation/corr.ipynb'                            'notebooks/correlation/corr.ipynb'
git mv 'Correlation/corr2.ipynb'                           'notebooks/correlation/corr2.ipynb'
git mv 'Correlation/random.ipynb'                          'notebooks/correlation/random.ipynb'
git mv 'Correlation/BTC Correlation/btc.ipynb'             'notebooks/correlation/btc.ipynb'
git mv 'Correlation/BTC Correlation/nasdaq_snp.ipynb'      'notebooks/correlation/nasdaq_snp.ipynb'
git mv 'Correlation/BTC Correlation/BTC_Bucket_Based.xlsx' 'notebooks/correlation/BTC_Bucket_Based.xlsx'
git mv 'Correlation/BTC Correlation/Nasdaq_Regular.xlsx'   'notebooks/correlation/Nasdaq_Regular.xlsx'
git mv 'Correlation/BTC Correlation/S&P500_Regular.xlsx'   'notebooks/correlation/S&P500_Regular.xlsx'

echo "=== Moving models ==="
git mv 'New_Experiments/New_Experiment_Scripts/ETH_raw_prediction_model.pkl' 'models/ETH_raw_prediction_model.pkl'

echo "=== Committing ==="
git add -A
git commit -m "Restructure: organise project into data/, experiments/, notebooks/, and models/"

echo ""
echo "=== Done! Run 'git push origin main' to push to GitHub ==="
