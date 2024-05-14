// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GBERC721.sol";
import "./Marketplace.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract GBContract is Ownable {
    using SafeMath for uint256;

    GBERC721 public nftContract;
    GBMarketplace public marketplaceContract;

    // KFC Verification
    mapping(address => bool) public kfcVerification;

    // Mapping to track borrow balances and contract dates
    mapping(address => uint256) public borrowBalances;
    mapping(address => uint256) public contractStartDates;
    mapping(address => uint256) public contractEndDates;

    // Event to notify when KFC is approved
    event KFCApproved(address indexed kfcAddress);

    // Event to notify when funds are borrowed
    event Borrow(address indexed borrower, uint256 amount, uint256 startDate, uint256 endDate);

    // Event to notify when funds are repaid
    event Repay(address indexed borrower, uint256 amount);

    // Event to notify when collateral is withdrawn
    event WithdrawCollateral(address indexed borrower, uint256 tokenId);

    // Event to notify when NFT is refunded to buyer
    event RefundNFT(address indexed buyer, uint256 tokenId);

    modifier onlyKFC() {
        require(kfcVerification[msg.sender], "Not authorized. Only KFC can call this function.");
        _;
    }

    modifier onlyAfterEndDate(address _address) {
        require(block.timestamp >= contractEndDates[_address], "Contract has not expired yet");
        _;
    }

    constructor(
        string memory _nftName,
        string memory _nftSymbol,
        string memory _marketplaceNftName,
        string memory _marketplaceNftSymbol,
        address _initialOwner
    ) 
        Ownable(_initialOwner){
        nftContract = new GBERC721(_nftName, _nftSymbol, _initialOwner);
        marketplaceContract = new GBMarketplace(_initialOwner);
        marketplaceContract.transferOwnership(_initialOwner);
    }

    // Function to approve KFC address
    function approveKFC(address _kfcAddress) external onlyOwner {
        require(_kfcAddress != address(0), "Invalid KFC address");
        kfcVerification[_kfcAddress] = true;
        emit KFCApproved(_kfcAddress);
    }


    // Mint NFT and list on the marketplace
    function mintAndListNFT(
        address _to,
        string memory _projectCode,
        string memory _uri,
        string memory _name,
        string memory _cnpj,
        string memory _description,
        string memory _status,
        bool _active,
        uint256 _tokenId,
        uint256 _price,
        address _coin,
        uint256 _startDate,
        uint256 _endDate
    ) external onlyOwner {
        nftContract.safeMint(_to, _projectCode, _uri, _name, _cnpj, _description, _status, _active, _tokenId);
        marketplaceContract.listNFT(nftContract, _tokenId, _price, _coin);

        // Set contract dates
        contractStartDates[_to] = _startDate;
        contractEndDates[_to] = _endDate;

        emit Borrow(_to, _price, _startDate, _endDate);
    }


    // Function to update NFT data
    function updateNFTData(
        uint256 _tokenId,
        string memory _status,
        bool _active
    ) external onlyOwner {
        nftContract.updateProjectData(_tokenId, _status, _active);
    }


    // Function to purchase NFT from the marketplace
    function purchaseNFT(uint256 _listingId) external payable {
       marketplaceContract.buyNFT(nftContract, _listingId);
    }


    // Function to cancel NFT listing on the marketplace
    function cancelNFTListing(uint256 _listingId) external {
        marketplaceContract.cancel(nftContract, _listingId);
    }

    // Function to update NFT information
    function updateNFT(uint256 _listingId, address _buyer) external onlyKFC {
        marketplaceContract.updateNFT(nftContract, _listingId, _buyer);
    }


    // Function to transfer or withdraw funds from the marketplace
    function transferOrWithdraw(uint256 _amount, address _ERC20Address) external onlyOwner {
        marketplaceContract.transferOrWithdraw(_amount, _ERC20Address);
    }

    // Function for NGOs to borrow funds
    function borrowFunds(
        uint256 _amount,
        uint256 _startDate,
        uint256 _endDate
    ) external {
        require(_amount > 0, "Borrow amount must be greater than 0");
        require(borrowBalances[msg.sender] == 0, "You already have an active loan");

        // Increase borrow balance
        borrowBalances[msg.sender] = _amount;

        // Set contract dates
        contractStartDates[msg.sender] = _startDate;
        contractEndDates[msg.sender] = _endDate;

        // Transfer funds from bank to NGO
        IERC20 bankToken = IERC20(marketplaceContract.ERC20());
        bankToken.transfer(msg.sender, _amount);

        emit Borrow(msg.sender, _amount, _startDate, _endDate);
    }

    // Function for NGOs to repay funds
    function repayFunds() external {
        require(borrowBalances[msg.sender] > 0, "No active loan to repay");

        // Transfer funds from NGO to bank
        IERC20 bankToken = IERC20(marketplaceContract.ERC20());
        uint256 amountToRepay = borrowBalances[msg.sender];
        bankToken.transferFrom(msg.sender, address(this), amountToRepay);

        // Reset borrow balance
        borrowBalances[msg.sender] = 0;

        emit Repay(msg.sender, amountToRepay);
    }

    // Function for the bank to withdraw collateral if NGOs fail to repay after contract expiration
    function withdrawCollateral(uint256 _tokenId) external onlyKFC onlyAfterEndDate(msg.sender) {
        require(borrowBalances[msg.sender] > 0, "No active loan");
        require(nftContract.ownerOf(_tokenId) == address(this), "NFT not held as collateral");

        // Transfer NFT from contract to bank
        nftContract.safeTransferFrom(address(this), msg.sender, _tokenId);

        // Reset borrow balance
        borrowBalances[msg.sender] = 0;

        emit WithdrawCollateral(msg.sender, _tokenId);
    }

    // Function for the bank to refund NFT to buyer if NGOs repay successfully
    function refundNFTToBuyer(uint256 _listingId, address _buyer) external onlyKFC {
        require(borrowBalances[_buyer] == 0, "Buyer has an active loan");
        marketplaceContract.transferNFT(_listingId);

        emit RefundNFT(_buyer, _listingId);
    }
}