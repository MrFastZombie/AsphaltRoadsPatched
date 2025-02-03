# Asphalt Roads Patched

---

### About this version

This version of Asphalt Roads has been patched to run on Factorio 2.0.

Do not expect many new features, I intend mainly to just have this wonderful mod working on the latest Factorio version. I'm not an artist so I probably won't make any new tiles. If you find bugs, it is preferable to report them to the Github repository's issue page but the discussions page here is also fine (I may miss discussion posts more easily though).

I have not played Space Age yet and I do not yet know how this mod interacts with it, but I can confirm that it works at least on Nauvis.

Please note, this version has a new mod name meaning that it probably won't bring back asphalt on old saves.

If the original author updates their mod, I will mark this one as deprecated and link to it in the description.

All code changes are licensed under the same license as the original mod: MPL v2.

### Credits

[Zetty](https://mods.factorio.com/user/Zetty "Zetty's profile") for updating the [previous version](https://mods.factorio.com/mod/AsphaltPaving "Zetty's version of the mod") of the mod.

[Arcitos](https://mods.factorio.com/user/Arcitos "Arcitos' profile") for developing the original mod.

[Fr_Dae](https://mods.factorio.com/user/Fr_Dae) for providing French translation.

---

# Original description (Asphalt Roads)

Note that some info below could be outdated!

https://mods.factorio.com/mod/AsphaltRoads

## Introduction

*Have you ever looked at your factory and thought: "I dunno, but what this planet is seriously missing is a decent four-lane highway network."
Then worry not: This mod was made to help fulfilling your infrastructure dreams.*

**Asphalt Roads**

"Asphalt Roads" adds a new tile set with a smooth, black road surface to your games, including tiles for hazard marking and lane marking. Enjoy the reduced vehicle friction modifier and accelerate up to 200 km/h with your car (using rocket fuel).

- Mark separate lanes on your roads with single or double lines
- Mark hazard areas in various colours e.g. near railway crossings or gates
- Set up pedestrian crossings with zebra crossing or "shark teeth" tiles

For a quick live demonstration (though a bit dated, but nevertheless very well explained): [Asphalt Roads mod spotlight by Xterminator](https://www.youtube.com/watch?v=s5w6K9xEaRo)

## Details

### Items

![Imgur](http://i.imgur.com/WYTCwKI.png)

- **Asphalt** is the base tile.
- **Asphalt with lane marking** consists of two items for white and yellow lane marking in 45, 90, 135 and 180 degree angles and two items for tiles that divert lines by 45 degree to the left or the right.
- **Asphalt with zebra crossing marking** are two tiles with thick white lines
- **Asphalt with white triangle** are four tiles with "shark teeth"
- **Asphalt with hazard marking** are five separate items for white, yellow, red, blue and green hazard marking.

![Imgur](http://i.imgur.com/36NTyPO.png)

- **Double line tiles** are another variation of lane marking tiles

### Technology

Basic technology is called **Asphalt** and needs concrete as a prerequisite.

### Mod recommendation and support

Recommended mods that work well in addition to this one:

- [Pavement Drive Assist](https://mods.factorio.com/mods/Arcitos/PavementDriveAssist): Allows player driven vehicles to detect lane marking and follow your roads
- [Concrete Signpost](https://mods.factorio.com/mods/Klonan/Concrete_Lamppost) (by Klonan) adds sign posts that look really nice in addition to asphalt roads
- [Dectorio](https://mods.factorio.com/mods/PantherX/Dectorio) (by PantherX): This mod adds pretty traffic bollards (and a bunch of other neat stuff)

Supported mods

- [Bio Industries](https://mods.factorio.com/mods/TheSAguy/Bio_Industries): If present, crushed stone will be used as an ingredient for asphalt (replacing stone). This can be disabled in mod settings tab.
- [Wood Gasification](https://mods.factorio.com/mod/Wood_Gasification): If present, tar will be used as an ingredient for asphalt (replacing crude oil). This can be disabled in mod settings tab.

### Effects on gameplay

This mod is mostly non-game-changing, apart from the reduced vehicle friction of asphalt. But this is compensated by the significant amount of crude and heavy oil needed for the production of asphalt. For more fun, i recommend the heavy use of blueprints!

### Current language support

- EN (English)
- DE (German)
- ~~CN (Chinese)~~ 
- *(New)* FR (French)

If you like this mod and you've created a translation of your own, please do not hesitate to send me this, so that it can be made accessible to all in the next version. Same, if you spot spelling mistakes. Thanks in advance!

(**Note from MrFastZombie:** *The Chinese translation is outdated and needs to be updated. It is currently unavailable. The German translation is still working but could use some proof-reading on a couple new entries. Like the original mod, I will accept translations and corrections. Any languages marked "New" are new with this patched version of the mod*).

---

## Known issues

**"I'm using 'Asphalt Roads' along with ~~'Alien Biomes' and~~ other mods and are constantly getting errors about missing tiles"**

Factorio's limit for the number of different tile prototypes a game can use at a time is hard-coded. **~~Currently this limit is 255 tiles~~**. If you load multiple mods that add a lot of new tiles (like "Alien Biomes" and "Dectorio"), this might be a problem, as "Asphalt Roads" alone needs 65 free tile slots to work properly (assuming all tiles being enabled).

If you experience problems, please try disabling some of the markings in Asphalt roads' mod options. Disabling both double line road line markings, for example, will free up 24 slots. If other mods allow disabling some of their tiles, please consider using those options, too.

~~Unfortunately, the Factorio devs do not consider raising this limit in the foreseeable future, so a bit of tinkering is unavoidable.~~

**Note from MrFastZombie:** *This should be less of an issue with the new tile limit in Factorio 2.0, although I do reckon that hitting limits is still possible as 2.0 now has tile layers that are each limited to 255 tiles. Mods that use the same layer groups may still overfill that layer group. I don't think this issue will happen when Asphalt Roads is installed with Alien Biomes anymore, however.*
