/*
 iMedia Browser Framework <http://karelia.com/imedia/>
 
 Copyright (c) 2005-2012 by Karelia Software et al.
 
 iMedia Browser is based on code originally developed by Jason Terhorst,
 further developed for Sandvox by Greg Hulands, Dan Wood, and Terrence Talbot.
 The new architecture for version 2.0 was developed by Peter Baumgartner.
 Contributions have also been made by Matt Gough, Martin Wennerberg and others
 as indicated in source files.
 
 The iMedia Browser Framework is licensed under the following terms:
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in all or substantial portions of the Software without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to permit
 persons to whom the Software is furnished to do so, subject to the following
 conditions:
 
	Redistributions of source code must retain the original terms stated here,
	including this list of conditions, the disclaimer noted below, and the
	following copyright notice: Copyright (c) 2005-2012 by Karelia Software et al.
 
	Redistributions in binary form must include, in an end-user-visible manner,
	e.g., About window, Acknowledgments window, or similar, either a) the original
	terms stated here, including this list of conditions, the disclaimer noted
	below, and the aforementioned copyright notice, or b) the aforementioned
	copyright notice and a link to karelia.com/imedia.
 
	Neither the name of Karelia Software, nor Sandvox, nor the names of
	contributors to iMedia Browser may be used to endorse or promote products
	derived from the Software without prior and express written permission from
	Karelia Software or individual contributors, as appropriate.
 
 Disclaimer: THE SOFTWARE IS PROVIDED BY THE COPYRIGHT OWNER AND CONTRIBUTORS
 "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
 LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE,
 AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT, OR OTHERWISE, ARISING FROM, OUT OF, OR IN CONNECTION WITH, THE
 SOFTWARE OR THE USE OF, OR OTHER DEALINGS IN, THE SOFTWARE.
*/


// Author: Peter Baumgartner, Mike Abdullah


//----------------------------------------------------------------------------------------------------------------------


#pragma mark ABSTRACT

// This singleton class loads all registered parsers and keeps instances around for the duration of the app lifetime.
// A parser is thus an extremely long-lived object, which can store state and talk to asynchronous APIs. This gives
// developers the chance to implemenent parsers for web based services, Spotlight, Image Capture etc. Just before the
// app quits the parsers are unloaded, at which time they can clean up...
//
// Although individual parsers are intended to work on background threads, IMBParserController instances are not threadsafe and should only be accessed from the main thread. Class methods for parser registration should be threadsafe


//----------------------------------------------------------------------------------------------------------------------


#pragma mark CLASSES

@class IMBParser;
@protocol IMBParserControllerDelegate;


//----------------------------------------------------------------------------------------------------------------------


#pragma mark 

@interface IMBParserController : NSObject
{
	NSMutableDictionary* _loadedParsers;
	id <IMBParserControllerDelegate> _delegate;
	BOOL _loadingCustomParsers;
}

// Create singleton instance of the controller. Don't forget to set the delegate early in the app lifetime...

+ (IMBParserController*) sharedParserController;
@property (assign) id <IMBParserControllerDelegate> delegate;

// Register parser classes. This should be called from the +load method of a parser class...

+ (void) registerParserClass:(Class)inParserClass forMediaType:(NSString*)inMediaType;
+ (void) unregisterParserClass:(Class)inParserClass;
+ (NSMutableSet*) registeredParserClassesForMediaType:(NSString*)inMediaType;

// Load all supported parsers. The delegate can restrict which parsers are loaded...

- (void) reset; 

// Add/remove parser instances dynamically. These methods are useful for parsers that mimic dynamically appearing
// content, e.g. connected devices (cameras, network volumes, etc)...

- (BOOL) addDynamicParser:(IMBParser*)inParser forMediaType:(NSString*)inMediaType;
- (BOOL) removeDynamicParser:(IMBParser*)inParser;

// Add/remove custom parsers. This is usually used for folder based parsers that are dragged into the outline view.
// Please note that this method should be called after loadParsers...
// SANDBOXING: Requires the com.apple.security.files.bookmarks.app-scope entitlement
- (BOOL) addCustomParser:(IMBParser*)inParser forMediaType:(NSString*)inMediaType;
- (BOOL) removeCustomParser:(IMBParser*)inParser;

// Returns an array of loaded parsers. This combines the regular parsers (which were instantiated by loadParsers)
// with the custom parsers (which were instantiated by the user or by loadCustomParsersFromPreferences)...

- (NSArray *)parsersForMediaType:(NSString *)mediaType;
- (NSArray *)parsers;

// Debugging support...
#ifdef DEBUG
- (void) logRegisteredParserClasses;
- (void) logParsers;
#endif

// External finding of an active parser. Can't name the argument "class" as that breaks C++ apps linking against iMedia
- (IMBParser *)parserOfClass:(Class)parserClass forMediaType:(NSString *)aMediaType;

@end


//----------------------------------------------------------------------------------------------------------------------


#pragma mark 

@protocol IMBParserControllerDelegate <NSObject>

@optional

// Handy place to finish setting up a parser such as Flickr
// Return nil to suppress loading a particular parser. Default (if you don't implement this method) is to return nil if [parser canBeUsed] returns NO. You likely want to replicate that check in your implementation
- (IMBParser *)parserController:(IMBParserController *)controller willLoadParser:(IMBParser *)parser;

// Used to return a BOOL so that delegate could cancel the load. Now goes ignored, use one of the should methods instead
- (void) parserController:(IMBParserController*)inController didLoadParser:(IMBParser*)inParser forMediaType:(NSString*)inMediaType;

- (void) parserController:(IMBParserController*)inController willUnloadParser:(IMBParser*)inParser forMediaType:(NSString*)inMediaType;


#pragma mark Deprecated
// Called before loading of registered parsers, but NOT for custom or dynamic parsers
- (BOOL) parserController:(IMBParserController*)inController shouldLoadParser:(NSString*)inParserClassName forMediaType:(NSString*)inMediaType;


@end


//----------------------------------------------------------------------------------------------------------------------


