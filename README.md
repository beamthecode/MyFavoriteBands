


# MyFavoriteBands
![Image](https://img.shields.io/badge/SwiftUI-white
) ![Image](https://img.shields.io/badge/Swift-white
) ![Image](https://img.shields.io/badge/MyFavoriteBands-white
) ![Image](https://img.shields.io/badge/PortfolioProject-white
) ![Image](https://img.shields.io/badge/MVVM%20Architecture-white
) ![Image](https://img.shields.io/badge/Music%20Theme-white
)

## Motivation

I wanted to create a portfolio project that would showcase my [SwiftUI](https://developer.apple.com/xcode/swiftui/) skills as well as interject a music theme. Music being one of my great loves, I have found that it spikes my creativity to be able to combine themes I am passionate about to the projects that I am working on. As a progressing iOS Developer I think it has really been a great learning tool to lean on themes / topics that I really enjoy. It has allowed me to improve on the fundamentals, but also start exploring my own ideas and possibilities. Growing my knowledge! 



## Project Description
![Image](https://img.shields.io/badge/Images-white
) ![Image](https://img.shields.io/badge/Biographical%20Information-white
) ![Image](https://img.shields.io/badge/Band%20Members-white
) ![Image](https://img.shields.io/badge/Essential%20Albums-white
) ![Image](https://img.shields.io/badge/Rock%20Bands-white
)


I've always been a nerd for reading about bands, albums, and musicians. I decided to go with an app that would present a list of some of my favorite bands.  Each band would include its own logo/images, short biography, band members, and essential albums *(in my opinion! haha)*. This is a learning based app where the user could browse different bands and read about them, their members, and their albums. Visuals would include images of the band logos, their members, and album covers. Pretty cool! In building the data for this application I chose to pull all the biographical information and images from [Wikipedia](https://www.wikipedia.org). This application is not for commercial use, but I have given Wikipedia full credit. This application's use is solely for my portfolio. This project was something different than I had built out previously, but the concept really opened up my creativity and allowed me to add some new design features, [colors](https://developer.apple.com/documentation/tvml/color/), [fonts](https://developer.apple.com/documentation/realitykit/preliminary-text-font/), and layouts that I had not worked with previously. This has been a very rewarding project, and I am loving working with SwiftUI.


---

## Objectives

![Image](https://img.shields.io/badge/MVVM%20-white
) ![Image](https://img.shields.io/badge/Decode%20JSON%20-white
) ![Image](https://img.shields.io/badge/GridLayout%20-white
) ![Image](https://img.shields.io/badge/ListLayout%20-white
) ![Image](https://img.shields.io/badge/BandView%20-white
) ![Image](https://img.shields.io/badge/MusicianView%20-white
) ![Image](https://img.shields.io/badge/AlbumView%20-white
) ![Image](https://img.shields.io/badge/Color%20-white
) ![Image](https://img.shields.io/badge/Custom%20Font%20-white
)

* Develop using [MVVM](https://en.wikipedia.org/wiki/Model–view–viewmodel) architecture
* Encode / Decode [JSON](https://www.json.org/json-en.html) files for data
* Incorporate two different layouts of the bands list [view](https://developer.apple.com/documentation/swiftui/view/)
* Create the following views:
	* band view
	* band roster view
	* band album roster view
	* musician view
	* album view
* Add custom font and color





---
## Architecture
![Image](https://img.shields.io/badge/JSON%20Files%20-white
) ![Image](https://img.shields.io/badge/Swift%20Files%20-white
) ![Image](https://img.shields.io/badge/SwiftUI%20Views%20-white
) ![Image](https://img.shields.io/badge/Bundle-Decodable%20-white
) ![Image](https://img.shields.io/badge/There's%20a%20Rhyme%20to%20my%20Reason%20-white
)

I wanted to utilize  **MVVM** architecture in this application so initially I began looking at the best way to support my end objectives. I would need band data, musician data, and album data to support my views. My initial thought was to use **JSON** files for the hard data. I could pull the information for each band, musician, and album from Wikipedia and include it in a JSON file. I could then encode / decode that information into something I could use in **SwiftUI**. 

Each band that I would present in this app would include its own logo, description, band members, and albums. I started looking at the architecture in this way:

>*  **JSON Files**
	>		* **bands** (id, bandMembers, albums, description)
	> 		* **musicians** (id, name, description)
	>		* **albums** (id, name, description, tracks)	
>
>*	 **Swift Files**
	>		* **Bundle-Decodable** (handles encoding / decoding JSON) 
	> 		* **Band**
	>		* **Musician**
	>		* **Album**	 
>

Each Swift file would directly be supporting a **SwiftUI** view. **BandView, MusicianView, AlbumView**. Additionally, I knew that I wanted to present band members and essential albums in **BandView** as scrollable views that included an image and appropriate text. To do this I would have to create two additional views called **BandRoster** & **AlbumRoster**

> * **Swift UI** Views
	> 	* **BandView**
	>	* **MusicianView**
	>	* **AlbumView**
	>	* **BandRoster**
	>	* **AlbumRoster**

These files would provide the main interface for the user while using the app. There would need to be some additional files added to present different layouts / design, but I really felt good about the file architecture / organization at this point!

---


## The Dirty Work 
![Image](https://img.shields.io/badge/Band%20-white
) ![Image](https://img.shields.io/badge/Musician%20-white
) ![Image](https://img.shields.io/badge/Album%20-white
) ![Image](https://img.shields.io/badge/struct%20-white
) ![Image](https://img.shields.io/badge/Codable%2C%20Identifiable%20-white
) ![Image](https://img.shields.io/badge/BundleDecodable%20-white
) ![Image](https://img.shields.io/badge/It's%20not%20fun%2C%20but%20its%20got%20to%20get%20done-white
)

### Band
`Band.swift`

I started by creating a [struct](https://www.hackingwithswift.com/read/0/15/structs) called **Band** that would bridge the **bands** JSON file data and facilitate the **BandView**. I added [Codable](https://developer.apple.com/documentation/swift/codable/) and [Identifiable](https://developer.apple.com/documentation/swift/identifiable/) conformance.

```
struct Band: Codable, Identifiable {

}
```
Inside of the **Band** struct I nested two additional structs called **BandMemberRole** and **EssentialAlbum**. These structs would help facilitate the band members and essential albums. I added Codable conformance to both

```
struct EssentialAlbum: Codable {
	let name: String
	let role: String
}

struct BandMemberRole: Codable {
	let name: String
	let role: String
}
```
I added these variables to the **Band** struct. 

```
let id: String
let bandMembers: [BandMemberRole]  <--- from BandMemberRole struct
let albums: [EssentialAlbum]  <--- from EssentialAlbum struct 
let description: String
let badge: String
```

Last but not least I added two computed properties to the struct.

```
var displayName: String {
"\(id)"
}

var image: String {
"\(id)"
}
```
---

### Musician
`Musician.swift`

I added a struct called **Musician** that included **Codable** and **Identifiable** conformance. Inside of the struct I added the variables of id, name, and description. This struct will bridge the **musicians** JSON file and facilitate **MusicianView**.

```
struct Musician: Codable, Identifiable {
	let id: String
	let name: String
	let description: String
}
```

---

### Album
`Album.swift`

I added a struct called **Album** that includes **Codable** and **Identifiable** conformance. Next I added the variables of id, name, description, and tracks. This struct will bridge the **albums** JSON file and facilitate **AlbumView**.

```
struct Album: Codable, Identifiable {
	let id: String
	let name: String
	let description: String
	let tracks: String
}
```
---

### Bundle-Decodable
`Bundle-Decodable.swift`

**Bundle-Decodable** is a file that I have used in multiple applications where I use JSON files. I initially learned how to write this code while taking the [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. Credit to [@TwoStraws](https://github.com/twostraws). 

The file itself includes an extension on Bundle. Inside of the extension is a main [function](https://www.hackingwithswift.com/read/0/11/functions) called decode. The function itself utilizes generics and includes several guard statements. The function will throw one of three fatal errors if the JSON files are not able to be decoded properly. Those three errors:

* If the file is not located
* If the file is not loadable
* If the file is not able to be decoded

Finally the function returns the loaded data.

It is imperative that the JSON files include the correct information, else wise the app crashes. I  built the JSON files myself so I know they are accurate. Though, I will say in terms of building out this app it was useful to have the **fatalError()** in place, as it did help me catch a few mistakes I made building the JSON files. *Good stuff!*



---

## The Presentation (Views)

![Image](https://img.shields.io/badge/ContentView()%20-white
) ![Image](https://img.shields.io/badge/BandView()%20-white
) ![Image](https://img.shields.io/badge/MusicianView()%20-white
) ![Image](https://img.shields.io/badge/AlbumView()%20-white
) ![Image](https://img.shields.io/badge/GridLayout()%20-white
) ![Image](https://img.shields.io/badge/ListLayout()%20-white
)

**ContentView** will display the band logo images to the user when they open the app. I previously mentioned that I wanted the user to have the ability to look at the list of bands as either a grid or as a list. This required two additional views, **GridLayout** and **ListLayout**. The user will be able to [toggle](https://developer.apple.com/documentation/swiftui/toggle/) between these views with a [toolbar](https://developer.apple.com/documentation/swiftui/view/toolbar(content:)-5w0tj) [button](https://developer.apple.com/documentation/swiftui/button). 

### GridLayout
`GridLayout.swift`

To create the grid layout the first thing I did was add these four variables.

```
let musicians: [String: Musician]
let bands: [Band]
let albums: [String: Album]
let columns = [
GridItem(.adaptive(minimum: 150))
]
```

I started by adding a [ScrollView](https://developer.apple.com/documentation/swiftui/scrollview/). Inside of the ScrollView I added a [LazyVGrid()](https://developer.apple.com/documentation/swiftui/lazyvgrid/) I passed in our columns variable from above in this LazyVGrid. Inside of the LazyVGrid I added a [ForEach](https://developer.apple.com/documentation/swiftui/foreach) closure that accepted  (band). Inside the For Each [closure](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/) I added a [NavigationLink](https://developer.apple.com/documentation/swiftui/navigationlink/) to **BandView**. The label for the **NavigationLink** includes two [VStacks](https://developer.apple.com/documentation/swiftui/vstack/). One that includes the band logo (image) and one that includes the band name. 

The basic syntax for **GridLayout** looks like this:

```
ScrollView {
	LazyVGrid(columns: columns) {
		ForEach(bands) { band in
			NavigationLink {
				BandView(band: band, musicians: musicians:, albums: albums)
			} label: {
				VStack {
					Image(band.image)
						.modifiers

				VStack {
					Text(band.displayName)
						.modifiers
				}
				.modifiers
			}
			.modifiers
		}
	}
}
```
---

### ListLayout
`ListLayout.swift`

Similarly to **GridLayout** I added these three variables.

```
let musicians: [String: Musician]
let bands: [Band]
let albums: [String: Album]
```
I started building the layout by adding a [List](https://developer.apple.com/documentation/swiftui/list/) with a closure that takes in a band. Inside the **List** closure I added a **NavigationLink** to **BandView**. The label for NavigationLink includes an [HStack](https://developer.apple.com/documentation/swiftui/hstack/) that includes the band logo (Image) as well as a **VStack** that includes the band name. 

The basic syntax for **ListView** looks like this:

```
List(bands) { band in
	NavigationLink {
		BandView(band: band, musicians: musicians, albums: albums)
	} label: {
		HStack {
			Image(band.image)
				.modifiers
			VStack {
				Text(band.displayName)
					.modifiers

			}
		}
	}
	.modifier
}
```
---


### ContentView
`ContentView.swift`

Back in **ContentView** I had previously mentioned that I wanted the user to be able to toggle between either **GridLayout** or **ListLayout**. 

To accomplish this I started by adding this variable

`@AppStorage("showingGrid") private var showingGrid = false`

By using [@AppStorage](https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-appstorage-property-wrapper) I could watch the users [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults/) and whenever a user changed their preference from grid layout to list layout, **showingGrid** would be updated. This would allow some persistence. I know that @AppStorage is not the safest way to utilize persistence, but since no personal data is being accessed I decided to utilize it for this simple list mechanism. 

Next I added a [NavigationStack](https://developer.apple.com/documentation/swiftui/navigationstack/). Inside of the **NavigationStack** I added a [Group](https://developer.apple.com/documentation/swiftui/group/) that includes an [if else statement](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/statements/) utilizing **showingGrid**. I finished by adding a toolbar with a button that would allow the user to toggle between a grid layout or a list layout. 

Here is the basic syntax for **ContentView**:

```
NavigationStack {
	Group {
		if showingGrid {
			GridLayout()
		} else {
			ListLayout()
		}
	}
	.toolbar {
		Button {
			showingGrid.toggle()
		} label: {
			if showingGrid {
					Label()
				} else {
					Label()
			}
		}
	}
}
```
---


### BandView
`BandView.swift`


**BandView** will present the bands logo, a bio, band members, and essential albums to the user. For band members and essential albums I am utilizing both **BandRoster** and **AlbumRoster** which are two separate views. I did this so that I could present both of these categories as scrollable images to the user. (More information in sections below.)

I started building out **BandView** by adding two **structs** and three **variables** that reference our **Musician**, **Band**, and **Album** structs.

```
struct BandMember {
let role: String
let musician: Musician
}

struct BandAlbums {
let year: String
let album: Album
}

let band: Band
let members: [BandMember]
let essentialAlbums: [BandAlbums]
```
Now that I had that in place I could build out the basic architecture of the view:

I started by adding a [GeometryReader](https://developer.apple.com/documentation/swiftui/geometryreader/). Inside of the **GeometryReader** I placed a **ScrollView**. Inside of that ScrollView I placed a **VStack**. Inside of this VStack is an **Image()**. Under the image I nested another **VStack**. Just inside of this VStack I added my **CustomDivider()**. This provided good aesthetic and broke up the next sections away from the band logo. Under the **CustomDivider()** I added three **text** fields. One with a heading of "Bio". One with the band description. The last text field is the Wikipedia disclaimer. Under this text field I added another **CustomDivider()**. Next I added a **text** field with a heading of "Members". 

Just outside of the internal **VStack**, but inside of the external **VStack** I added **BandRoster()** which would bring in our horizontal scrollable band members list. Below **BandRoster()**  I added another **CustomDivider()**. Then I added a text field with a heading of "Essential Albums". Below this text field I added **AlbumRoster()** which would bring in the horizontal scrollable view of band albums. 

The basic syntax for **BandView** looks like this:

```
GeometryReader { geometry in
	ScrollView {
		VStack {
			Image()
				.modifiers

			VStack {
				CustomDivider()
			
				Text("Bio")
					.modifiers
				Text(band.description)
					.modifiers
				Text()
					.modifiers
					
				CustomDivider()

				Text("Members")
					.modifiers

			}
				
				BandRoster()

				CustomDivider()

				Text("Essential Albums")
					.modifiers

				AlbumRoster()
		}
	}
}
```

Lastly in **BandView** I had to add an [initializer](https://www.hackingwithswift.com/sixty/7/8/initializers) for our **band, members**, and **essentialAlbums** variables.  This is so because these are instances of the **Band, BandMember**, and the **BandAlbum** structs. 

Here is the syntax for the initializer!

```
init(band: Band, musicians: [String: Musician], albums: [String: Album]) {
	self.band = band

	self.members = band.bandMembers.map { member in
		if let musician = musicians[member.name] {
			return BandMember(role: member.role, musician: musician)
		} else {
			fatalError("Missing \(member.name)")
		}
	}
	self.essentialAlbums = band.albums.map { essentialAlbum in
		if let album = albums[essentialAlbum.name] {
			return BandAlbums(year: essentialAlbum.year, album: album)
		} else {
			fatalError("Missing \(essentialAlbum.name)")
		}
	}
}
```

Whew! That was a mind bender. 

---

### BandRoster
`BandRoster.swift`

When the user is viewing a particular band in **BandView** I wanted them to be able to see the band members and the essential albums for that particular band. I wanted to present an image of the band member, their name, and their role in the band. I wanted this to be a small section that the user could scroll through, since each band has a different amount of members. 

To do this I would build out the band roster view and then implement it into **BandView**.

I started by adding a **ScrollView** with the modifier of **.horizontal**, and [showsIndicators](https://developer.apple.com/documentation/swiftui/scrollview/showsindicators/) set to false. Inside the ScrollView I added an **HStack**. Inside of the HStack I added a **ForEach** closure that takes in **bandMember**. Inside of the ForEach closure I added a **NavigationLink** to **MusicianView**.

The label for the NavigationLink includes an HStack that includes an **Image** of the band member, and then a **VStack**. Inside of this VStack are two **Text** fields. One text field is the band members name. The other text field is the band members role in the band. 

Here is the basic syntax for **BandRoster**:

```
ScrollView(.horizontal, showsIndicators: false) {
	HStack {
		ForEach(members, id: \.role) { bandMember in
			NavigationLink {
				MusicianView()
			} label: {
				HStack {
					Image(bandMember.musician.id)
						.modifiers

					VStack {
						Text(bandMember.musician.name)
							.modifiers
						
						Text(bandMember.role)
							.modifiers
					}
				}
			}
		}
	}
}
```
I thought this was a super cool way to present the band members to the user. It adds a new dimension to the user experience. I am very happy that I learned this skill!

![Image](https://github.com/beamthecode/MyFavoriteBands/blob/main/BandRoster-iPhone.jpg?raw=true)

---

### AlbumRoster
`AlbumRoster.swift`

**AlbumRoster** utilizes basically the same code as **BandRoster** does. I wanted to display the bands essential albums as a scrollable view in the same way that I did the bands members. I really like the feel of this. *I think it adds a lot of value to the user experience*.

This view will be implemented into **BandView**.

I started by adding a **ScrollView** with the modifier of **.horizontal**, and [showsIndicators](https://developer.apple.com/documentation/swiftui/scrollview/showsindicators/) set to false. Inside the ScrollView I added an **HStack**. Inside of the HStack I added a **ForEach** closure that takes in **bandAlbum**. Inside of the ForEach closure I added a **NavigationLink** to **AlbumView**.

The label for the NavigationLink includes an HStack that includes an **Image** of the band album, and then a **VStack**. Inside of this VStack are two **Text** fields. One text field is the album name. The other text field is the year the album was released. 

Here is the basic syntax for **AlbumRoster**:

```
ScrollView(.horizontal, showsIndicators: false) {
	HStack {
		ForEach(albums, id: \.year) { bandAlbum in
			NavigationLink {
				AlbumView()
			} label: {
				HStack {
					Image(bandMember.musician.id)
						.modifiers

					VStack {
						Text(bandAlbum.album.name)
							.modifiers
						
						Text(bandMember.year)
							.modifiers
					}
				}
			}
		}
	}
}
```
I really like the way that this looks! Pretty cool that the user can scroll through the albums and then read about them!

![Image](https://github.com/beamthecode/MyFavoriteBands/blob/main/AlbumRoster-iPhone.jpg?raw=true) 

---


### MusicianView
`MusicianView.swift`

*MusicianView will present an image and a description about the band member that the user has selected.* 

I started building out **MusicianView** by adding this variable

`let musician: Musician`

The musician variable is an instance of the **Musician** struct that I created in `musician.swift`

Next, I added a **ScrollView** that has a **VStack** nested in it. Inside of the VStack I added an **Image()** and three **Text** fields. The first text field is a heading ("About"), the second text field is the description, and the last text field is a short Wikipedia disclaimer. 

Here is the basic syntax of **MusicianView**:

```
ScrollView {
	VStack {
		Image(musician.id)
			.modifiers

		Text("About")
			.modifiers

		Text(musician.description)
			.modifiers

		Text()
			.modifiers
	}
}
```




---
### AlbumView
`AlbumView.swift`

*AlbumView will present the album cover (Image), a description of the album, and the track listing of the album.*

I started building out **AlbumView** by adding this variable

`let album: Album`

The album variable is an instance of the **Album** struct that I built out in `Album.swift`.

Next, I added a **ScrollView** that has a **VStack** nested in it. Inside of the VStack I added an **Image()** and five **Text** fields.

The five text fields:
* A heading ("About")
* The albums description
* A heading ("Track Listing")
* The albums track listing
* Wikipedia disclaimer

Here is the basic syntax for **AlbumView**:

```
ScrollView {
	VStack {
		Image(album.id)
			.modifiers

		Text("About")
			.modifiers

		Text(album.description)
			.modifiers

		Text("Track Listing")
			.modifiers

		Text(album.tracks)
			.modifiers

		Text()
			.modifiers
	}
}
```

**AlbumView** and **MusicianView** are very similar in layout and appearance. *I thought that was important in terms of continuity across the app*. 




---

## Design 

![Image](https://img.shields.io/badge/Color%20-white
) ![Image](https://img.shields.io/badge/ShapeStyle%20-white
) ![Image](https://img.shields.io/badge/CustomDivider()%20-white
) ![Image](https://img.shields.io/badge/CustomFont%20-white
) ![Image](https://img.shields.io/badge/SpecialElite-Regular%20-white
) ![Image](https://img.shields.io/badge/Indie%20Aesthetic%20-white
)

### Color
`Color.swift`

I wanted to give the app some custom color. I thought a gray color scheme would be a really cool vibe. To do this I had to create an extension on [ShapeStyle](https://developer.apple.com/documentation/swiftui/shapestyle/) I created two computed properties within the extension, one called **darkBackground** and one called **lightBackground** and set their colors accordingly. 

Here is the syntax for this extension:

```
extension ShapeStyle where Self == Color {
	static var darkBackground: Color {
		Color(red: 0.5, green: 0.5, blue: 0.5)
	}
	static var lightBackground: Color {
		Color(red: 0.6, green: 0.6, blue: 0.6)
	}
}
```

I originally learned how to write this extension when taking the [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. Since I have used it in several different projects that I have worked on. Credit where it is deserved!

---

### Custom-Divider
`Custom-Divider.swift`

I originally learned how to create this custom divider when taking the [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. I have found that this is a very handy piece of design code. I like the way this divider breaks up a view, especially when the view contains lots of text. I think it provides for a much better user experience. 

In appearance, it is basically just a straight line. It can be placed in a view to provide the appearance of a divider between sections. Here is the syntax to create the divider:

```
struct CustomDivider: View {
	var body: some View {
		Rectangle()
			.frame(height: 2)
			.foregroundStyle(.lightBackground)
			.padding(.vertical)

	}
}
```
This **CustomDivider()** is featured prominently throughout **BandView** to break up the bio, members, and albums sections. The **CustomDivider()** can also be found in **AlbumView** between the album description and track listing sections. I think it adds great aesthetic to the app!

---

### Font
`SpecialElite-Regular.ttif`

I decided to go with a custom font to give the application a little new blood. *I went with **SpecialElite-Regular** which gives off a sort of old school typewriter vibe, but also a sort of indie rock feel. I love it.* I found it at [Google Fonts](https://fonts.google.com). Once I had it downloaded I imported it into my app. 

All text in the application utilizes this font, with different sizes and modifiers for effect. *Voila!*

---

## Images
***GridLayout on an iPhone 15 Pro***

![Image](https://github.com/beamthecode/MyFavoriteBands/blob/main/GridLayout-iPhone.jpg?raw=true)

***ListLayout on an iPhone 15 Pro***

![Image](https://github.com/beamthecode/MyFavoriteBands/blob/main/ListLayout-iPhone.jpg?raw=true)

***BandView on an iPhone 15 Pro***

![Image](https://github.com/beamthecode/MyFavoriteBands/blob/main/BandView-iPhone-1.jpg?raw=true)

![Image](https://github.com/beamthecode/MyFavoriteBands/blob/main/BandView-iPhone-2.jpg?raw=true)

***MusicianView on an iPhone 15 Pro***

![Image](https://github.com/beamthecode/MyFavoriteBands/blob/main/MusicianView-iPhone.jpg?raw=true)

***AlbumView on an iPhone 15 Pro***

![Image](https://github.com/beamthecode/MyFavoriteBands/blob/main/AlbumView-iPhone-1.jpg?raw=true)

![Image](https://github.com/beamthecode/MyFavoriteBands/blob/main/AlbumView-iPhone-2.jpg?raw=true)

---


## Notes


I want to thank anyone who is reading through this repo. I appreciate you checking out this portfolio project. It was a lot of fun to build. If you have any suggestions, constructive criticism, or feedback please reach out! I want to continuously improve my skills and I love any feedback I can get. I truly want to be the biggest asset that I can. 

All information included in this app is courtesy of Wikipedia. This app is not intended for commercial use. 

----
## Credit

![Image](https://img.shields.io/badge/Thank%20You!%20-white
) ![Image](https://img.shields.io/badge/%40TwoStraws%20Paul%20Hudson-white
) ![Image](https://img.shields.io/badge/100%20Days%20of%20SwiftUI-white
) ![Image](https://img.shields.io/badge/Codecademy-white
) 

I would like to credit [@TwoStraws](https://github.com/twostraws) Paul Hudson for the inspiration to begin to create my own applications. I completed the [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. I have learned a lot of good fundamentals on the way. I will always be grateful for the skills that Paul has taught me. 

I would also like to credit [Codecademy](https://www.codecademy.com/catalog). I completed their online **iOS Developer** course. That course was my first foray into learning **Swift** and **SwiftUI**. I will always be grateful for for both Paul Hudson and Codecademy as it provides anyone who is hungry to learn the ability to do so at an affordable price. 


----
## License

 2023 MIT License

