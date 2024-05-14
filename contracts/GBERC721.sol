// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


 contract GBERC721 is ERC721, ERC721URIStorage,Ownable ,ERC2981,  Pausable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;


    //Base URI
    string private url;

    struct ProjectData {
        string name;
        uint256 projectTokenId;
        string projectCode;
        string cnpj;
        string description;
        string uri;
        string status;
        bool active;
        address creator;
        uint256 timeStamp;
    }

    mapping (uint256 => ProjectData) private _projectData;

    // Event to emit when ProjectData is updated
    event ProjectDataUpdated(uint256 indexed tokenId, string status, bool active);

    // initialOwner is the marketplace contract
    constructor( string memory _MyToken, string memory _Symbol, address initialOwner) 
    ERC721(_MyToken, _Symbol) 
    Ownable(initialOwner)
    {

    }


    function _baseURI() internal view override returns (string memory) {
        return url;
    }

    function pause() external onlyOwner  {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }


    function safeMint(address _to, string memory _projectCode, string memory _uri, string memory _name,
    string memory _cnpj, string memory _description, string memory _status,  
    bool  _active, uint256 _tokenId) public whenNotPaused onlyOwner {
        uint256 tokenId = _tokenId;
        _safeMint(_to, tokenId);
        _setTokenURI(tokenId, _uri);
        
        // Create a new ProjectData struct and store it in the contract's storage
        _projectData[tokenId] = ProjectData({
        projectTokenId : tokenId,
        projectCode : _projectCode,
        uri : _uri,
        name : _name,
        cnpj : _cnpj,
        description : _description,
        status : _status,
        active : _active,
        creator : msg.sender,
        timeStamp : block.timestamp
        });

    }

    function updateProjectData(
        uint256 tokenId,
        string memory _status,
        bool _active
    ) external onlyOwner {

        // Get the existing ProjectData for the token ID
        ProjectData storage project = _projectData[tokenId];
        project.status = _status;
        project.active = _active;

        // Emit an event to notify that ProjectData has been updated
        emit ProjectDataUpdated(tokenId, _status, _active);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC2981, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }




    function getProjectData(uint256 tokenId) public view returns (ProjectData memory) {
        return _projectData[tokenId];
    }


}
