def dictionary 
  dictionary_hash = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet_string)
  tweet_array = tweet_string.split(" ") #change to string to array
  our_dictionary = dictionary #return our dictionary hash 
  org_words = our_dictionary.keys #array of dictionary keys, original words
  sub_words = our_dictionary.values #array of dictionary values, substitute words 
  tweet_array.collect do |word| #for each word in the tweet
    org_words.each do |org_word| #for each original word 
      if word.downcase == org_word #if they match
        word.replace(our_dictionary[org_word]) #replace the word in the array with the org words value in the hash
      end
    end
  end
  tweet_array.join(" ") #return the tweet as a string
end

def bulk_tweet_shortener(array_of_tweets)
  array_of_tweets.collect do |tweet| #for every tweet 
    puts word_substituter(tweet) #run through word substituter, collect and put results
  end
end

def selective_tweet_shortener(tweet)
    if tweet.length > 140 #if a single tweet is over 140 char 
      return word_substituter(tweet) #run word sub
    else 
      return tweet #else leave it be 
    end
end

def shortened_tweet_truncator(tweet)
    if word_substituter(tweet).length > 140 #if subbed tweet is still greater than 140
      tweet[0..136] + "..." #return tweet up to 136th character then fill remaining last three with . . . 
    else 
      word_substituter(tweet) #else just run original 
    end
end


