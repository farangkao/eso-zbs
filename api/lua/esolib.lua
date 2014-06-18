return {
  -- ESO Predefined Global Variables

  -- Basic library
  EVENT_LOOT_RECEIVED = {
    type = "value",
    description = "Event triggered when loot is recieved",
  },

  GetNumGuilds = {
    type = "function",
    description = "returns the Number of Guilds for the active Character",
    args = "()",
    returns = "(number)",
  },
  
  GetGuildName = {
    type = "function",
    description = "returns the Name of a Specific Guild (Values 1-5)",
    args = "(number)",
    returns = "(string)",
  },
  
  d = {
	type = "function",
	description = "prints out the text in a chat window, used for debuging",
	args = "(string)",
	returns = "()",
  },

}
