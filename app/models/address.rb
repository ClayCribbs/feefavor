class Address < ApplicationRecord
  belongs_to :courthouse

  validates_presence_of :city,
                        :state

  def displayable_location
    "#{city}, #{state}"
  end

  def full_street_address
    if self.street_line_1 == "" && self.street_line_2 == ""
      [city, state].compact.join(', ')
    elsif street_line_1.present? && street_line_2 == ""
      [street_line_1, city, state].compact.join(', ')
    else
      [street_line_1, street_line_2, city, state].compact.join(', ')
    end
  end

  def self.states
    [
      [ 'Alabama'             , 'AL' ],
      [ 'Alaska'              , 'AK' ],
      [ 'Arizona'             , 'AZ' ],
      [ 'Arkansas'            , 'AR' ],
      [ 'California'          , 'CA' ],
      [ 'Colorado'            , 'CO' ],
      [ 'Connecticut'         , 'CT' ],
      [ 'Delaware'            , 'DE' ],
      [ 'District of Columbia', 'DC' ],
      [ 'Florida'             , 'FL' ],
      [ 'Georgia'             , 'GA' ],
      [ 'Hawaii'              , 'HI' ],
      [ 'Idaho'               , 'ID' ],
      [ 'Illinois'            , 'IL' ],
      [ 'Indiana'             , 'IN' ],
      [ 'Iowa'                , 'IA' ],
      [ 'Kansas'              , 'KS' ],
      [ 'Kentucky'            , 'KY' ],
      [ 'Louisiana'           , 'LA' ],
      [ 'Maine'               , 'ME' ],
      [ 'Maryland'            , 'MD' ],
      [ 'Massachusetts'       , 'MA' ],
      [ 'Michigan'            , 'MI' ],
      [ 'Minnesota'           , 'MN' ],
      [ 'Mississippi'         , 'MS' ],
      [ 'Missouri'            , 'MO' ],
      [ 'Montana'             , 'MT' ],
      [ 'Nebraska'            , 'NE' ],
      [ 'Nevada'              , 'NV' ],
      [ 'New Hampshire'       , 'NH' ],
      [ 'New Jersey'          , 'NJ' ],
      [ 'New Mexico'          , 'NM' ],
      [ 'New York'            , 'NY' ],
      [ 'North Carolina'      , 'NC' ],
      [ 'North Dakota'        , 'ND' ],
      [ 'Ohio'                , 'OH' ],
      [ 'Oklahoma'            , 'OK' ],
      [ 'Oregon'              , 'OR' ],
      [ 'Pennsylvania'        , 'PA' ],
      [ 'Rhode Island'        , 'RI' ],
      [ 'South Carolina'      , 'SC' ],
      [ 'South Dakota'        , 'SD' ],
      [ 'Tennessee'           , 'TN' ],
      [ 'Texas'               , 'TX' ],
      [ 'Utah'                , 'UT' ],
      [ 'Vermont'             , 'VT' ],
      [ 'Virginia'            , 'VA' ],
      [ 'Washington'          , 'WA' ],
      [ 'West Virginia'       , 'WV' ],
      [ 'Wisconsin'           , 'WI' ],
      [ 'Wyoming'             , 'WY' ],
    ]
  end
end
