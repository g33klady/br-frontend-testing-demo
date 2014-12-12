describe "Mapbox Map", ->

  describe "location keys", ->

    it "should create a key containing city, state, and country", ->
      expect(MAP.buildKey("Dayton", "Ohio", "USA")).toEqual("DaytonOhioUSA")

    it "should create the correct key when state is null", ->
      expect(MAP.buildKey("Dayton", null, "USA")).toEqual("DaytonUSA")

    it "should create the correct key when state is an empty string", ->
      expect(MAP.buildKey("Dayton", "", "USA")).toEqual("DaytonUSA")


  describe "icons", ->

    it "should default to the attending icon", ->
      spyOn(MAP, 'validCoordinates').andReturn true

      icon = MAP.plotMarker({}).properties.icon

      expect(icon).toEqual MAPDATA.icons.attending

  describe "coords", ->
    it "should return true for [0,0]", ->
      expect(MAP.validCoordinates([0,0])).toBe true

    it "should return true for [-23.123123, 76.2342345]", ->
      expect(MAP.validCoordinates([-23.123123, 76.2342345])).toBe true

    it "should return false for null", ->
      expect(MAP.validCoordinates(null)).toBe false

    it "should return false for [null,null]", ->
      expect(MAP.validCoordinates([null,null])).toBe false

    it "should return false for undefined", ->
      expect(MAP.validCoordinates(undefined)).toBe false

    it "should return false for []", ->
      expect(MAP.validCoordinates([])).toBe false

    it "should return false for [1,2,3]", ->
      expect(MAP.validCoordinates([1,2,3])).toBe false


    it "should ignore markers when the coordinates are invalid", ->
      spyOn(MAP, 'validCoordinates').andReturn false

      expect(MAP.plotMarker
        coordinates: ""
      ).toBe undefined

