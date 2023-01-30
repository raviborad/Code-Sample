/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Entry {
	public var imname : Imname?
    public var imimage : Array<Imimage>?
	public var summary : Summary?
	//KKpublic var im:price : Im:price?
	//KKpublic var im:contentType : Im:contentType?
	public var rights : Rights?
	public var title : Title?
	public var link : Array<Link>?
	public var id : Id?
	//KKpublic var im:artist : Im:artist?
	public var category : Category?
	//KKpublic var im:releaseDate : Im:releaseDate?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let entry_list = Entry.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Entry Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Entry]
    {
        var models:[Entry] = []
        for item in array
        {
            models.append(Entry(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let entry = Entry(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Entry Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["im:name"] != nil) { imname = Imname(dictionary: dictionary["im:name"] as! NSDictionary) }
        if (dictionary["im:image"] != nil) { imimage = Imimage.modelsFromDictionaryArray(array: dictionary["im:image"] as! NSArray) }
		if (dictionary["summary"] != nil) { summary = Summary(dictionary: dictionary["summary"] as! NSDictionary) }
        //KKif (dictionary["im:price"] != nil) { im:price = Im:price(dictionary: dictionary["im:price"] as! NSDictionary) }
        //KKif (dictionary["im:contentType"] != nil) { im:contentType = Im:contentType(dictionary: dictionary["im:contentType"] as! NSDictionary) }
		if (dictionary["rights"] != nil) { rights = Rights(dictionary: dictionary["rights"] as! NSDictionary) }
		if (dictionary["title"] != nil) { title = Title(dictionary: dictionary["title"] as! NSDictionary) }
        if (dictionary["link"] != nil) { link = Link.modelsFromDictionaryArray(array: dictionary["link"] as! NSArray) }
		if (dictionary["id"] != nil) { id = Id(dictionary: dictionary["id"] as! NSDictionary) }
        //KKif (dictionary["im:artist"] != nil) { im:artist = Im:artist(dictionary: dictionary["im:artist"] as! NSDictionary) }
		if (dictionary["category"] != nil) { category = Category(dictionary: dictionary["category"] as! NSDictionary) }
        //KKif (dictionary["im:releaseDate"] != nil) { im:releaseDate = Im:releaseDate(dictionary: dictionary["im:releaseDate"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.imname?.dictionaryRepresentation(), forKey: "im:name")
		dictionary.setValue(self.summary?.dictionaryRepresentation(), forKey: "summary")
        //KKdictionary.setValue(self.im:price?.dictionaryRepresentation(), forKey: "im:price")
        //KKdictionary.setValue(self.im:contentType?.dictionaryRepresentation(), forKey: "im:contentType")
		dictionary.setValue(self.rights?.dictionaryRepresentation(), forKey: "rights")
		dictionary.setValue(self.title?.dictionaryRepresentation(), forKey: "title")
		dictionary.setValue(self.id?.dictionaryRepresentation(), forKey: "id")
        //KKdictionary.setValue(self.im:artist?.dictionaryRepresentation(), forKey: "im:artist")
		dictionary.setValue(self.category?.dictionaryRepresentation(), forKey: "category")
        //KKdictionary.setValue(self.im:releaseDate?.dictionaryRepresentation(), forKey: "im:releaseDate")

		return dictionary
	}

}
