// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Chile Hidden Sacred Places Registry
/// @notice On-chain registry of real, lesser-known sacred landscapes and ancestral cultural sites from Chile, with community voting.
/// @dev Country-specific: focused on Chile's indigenous cosmologies, sacred geography, and regional identity.

contract ChileHiddenSacredPlaces {

    struct SacredPlace {
        string region;          // e.g., Araucanía, Atacama, Magallanes
        string town;            // specific locality or indigenous community
        string placeName;       // name of the sacred site or landscape
        string placeType;       // e.g., ceremonial hill, volcanic altar, sacred lagoon
        string culturalNote;    // brief factual context or tradition
        string whyItMatters;    // cultural significance
        address creator;
        uint256 likes;
        uint256 dislikes;
        uint256 createdAt;
    }

    SacredPlace[] public places;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event SacredPlaceRecorded(uint256 indexed id, string placeName, string town, address indexed creator);
    event SacredPlaceVoted(uint256 indexed id, bool like, uint256 likes, uint256 dislikes);

    constructor() {
        places.push(
            SacredPlace({
                region: "Araucania",
                town: "Example Town",
                placeName: "Example Sacred Place (replace with real entries)",
                placeType: "example type",
                culturalNote: "This is an example entry to illustrate the format.",
                whyItMatters: "Real entries should describe cultural and spiritual relevance.",
                creator: address(0),
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );
    }

    /// @notice Record a new hidden sacred place from Chile.
    function recordSacredPlace(
        string calldata region,
        string calldata town,
        string calldata placeName,
        string calldata placeType,
        string calldata culturalNote,
        string calldata whyItMatters
    ) external {
        require(bytes(region).length > 0, "Region required");
        require(bytes(town).length > 0, "Town required");
        require(bytes(placeName).length > 0, "Place name required");

        places.push(
            SacredPlace({
                region: region,
                town: town,
                placeName: placeName,
                placeType: placeType,
                culturalNote: culturalNote,
                whyItMatters: whyItMatters,
                creator: msg.sender,
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );

        emit SacredPlaceRecorded(places.length - 1, placeName, town, msg.sender);
    }

    /// @notice Vote on whether a recorded sacred place is culturally relevant or useful.
    function voteSacredPlace(uint256 id, bool like) external {
        require(id < places.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        SacredPlace storage p = places[id];

        if (like) {
            p.likes += 1;
        } else {
            p.dislikes += 1;
        }

        emit SacredPlaceVoted(id, like, p.likes, p.dislikes);
    }

    /// @notice Returns the total number of recorded sacred places.
    function totalSacredPlaces() external view returns (uint256) {
        return places.length;
    }
}
