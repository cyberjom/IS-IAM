class Initdb < ActiveRecord::Migration[6.0]
  # enable_extension 'plpgsql'
  def change
    create_table :users  , comment: '{"uid":"6225336C-4276-40FE-9DDD-191BDA6F307D","location":{"x":1075,"y":1010},"size":{"width":230,"height":520}}' do |t|
      t.string		:username , :null=>false, comment: '{"comment":[],"uid":"BE7D3966-EF16-45A1-94E8-7081582E3F54"}'
      t.string		:email , :null=>false, comment: '{"comment":[],"uid":"9977ACAC-BC2C-428A-AEF6-43214CADD360"}'
      t.string		:firstname , :null=>false, comment: '{"comment":[],"uid":"5DB35B2D-287D-4EA7-824A-78206D730464"}'
      t.string		:lastname , comment: '{"comment":[],"uid":"0A62A34B-9ABD-479A-89D9-15380B14ED0F"}'
      t.string		:encrypted_password , :null=>false, comment: '{"comment":[],"uid":"5AFA6B10-AABF-4F0E-A566-74273BA1652D"}'
      t.string		:reset_password_token , comment: '{"comment":[],"uid":"E43629D0-B755-4690-9F71-17A2BB7D247A"}'
      t.datetime		:reset_password_sent_at , comment: '{"comment":[],"uid":"A3C1607C-37C7-4692-8DF1-9AA3CB94D7A6"}'
      t.datetime		:remember_created_at , comment: '{"comment":[],"uid":"2F0D476A-2F42-486E-B853-B31F61116C6C"}'
      t.integer		:sign_in_count , :null=>false, :default=>"0", comment: '{"comment":[],"uid":"129AE41B-25E4-4143-9BD3-7CE42D894A48"}'
      t.datetime		:current_sign_in_at , comment: '{"comment":[],"uid":"88DA6EAF-4930-49DF-AFF4-E9BA743603E0"}'
      t.datetime		:last_sign_in_at , comment: '{"comment":[],"uid":"7F8344C8-1F10-4BA4-9291-DEAB2922BC04"}'
      t.string		:current_sign_in_ip , comment: '{"comment":[],"uid":"806E16A3-7568-4E82-8A4F-03DE270AE89D"}'
      t.string		:last_sign_in_ip , comment: '{"comment":[],"uid":"A226107B-6D54-4F22-9894-4127BD25A79C"}'
      t.string		:confirmation_token , comment: '{"comment":[],"uid":"4E54941D-298A-453E-ADC8-8904BCED3707"}'
      t.datetime		:confirmed_at , comment: '{"comment":[],"uid":"995CFB27-B6A4-4297-BE0E-0D3444B7B8C9"}'
      t.datetime		:confirmation_sent_at , comment: '{"comment":[],"uid":"30EAAC7E-054D-46A4-9DA2-64514B904713"}'
      t.string		:unconfirmed_email , comment: '{"comment":[],"uid":"AFB7D672-31C1-4F30-8A05-C3AC37A002CF"}'
      t.integer		:failed_attempts , :null=>false, :default=>"0", comment: '{"comment":[],"uid":"5EDABB75-B2C2-4CA0-9D42-3FB6A0D568E6"}'
      t.string		:unlock_token , comment: '{"comment":[],"uid":"1DD1ABF9-3B89-48AE-9A33-F96046E00E56"}'
      t.datetime		:locked_at , comment: '{"comment":[],"uid":"6627D262-BAC1-4D75-B6F6-3D6CE9FF13BB"}'
      t.boolean		:active_flag , :null=>false, :default=>"true", comment: '{"comment":[],"uid":"16AE81A5-CD8A-4EE4-9C37-E6E0A2AF61FA"}'
      t.jsonb		:info , comment: '{"comment":[],"uid":"CB6F95B8-8B46-4EBC-BA2A-4AAA234D9821"}'
      t.jsonb		:vcol , comment: '{"comment":[],"uid":"1E7BD4B6-0AF8-40BB-A9EE-19DE9300BB12"}'
      t.belongs_to  :room , :null=>false, comment: '{"comment":[],"uid":"CC3C246A-D09D-4C26-A3B9-FE637CC83144"}'
      t.index	:username, unique: true
      t.index	:email, unique: true
      t.index	:firstname
      t.index	:reset_password_token, unique: true
      t.index	:active_flag
      t.index [:firstname, :lastname], unique: true
      t.timestamps
    end

    create_table :roles  , comment: '{"uid":"E4608B6E-85D5-4942-9220-C88D479C66A1","location":{"x":1742,"y":1012},"size":{"width":254,"height":180}}' do |t|
      t.string		:name , comment: '{"comment":[],"uid":"8A15C574-5269-4DA9-A2F8-5A24035F22C7"}'
      t.references		:resource, polymorphic: true , comment: '{"comment":[],"uid":"6B72BA1A-3BE8-46B9-A7B3-9ABA7B19DA3B"}'
      t.boolean		:active_flag , :null=>false, :default=>"true", comment: '{"comment":[],"uid":"C6948461-727E-45BB-B9E3-B0FBB49597DB"}'
      t.jsonb		:info , comment: '{"comment":[],"uid":"0357888B-F47B-4D76-8B46-75EA08615504"}'
      t.jsonb		:vcol , comment: '{"comment":[],"uid":"FC2A5E2D-8738-4CFE-9D09-5E8DF3F2A84D"}'
      t.index	:active_flag
      t.index [:name, :resource_type, :resource_id]
      t.timestamps
    end

    create_table :users_roles , :id => false , comment: '{"uid":"B22B9B93-98CF-4E0F-A10B-CFF0C6BF17B6","location":{"x":1371,"y":1010},"size":{"width":303,"height":80}}' do |t|
      t.belongs_to  :user , comment: '{"comment":[],"uid":"7E8059C0-8C11-4B75-82D7-EEE074FE4C96"}'
      t.belongs_to  :role , comment: '{"comment":[],"uid":"77E3DC0E-D1F0-4FC4-B7F9-A4F60B450720"}'
      t.jsonb		:vcol , comment: '{"comment":[],"uid":"93F22169-8A96-4308-AD8E-BB29EE7501A3"}'
      t.index	:user_id
      t.index	:role_id
      t.index [:user_id, :role_id]
      t.timestamps
    end

    create_table :enumerations  , comment: '{"uid":"43E69782-5D02-4F49-BAB8-1CD83EB497A7","location":{"x":1744,"y":1423},"size":{"width":200,"height":260}}' do |t|
      t.string		:type , :null=>false, comment: '{"comment":[],"uid":"1924BFC0-36D4-4656-80AF-3C9BC2022AE1"}'
      t.string		:caption , :null=>false, comment: '{"comment":[],"uid":"6B60B527-B9C6-43C8-9581-A7A9153A4FD9"}'
      t.string		:hcode , comment: '{"comment":[],"uid":"EA48B3A8-33D6-45DA-9EE6-1490475CF80F"}'
      t.string		:key , comment: '{"comment":[],"uid":"30112765-DFC0-46E0-BFC6-68CA4F990839"}'
      t.integer		:position , comment: '{"comment":[],"uid":"6CF9AC0C-DF01-4813-A4F6-5FEAC274A8F5"}'
      t.string		:position_name , comment: '{"comment":[],"uid":"A7EAE42B-100F-44DA-88AA-B7DB8EACF01E"}'
      t.boolean		:is_default , :null=>false, :default=>"false", comment: '{"comment":[],"uid":"60FDA8AD-2AB8-40C4-B424-89A8475D46CD"}'
      t.boolean		:visible_flag , :default=>"true", comment: '{"comment":[],"uid":"27AC8F00-CA4B-449C-93EA-1CE4792FD2B9"}'
      t.boolean		:active_flag , :null=>false, :default=>"true", comment: '{"comment":[],"uid":"1CB0B8C1-C831-4FC8-B891-9ECAEE987862"}'
      t.jsonb		:info , comment: '{"comment":[],"uid":"6CD620EC-DE22-4DB1-9F21-FB5FE8D0F807"}'
      t.jsonb		:vcol , comment: '{"comment":[],"uid":"2796FCD5-298C-48EC-9DF4-30E9CD686D6F"}'
      t.index	:type
      t.index	:caption
      t.index	:position
      t.index	:visible_flag
      t.index	:active_flag
      t.timestamps
    end

    create_table :users_organizations , :id => false , comment: '{"uid":"0081F753-5178-46E2-868C-72B49270363F","location":{"x":811,"y":1009},"size":{"width":200,"height":80}}' do |t|
      t.belongs_to  :user , comment: '{"comment":[],"uid":"FDB3288A-A526-4B8B-8C10-199C8311F8CF"}'
      t.belongs_to  :organization , comment: '{"comment":[],"uid":"4B5B9D41-DA1A-4772-83C4-E538C0E4F6D9"}'
      t.jsonb		:vcol , comment: '{"comment":[],"uid":"2F76C519-DA3C-4E61-B78B-D8B4C65DB807"}'
      t.index [:user_id, :organization_id]
      t.timestamps
    end

    create_table :users_groups , :id => false , comment: '{"uid":"9A9FB169-2997-43E4-8252-E27409DB0CF5","location":{"x":1374,"y":1124},"size":{"width":144,"height":80}}' do |t|
      t.belongs_to  :user , comment: '{"comment":[],"uid":"6D85F442-4102-4E20-BB7E-F6912392145C"}'
      t.belongs_to  :group , comment: '{"comment":[],"uid":"05BC2679-892E-49C4-8221-7CCD2C0748F9"}'
      t.jsonb		:vcol , comment: '{"comment":[],"uid":"92ED9322-6B77-40A6-A2F3-FB04E4C1EBA3"}'
      t.index	:user_id
      t.index	:group_id
      t.index [:user_id, :group_id]
      t.timestamps
    end

    create_table :groups  , comment: '{"uid":"BFC27BEF-D85E-40DE-9DB2-D5BC994B441B","location":{"x":1742,"y":1228},"size":{"width":303,"height":160}}' do |t|
      t.string		:name , comment: '{"comment":[],"uid":"1B4334CE-E5B2-4A73-B6AE-E2429A4CCE87"}'
      t.boolean		:active_flag , :null=>false, :default=>"true", comment: '{"comment":[],"uid":"E6C4AF6A-1655-44E4-B921-777F05EA1061"}'
      t.jsonb		:info , comment: '{"comment":[],"uid":"7E0C40AA-C681-4B8F-9AF0-AEA6FC7412DE"}'
      t.jsonb		:vcol , comment: '{"comment":[],"uid":"D0B8EB20-C659-4AE2-A337-83A1CE7DFD11"}'
      t.index	:active_flag
      t.timestamps
    end

    create_table :rooms  , comment: '{"uid":"E3DA8276-F6A2-4F08-B132-D04323655F0F","location":{"x":1373,"y":1241},"size":{"width":199,"height":180}}' do |t|
      t.belongs_to  :room_type, references: :enumerations , :null=>false, comment: '{"comment":[],"uid":"253B9017-7667-4E72-971D-D8F6751AD83A"}'
      t.string		:caption , :null=>false, comment: '{"comment":[],"uid":"620BB062-AF33-41C8-B74D-E2984D3DC5B2"}'
      t.string		:contact , comment: '{"comment":[],"uid":"89E52967-9BC5-4612-AA48-C33C24906F8A"}'
      t.string		:telephone , comment: '{"comment":[],"uid":"1D28BEEF-A80B-40E1-B540-0D66808EFAF9"}'
      t.boolean		:active_flag , :null=>false, :default=>"true", comment: '{"comment":[],"uid":"60BAD8FF-1BF2-44DC-B11D-322CDA0C7A3F"}'
      t.jsonb		:vcol , comment: '{"comment":[],"uid":"CF671096-6B05-4309-B8D0-6331C1173F79"}'
      t.jsonb		:info , comment: '{"comment":[],"uid":"EF3D3FC8-E672-4C0D-BB3F-85B9A44A465A"}'
      t.index	:active_flag
      t.timestamps
    end

    create_table :organizations  , comment: '{"uid":"E4793E80-B55C-4E21-9C15-1145475B3C98","location":{"x":519,"y":1009},"size":{"width":221,"height":380}}' do |t|
      t.string		:type , :null=>false, comment: '{"comment":[],"uid":"25B35510-3893-4C96-9055-E84C9FC59351"}'
      t.string		:hcode , :limit=>15, comment: '{"comment":[],"uid":"17FA6544-16DD-4793-A5DD-70CEF8B5B7A0"}'
      t.string		:display_name_as , :null=>false, comment: '{"comment":[],"uid":"40C581FB-28F0-43B7-924B-F80923DC1433"}'
      t.integer		:prename_id , comment: '{"comment":[],"uid":"29ACF133-7A54-4C8C-8B2C-BD39E8256C8A"}'
      t.string		:firstname , comment: '{"comment":[],"uid":"5ECED325-EC8F-4EF1-B636-9280E85C956F"}'
      t.string		:lastname , comment: '{"comment":[],"uid":"7CBAC88B-3BC0-4A2C-950A-421E50A2E3F7"}'
      t.string		:company_name , comment: '{"comment":[],"uid":"E50DE838-0DD8-4EC7-B6C6-47BB12B5F6F0"}'
      t.string		:email , comment: '{"comment":[],"uid":"7CE09769-0002-42CA-A669-553DDDE3BBD2"}'
      t.string		:address , comment: '{"comment":[],"uid":"74A70AB7-5C70-47BF-8E73-793888A0AE2D"}'
      t.integer		:province_id , comment: '{"comment":[],"uid":"4AB1BE08-C0BE-4B3E-9824-75CB0D2AB7F8"}'
      t.string		:zip_code , :limit=>10, comment: '{"comment":[],"uid":"0927F343-3512-465A-8E17-E04C8ABDB14D"}'
      t.string		:contact , comment: '{"comment":[],"uid":"FE7BA380-A7DA-42FB-9D78-58962D2CB68A"}'
      t.string		:telephone , comment: '{"comment":[],"uid":"8CBF7084-925B-46AA-9A60-E2C013DF3B7F"}'
      t.string		:identification_number , :limit=>13, comment: '{"comment":[],"uid":"E1B9E2EC-64B8-41D3-944F-8E795C61CB61"}'
      t.boolean		:active_flag , :null=>false, :default=>"true", comment: '{"comment":[],"uid":"FA48248C-25B5-4610-9885-D4466586A147"}'
      t.jsonb		:vcol , comment: '{"comment":[],"uid":"156AD257-B976-4122-8049-E6CC16640C10"}'
      t.jsonb		:info , comment: '{"comment":[],"uid":"95D6D0A2-F3F4-49BA-84D6-4065171A80CF"}'
      t.index	:type
      t.index	:display_name_as, unique: true
      t.index	:active_flag
      t.timestamps
    end

  end
end
