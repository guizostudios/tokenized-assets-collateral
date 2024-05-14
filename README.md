# tokenized-assets-collateral

# Smart Contract for Loans with Tokenized Securities as Collateral

**Contract address - Lisk L2 Testnet:** 0xD16836357769cC1Fc3427c1acc233E6974800896

This repository contains smart contracts developed for the "Tokenized Asset Collateral" project, which aims to use tokenized securities as collateral for loans to NGOs or small producer companies in the carbon credit sector. The project involves issuing NFTs linked to these securities, which can be used as collateral by individuals interested in supporting sustainable initiatives.

## Proposal Overview

### Who
- **Banks and financial institutions**
- **Individuals**
- **Small producers**
- **Private companies**
- **NGOs**

### For
- **Using tokenized securities as collateral for loans to NGOs or small producers in the carbon credit sector.**

### How
- **Individuals can use securities as collateral to enable NGOs or companies to take loans and invest in revenue-generating solutions with future carbon credits.**
- **Each project issues NFTs acquired with tokenized securities, used as collateral.**
- **Investors receive the amount paid for the NFT plus a reward by supporting a successful project.**
- **NFTs can be resold on a secondary market in the marketplace.**

### Differentiation
- **Facilitates initial credit access for small producers and NGOs in the carbon credit sector.**
- **Individuals and companies can support specific regions or business entities simply and without bureaucracy.**
- **Encourages compliance with agreements, as many people believe in the initiatives.**

## Smart Contract Architecture

### GBContract
- **Features:**
  - KYC (Know Your Customer) for address approval.
  - Issuance and listing of NFTs linked to tokenized securities.
  - Loan balance control, contract start and end dates.
  - Lending funds to NGOs.
  - Repayment of funds by NGOs.
  - Withdrawal of collateral if NGOs fail to repay after contract expiration.
  - NFT refund to the buyer if NGOs successfully repay.

### GBERC721
- **Features:**
  - Extension of the ERC721 standard for NFTs linked to green projects.
  - Project data update (status, active).
  - Ownership verification to ensure only the NFT owner can update data.

### GBMarketplace
- **Features:**
  - Listing, purchasing, and canceling NFTs in the market.
  - Commission and payment calculations during transactions.
  - NFT information updates by the owner or administrators.

## How It Works

1. **NFT Listing:**
   - NGOs list their NFTs on GBMarketplace.
   - NFTs are acquired by individuals interested in helping the project.

2. **Loans to NGOs:**
   - NGOs can request loans, providing these NFTs as collateral.

3. **Payment and Reward:**
   - If NGOs repay the loan correctly, investors receive back the amount paid for the NFTs plus a reward.
   - In case of non-payment, investors have the right to the collateral.

4. **Refund and Resale:**
   - Investors can resell the NFTs on the secondary market.

## Usage

1. **Deploy Contracts:**
   - Deploy the GBContract, GBERC721, and GBMarketplace contracts.
   - Set appropriate permissions for the GBMarketplace contract to access and interact with the other contracts.

2. **NFT Operations:**
   - List NFTs on GBMarketplace.
   - Purchase NFTs on GBMarketplace.
   - Cancel listings on GBMarketplace.

3. **Loans and Payments:**
   - NGOs request loans using tokenized securities as collateral.
   - Investors receive rewards after successful repayment by NGOs.
   - In case of non-payment, investors receive the collateral.

4. **Updates and Refunds:**
   - Owners or administrators update NFT information if necessary.
   - NFT refund to buyers in case of successful repayment.