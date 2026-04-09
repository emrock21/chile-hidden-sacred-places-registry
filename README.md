# Chile Hidden Sacred Places Registry

On-chain registry of real, lesser-known sacred landscapes and ancestral cultural sites from Chile.

This contract focuses on places that are culturally significant but not mainstream or globally documented, such as:

- Mapuche sacred wetlands (menoko)  
- Aymara apachetas and mountain offerings  
- Rapa Nui ceremonial platforms (ahu)  
- Selk’nam ritual caves and ancestral territories  
- Atacameño sacred lagoons and desert sites  

Each entry is tied to a specific Chilean region and town, emphasizing cultural context rather than generic geography.

---

## Why a country-specific contract?

Chile’s indigenous nations maintain deep relationships with land, water, mountains, and sacred sites.  
Many of these places are:

- Known primarily by local communities  
- Linked to spiritual, ceremonial, or cosmological traditions  
- Important for cultural memory, identity, and territorial continuity  

A global “sacred places registry” would dilute this context.  
This registry is explicitly designed for Chile’s ancestral landscapes.

---

## Contract

Deployed on Base:  
`0xf770ab6a438b9486f374c13c50f3b51cf68ef127`  
🔗 https://basescan.org/address/0xf770ab6a438b9486f374c13c50f3b51cf68ef127#code

---

## Data model

Each recorded sacred place includes:

- `region` – e.g., Araucanía, Atacama, Magallanes  
- `town` – specific locality or indigenous community  
- `placeName` – name of the sacred site  
- `placeType` – type of site (hill, lagoon, cave, altar, etc.)  
- `culturalNote` – brief factual context  
- `whyItMatters` – explanation of cultural significance  
- `likes` / `dislikes` – community voting on relevance and usefulness  

---

## Example entries (conceptual)

These are examples of the kind of sacred places this registry is meant to capture:

- A Mapuche menoko inhabited by water spirits  
- An Aymara apacheta used for offerings to mountain deities  
- A Rapa Nui ahu aligned with ancestral navigation  
- A Selk’nam ritual cave tied to initiation rites  
- A sacred lagoon in the Atacama Desert with pre-Hispanic significance  

Frontends and communities are responsible for ensuring that entries are real and culturally meaningful.

---

## Contract interface

Main functions:

solidity

recordSacredPlace(
  string region,
  string town,
  string placeName,
  string placeType,
  string culturalNote,
  string whyItMatters
);

voteSacredPlace(uint256 id, bool like);

totalSacredPlaces();

---

## Conclusion

This contract provides a country-specific, culturally grounded registry for Chile.
It is not a generic list of locations, but a curated log of sacred landscapes that matter to the cultural memory and identity of the nation, with community voting to highlight what truly deserves to be remembered.
