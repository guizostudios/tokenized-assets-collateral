// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";


contract GBMarketplace is Ownable, Pausable,  ReentrancyGuard  {
    IERC20 public ERC20;
    IERC721 public ERCNFT;

    using Counters for Counters.Counter;
    
    Counters.Counter private numOfListing;

    using SafeMath for uint;

    uint  commissionPercentage = 350;
    uint comissionAmount;
    uint sellerAmount;
    uint amountListed;

struct NFTListing {  
  ERC721 nft;
  uint256 tokenId;
  uint price;
  address coin;
  address seller;
  bool forSale;
}
  
  event NftBuy(address _buyer, uint256 _tokenId, uint _price);
  event transferToBuyer(address _buyer, uint256 _tokenId, uint _price);
  event updateToBuyer(address _buyer, uint256 _tokenId, uint _price);
  event NftList(address _seller, uint256 _tokenId, uint _id);
  event Deposit(address sender, uint256 amount);

 
  mapping(uint256 => NFTListing) public listings;

  constructor (address initialOwner)
    Ownable(initialOwner){}
   
   modifier onlyNftOwner(ERC721 _nft, uint _Id) {
        require(msg.sender == listings[_Id].seller);
        require(_nft == listings[_Id].nft);
        _;
    }


    function pauseMarketplace() public onlyOwner {
        _pause();
    }

    function unpauseMarketplace() public onlyOwner {
        _unpause();
    }

  function listNFT(ERC721 _nft, uint256 _tokenId, uint _price, address _coin) public payable {
    require(_nft.ownerOf(_tokenId) == msg.sender, "You are not the owner");
    require(_price > 0, "NFTMarket: price must be greater than 0");
    numOfListing.increment();
    listings[numOfListing.current()] = NFTListing(
        _nft,
        _tokenId,
        _price,
        _coin,
        payable(msg.sender),
        false
    );
    NFTListing storage listing = listings[numOfListing.current()];
    _nft.transferFrom(msg.sender, address(this), _tokenId);
    listing.forSale = true;
    emit NftList(msg.sender, _tokenId, numOfListing.current());
}

    // this function will cancel the listing. it also has checks to make sure only the owner of the listing can cancel the listing from the market place
    function cancel(ERC721 _nft, uint _Id) public payable onlyNftOwner(_nft, _Id) {
        NFTListing storage listing = listings[_Id];
        require(listing.seller == msg.sender, "is not the seller");
        require(listing.forSale == true, "is not listened");
        _nft.transferFrom(address(this), msg.sender, listing.tokenId);
        listing.forSale = false;
    }

    // this function will facilitate the purchasing of a listing
    function buyNFT(ERC721 _nft, uint _Id) public payable whenNotPaused nonReentrant {
        NFTListing storage listing = listings[_Id];
        require(_Id > 0 && _Id <= numOfListing.current(), "item doesn't exist");
        require(listing.forSale != false, "item is not for sell");
        require(listing.seller != msg.sender, "You cannot buy your own nft");
        require(listing.nft == _nft, "item is not the same contract address");
        require(msg.value >= listing.price, "not enough balance for this transaction");
        amountListed = listing.price;
        comissionAmount = amountListed.mul(commissionPercentage).div(10000);
        sellerAmount = amountListed.sub(comissionAmount);
        ERC20 = IERC20(listing.coin);
        ERC20.transfer(listing.seller, sellerAmount);

        _nft.transferFrom(address(this), msg.sender, listing.tokenId);
        listing.seller = msg.sender;
        listing.forSale = false;
        emit NftBuy(msg.sender, listing.tokenId, sellerAmount);
    }


    // Function to transfer NFT to the buyer and refund
    function transferNFT(uint256 _listingId) public whenNotPaused nonReentrant {
        NFTListing storage listing = listings[_listingId];
        require(_listingId > 0 && _listingId <= numOfListing.current(), "item doesn't exist");
        require(listing.forSale != false, "item is not for sell");
        require(listing.seller != msg.sender, "You cannot buy your own nft");

        amountListed = listing.price;
        comissionAmount = amountListed.mul(commissionPercentage).div(10000);
        sellerAmount = amountListed.sub(comissionAmount);

        ERC20 = IERC20(listing.coin);
        ERC20.transfer(listing.seller, sellerAmount);
        ERC20.transfer(msg.sender, sellerAmount);  // Refund to the buyer

        listing.forSale = false;
        emit NftBuy(msg.sender, listing.tokenId, sellerAmount);
    }

    // Function to update the NFT info just if is necessary
    function updateNFT(ERC721 _nft, uint _Id, address _sender) public whenNotPaused nonReentrant onlyOwner {
        NFTListing storage listing = listings[_Id];
        require(_Id > 0 && _Id <= numOfListing.current(), "item doesn't exist");
        require(listing.forSale != false, "item is not for sell");
        require(listing.seller != _sender, "You cannot buy your own nft");
        require(listing.nft == _nft, "item is not the same contract address");
        listing.seller = _sender;
        listing.forSale = false;
        emit updateToBuyer(_sender, listing.tokenId, listing.price);
    }


     // Function to transfer or withdraw the funds
    function transferOrWithdraw (uint _amount, address _ERC20Address) public whenNotPaused nonReentrant onlyOwner {
        require(_amount != 0, "Amount cannot be zero");
        require(_ERC20Address != address(0), "ERC20 address cannot be zero address");
        ERC20 = IERC20(_ERC20Address);
        require(_amount <= ERC20.balanceOf(address(this)), "Insufficient funds.");
        ERC20.transfer(msg.sender , _amount);
    }

  // update comission percentage
  function updateComissionPercentage(uint256 _value) public onlyOwner{
        commissionPercentage = _value;
  }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

  // this function will get the listings in the market place
    function getNFTListing(uint _Id) public view returns (NFTListing memory) {
        return listings[_Id];
    }

    
    // get list of items
    function getListinglength() public view returns (uint) {
        return numOfListing.current();
    }   

    // get comission percentage
    function getComissionPercentage() public view returns (uint256){
      return commissionPercentage;
    }

    // get id listed for sale
  function getIdListed(ERC721 _nft, uint256 _tokenId) public view returns (uint256) {
    bool found = false;  // Flag to indicate if NFT listing has been found
    uint256 i;  // Variable to store the index of the NFT listing

    for (i = 1; i <= numOfListing.current(); i++) {
        if (listings[i].nft == _nft && listings[i].tokenId == _tokenId && listings[i].forSale) {
            found = true;  // Set flag to true if NFT listing is found
            break;  // Exit the loop
        }
    }

    // Check if NFT listing has been found, otherwise revert with an error message
    if (!found) {
        return 0;
    }

    return i;  // Return the index of the NFT listing
}


      // get all id listed 
    function getAllIdListed (ERC721 _nft, uint256 _tokenId) public view returns (uint){
    for (uint i = 1; i <= numOfListing.current(); i++) {
        NFTListing storage listing = listings[i];
        if (listing.nft == _nft && listing.tokenId == _tokenId) {
            return i;
        }
    }
    return 0;
  }
}   
