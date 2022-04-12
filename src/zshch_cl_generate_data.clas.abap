    CLASS zshch_cl_generate_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

      PUBLIC SECTION.

        INTERFACES if_oo_adt_classrun .
      PROTECTED SECTION.
      PRIVATE SECTION.
    ENDCLASS.



    CLASS zshch_cl_generate_data IMPLEMENTATION.
      METHOD if_oo_adt_classrun~main.

        DATA:
          contacts             TYPE TABLE OF zshch_d_cont_a,
          renters              TYPE TABLE OF zshch_d_renter_a,
          renters_t            TYPE TABLE OF zshch_d_renter_t,
          owners               TYPE TABLE OF zshch_d_owner_a,
          owners_t             TYPE TABLE OF zshch_d_owner_t,
          parking_types        TYPE TABLE OF zshch_d_ptype_a,
          space_types          TYPE TABLE OF zshch_d_stype_a,
          spaces               TYPE TABLE OF zshch_d_pspace_a,
          orders               TYPE TABLE OF zshch_d_rorder_a,
          pay_statuses         TYPE TABLE OF zshch_c_pay_stat,
          park_names           TYPE TABLE OF zshch_c_parkname,
          bicycle_availability TYPE TABLE OF zshch_c_bicycle.

*        DELETE FROM zshch_d_cont_a.
*        DELETE FROM zshch_d_renter_a.
*        DELETE FROM zshch_d_renter_t.
*        DELETE FROM zshch_d_owner_a.
*        DELETE FROM zshch_d_owner_t.
*        DELETE FROM zshch_d_ptype_a.
*        DELETE FROM zshch_d_stype_a.
*        DELETE FROM zshch_d_pspace_a.
        DELETE FROM zshch_d_rorder_a.
*        DELETE FROM zshch_c_pay_stat.
*        DELETE FROM zshch_c_parkname.
*        DELETE FROM zshch_c_bicycle.

        contacts = VALUE #( ( mandt ='100' contact_id ='000003' phone_number ='(37529)7323255' email ='OLGACHUS@MAIL.RU' address =''  )
            ( mandt ='100' contact_id ='000004' phone_number ='(37529)3333028' email ='' address =''  )
            ( mandt ='100' contact_id ='000005' phone_number ='(48)512387765' email ='MELK2000@GMAIL.COM' address =''  )
            ( mandt ='100' contact_id ='000007' phone_number ='(37529)5328281' email ='HGDSL@MAIL.RU' address =''  )
            ( mandt ='100' contact_id ='000009' phone_number ='(48)512482312' email ='' address ='Warszawa, 10-437, Olsztynska 2/33'  )
            ( mandt ='100' contact_id ='000010' phone_number ='(37525)3331221' email ='' address =''  )
            ( mandt ='100' contact_id ='000011' phone_number ='(37529)3132654' email ='' address =''  )
            ( mandt ='100' contact_id ='000012' phone_number ='(48)302937220' email ='MOLI1980@GMAIL.COM' address =''  )
            ( mandt ='100' contact_id ='000015' phone_number ='(37529)6376529' email ='' address =''  )
            ( mandt ='100' contact_id ='000016' phone_number ='(37529)6546472' email ='' address =''  )
            ( mandt ='100' contact_id ='000017' phone_number ='(37529)8765743' email ='FERRINASTYA@GMAIL.COM' address =''  )
            ( mandt ='100' contact_id ='000018' phone_number ='(48)512465476' email ='333KABAN@GMAIL.COM' address =''  )
            ( mandt ='100' contact_id ='000019' phone_number ='(48)510110110' email ='' address =''  )
            ( mandt ='100' contact_id ='000024' phone_number ='(37529)5346729' email ='' address =''  )
            ( mandt ='100' contact_id ='000026' phone_number ='(37529)6123232' email ='' address =''  )
            ( mandt ='100' contact_id ='000033' phone_number ='(37529)6333321' email ='NPETROV@GMAIL.COM' address ='Minsk'  )
            ( mandt ='100' contact_id ='000041' phone_number ='(37529)6333022' email ='NARMSTRING@GMAIL.COM' address ='Wapakoneta'  )
            ( mandt ='100' contact_id ='000045' phone_number ='(37529)7433022' email ='AIVANOVA@GMAIL.COM' address ='Minsk'  )
            ( mandt ='100' contact_id ='000001' phone_number ='(37529)5013027' email ='ROYALBUILDIG@GMAIL.COM' address ='Minsk, 220116, Dzerginskogo 88/2'  )
            ( mandt ='100' contact_id ='000002' phone_number ='(48)544234290' email ='CRUZ1990@GMAIL.COM' address =''  )
            ( mandt ='100' contact_id ='000006' phone_number ='(37525)2887371' email ='' address ='Minsk, 220030, Lenina 6/77'  )
            ( mandt ='100' contact_id ='000008' phone_number ='(37529)3727233' email ='' address ='NY'  )
            ( mandt ='100' contact_id ='000013' phone_number ='(37529)9023334' email ='CHEKIST@MAIL.RU' address =''  )
            ( mandt ='100' contact_id ='000014' phone_number ='(37529)6548724' email ='' address ='Minsk, 220116, Dzerginskogo 82/66'  )
            ( mandt ='100' contact_id ='000020' phone_number ='(37529)6786566' email ='KRASOTA1999@MAIL.RU' address =''  )
            ( mandt ='100' contact_id ='000021' phone_number ='(48)511724690' email ='' address =''  )
            ( mandt ='100' contact_id ='000022' phone_number ='(37529)3873333' email ='' address =''  )
            ( mandt ='100' contact_id ='000025' phone_number ='(48)554629087' email ='TELE665@GMAIL.COM' address =''  )
         ).

        renters = VALUE #( ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8CF4C' renter_id ='000001' phone_number ='(37529)7323255' email ='OLGACHUS@MAIL.RU' passport ='MP2709070' rent_number ='15' discount ='6'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8EF4C' renter_id ='000002' phone_number ='(37529)3333028' email ='' passport ='MC1332939' rent_number ='63' discount ='16'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD90F4C' renter_id ='000003' phone_number ='(48)512387765' email ='MELK2000@GMAIL.COM' passport ='WW3332190' rent_number ='4' discount ='0'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD92F4C' renter_id ='000005' phone_number ='(48)512482312' email ='' passport ='CC6332310' rent_number ='31' discount ='11'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD94F4C' renter_id ='000006' phone_number ='(37525)3331221' email ='' passport ='MP3012387' rent_number ='17' discount ='6'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD96F4C' renter_id ='000007' phone_number ='(37529)3132654' email ='' passport ='MP2225543' rent_number ='85' discount ='20'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD98F4C' renter_id ='000011' phone_number ='(37529)8765743' email ='FERRINASTYA@GMAIL.COM' passport ='SD3029327' rent_number ='29' discount ='9'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9AF4C' renter_id ='000039' phone_number ='(37529)6333022' email ='NARMSTRING@GMAIL.COM' passport ='MP2834730' rent_number ='2' discount ='0'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9CF4C' renter_id ='000010' phone_number ='(37529)6546472' email ='' passport ='TT3020023' rent_number ='44' discount ='12'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9EF4C' renter_id ='000013' phone_number ='(48)510110110' email ='' passport ='PO2938162' rent_number ='47' discount ='12'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA0F4C' renter_id ='000014' phone_number ='(37529)5346729' email ='' passport ='SS4232726' rent_number ='33' discount ='11'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA2F4C' renter_id ='000009' phone_number ='(37529)6376529' email ='' passport ='PP2039865' rent_number ='5' discount ='0'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA4F4C' renter_id ='000021' phone_number ='(37529)6333321' email ='NPETROV@GMAIL.COM' passport ='MC2019607' rent_number ='0' discount ='0'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA6F4C' renter_id ='000015' phone_number ='(37529)6123232' email ='' passport ='MP1728366' rent_number ='9' discount ='0'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA8F4C' renter_id ='000043' phone_number ='(37529)7433022' email ='AIVANOVA@GMAIL.COM' passport ='MC2087607' rent_number ='0' discount ='0'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAAF4C' renter_id ='000008' phone_number ='(48)302937220' email ='MOLI1980@GMAIL.COM' passport ='TT7629271' rent_number ='27' discount ='8'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDACF4C' renter_id ='000012' phone_number ='(48)512465476' email ='333KABAN@GMAIL.COM' passport ='TT1982735' rent_number ='8' discount ='0'  )
            ( mandt ='100' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAEF4C' renter_id ='000004' phone_number ='(37529)5328281' email ='HGDSL@MAIL.RU' passport ='PP1877652' rent_number ='43' discount ='12'  )
        ).

        renters_t = VALUE #( ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8CF4C' first_name ='Olga' last_name ='Chus'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8EF4C' first_name ='Nikolas' last_name ='Chember'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD90F4C' first_name ='Petr' last_name ='Jan'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAEF4C' first_name ='Kelli' last_name ='Port'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD92F4C' first_name ='Kostya' last_name ='Durov'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD94F4C' first_name ='Boris' last_name ='Kerov'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD96F4C' first_name ='Alexej' last_name ='Zverev'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAAF4C' first_name ='Moli' last_name ='Solt'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA2F4C' first_name ='Petr' last_name ='Chelikov'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9CF4C' first_name ='Salli' last_name ='Monk'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD98F4C' first_name ='Nastya' last_name ='Ferri'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDACF4C' first_name ='Pol' last_name ='Volne'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA6F4C' first_name ='Владимир' last_name ='Соколов'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9EF4C' first_name ='Sam' last_name ='Winchester'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8CF4C' first_name ='Ольга' last_name ='Чу'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8EF4C' first_name ='Николас' last_name ='Чембер'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD90F4C' first_name ='Петр' last_name ='Ян'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAEF4C' first_name ='Келли' last_name ='Порт'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD92F4C' first_name ='Костя' last_name ='Дуров'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD94F4C' first_name ='Борис' last_name ='Керов'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD96F4C' first_name ='Алексей' last_name ='Зверев'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAAF4C' first_name ='Молли' last_name ='Солт'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA2F4C' first_name ='Петр' last_name ='Челиков'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9CF4C' first_name ='Салли' last_name ='Монк'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD98F4C' first_name ='Настя' last_name ='Ферри'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDACF4C' first_name ='Пол' last_name ='Волне'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9EF4C' first_name ='Сэм' last_name ='Винчестер'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA0F4C' first_name ='Дин' last_name ='Винчестер'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA0F4C' first_name ='Din' last_name ='Winchester'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA6F4C' first_name ='Uladzimir' last_name ='Sokolov'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA4F4C' first_name ='Nikolai' last_name ='Petrov'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA4F4C' first_name ='Николай' last_name ='Петров'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9AF4C' first_name ='Nill' last_name ='Armstrong'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9AF4C' first_name ='Нил' last_name ='Армстронг'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='E' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA8F4C' first_name ='Anna' last_name ='Ivanova'  )
            ( mandt ='100' renter_txt_uuid = cl_system_uuid=>create_uuid_x16_static(  ) langu ='R' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA8F4C' first_name ='Анна' last_name ='Иванова'  )
        ).

        owners = VALUE #( ( mandt ='100' owner_id ='000001' contact_id ='000001' birth_date ='00000000'  )
            ( mandt ='100' owner_id ='000002' contact_id ='000002' birth_date ='19680124'  )
            ( mandt ='100' owner_id ='000003' contact_id ='000006' birth_date ='19880102'  )
            ( mandt ='100' owner_id ='000004' contact_id ='000008' birth_date ='19631024'  )
            ( mandt ='100' owner_id ='000005' contact_id ='000013' birth_date ='19991206'  )
            ( mandt ='100' owner_id ='000006' contact_id ='000014' birth_date ='19850917'  )
            ( mandt ='100' owner_id ='000009' contact_id ='000020' birth_date ='20001231'  )
            ( mandt ='100' owner_id ='000010' contact_id ='000021' birth_date ='19900316'  )
            ( mandt ='100' owner_id ='000011' contact_id ='000022' birth_date ='19920504'  )
            ( mandt ='100' owner_id ='000015' contact_id ='000025' birth_date ='19771212'  )
        ).

        owners_t = VALUE #( ( mandt ='100' langu ='E' owner_id ='000001' first_name ='developer' last_name ='Royal Buildings'  )
            ( mandt ='100' langu ='E' owner_id ='000002' first_name ='Steeve' last_name ='Cruz'  )
            ( mandt ='100' langu ='E' owner_id ='000003' first_name ='Jeremy' last_name ='Bolton'  )
            ( mandt ='100' langu ='R' owner_id ='000003' first_name ='Джереми' last_name ='Болтон'  )
            ( mandt ='100' langu ='E' owner_id ='000004' first_name ='Mike' last_name ='Nilson'  )
            ( mandt ='100' langu ='E' owner_id ='000005' first_name ='Elizabette' last_name ='Nilson'  )
            ( mandt ='100' langu ='E' owner_id ='000006' first_name ='Alex' last_name ='Ovechkin'  )
            ( mandt ='100' langu ='E' owner_id ='000009' first_name ='Olga' last_name ='Petrova'  )
            ( mandt ='100' langu ='E' owner_id ='000010' first_name ='Kristian' last_name ='Naggets'  )
            ( mandt ='100' langu ='E' owner_id ='000011' first_name ='Pavel' last_name ='Velikij'  )
            ( mandt ='100' langu ='R' owner_id ='000001' first_name ='застройщик' last_name ='Королевские Здания'  )
            ( mandt ='100' langu ='R' owner_id ='000002' first_name ='Стив' last_name ='Круз'  )
            ( mandt ='100' langu ='E' owner_id ='000015' first_name ='Arkadi' last_name ='Nersh'  )
            ( mandt ='100' langu ='R' owner_id ='000004' first_name ='Майк' last_name ='Нильсон'  )
            ( mandt ='100' langu ='R' owner_id ='000005' first_name ='Элизабет' last_name ='Нильсон'  )
            ( mandt ='100' langu ='R' owner_id ='000006' first_name ='Алекс' last_name ='Овечкин'  )
            ( mandt ='100' langu ='R' owner_id ='000009' first_name ='Ольга' last_name ='Петрова'  )
            ( mandt ='100' langu ='R' owner_id ='000010' first_name ='Кристиан' last_name ='Наггетс'  )
            ( mandt ='100' langu ='R' owner_id ='000011' first_name ='Павел' last_name ='Великий'  )
            ( mandt ='100' langu ='R' owner_id ='000015' first_name ='Аркадий' last_name ='Нерш'  )
        ).

        parking_types = VALUE #( ( mandt ='100' parking_type_id ='01' parking_name ='1' address ='Minsk, Dzerginskogo 94A' bicycle_availability ='1'  )
            ( mandt ='100' parking_type_id ='02' parking_name ='2' address ='Minsk, Dzerginskogo 91' bicycle_availability ='2'  )
            ( mandt ='100' parking_type_id ='03' parking_name ='3' address ='Minsk, Dzerginskogo 96A' bicycle_availability ='2'  )
            ( mandt ='100' parking_type_id ='04' parking_name ='3' address ='Minsk, Dzerginskogo 96B' bicycle_availability ='2'  )
            ( mandt ='100' parking_type_id ='05' parking_name ='1' address ='Minsk, Dzerginskogo 92A' bicycle_availability ='1'  )
            ( mandt ='100' parking_type_id ='06' parking_name ='3' address ='Minsk, Dzerginskogo 96C' bicycle_availability ='2'  )
            ( mandt ='100' parking_type_id ='07' parking_name ='3' address ='Minsk, Dzerginskogo 96D' bicycle_availability ='2'  )
        ).

        space_types = VALUE #( ( mandt ='100' space_type_id ='01' parking_type_id ='01' space_size ='5x3' rental_day ='11.00 ' administration_fee ='37.00 ' current_space_price ='18500.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='02' parking_type_id ='01' space_size ='5x5' rental_day ='13.00 ' administration_fee ='42.00 ' current_space_price ='20500.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='03' parking_type_id ='02' space_size ='5x3' rental_day ='9.50 ' administration_fee ='29.00 ' current_space_price ='14800.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='04' parking_type_id ='02' space_size ='5x4' rental_day ='10.50 ' administration_fee ='33.00 ' current_space_price ='15700.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='05' parking_type_id ='02' space_size ='6x4' rental_day ='12.00 ' administration_fee ='40.00 ' current_space_price ='17000.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='06' parking_type_id ='03' space_size ='5x3' rental_day ='8.00 ' administration_fee ='28.00 ' current_space_price ='13100.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='07' parking_type_id ='04' space_size ='5x3' rental_day ='8.00 ' administration_fee ='28.00 ' current_space_price ='13100.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='08' parking_type_id ='05' space_size ='5x3' rental_day ='11.00 ' administration_fee ='37.00 ' current_space_price ='18700.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='09' parking_type_id ='05' space_size ='5x5' rental_day ='13.00 ' administration_fee ='42.00 ' current_space_price ='21940.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='10' parking_type_id ='06' space_size ='5x3' rental_day ='8.00 ' administration_fee ='28.00 ' current_space_price ='12200.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='11' parking_type_id ='07' space_size ='5x3' rental_day ='8.00 ' administration_fee ='28.00 ' current_space_price ='12700.00 ' currency_code = 'BYN' )
             ( mandt ='100' space_type_id ='12' parking_type_id ='06' space_size ='5x4' rental_day ='10.00 ' administration_fee ='33.00 ' current_space_price ='16100.00 ' currency_code = 'BYN' )
         ).

        spaces = VALUE #( ( mandt ='100' space_id ='000013' space_type_id ='04' owner_id ='000015' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000002' space_type_id ='01' owner_id ='000002' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000003' space_type_id ='01' owner_id ='000005' occupation_status ='2' payment_status ='2'  )
             ( mandt ='100' space_id ='000012' space_type_id ='04' owner_id ='000001' occupation_status ='1' payment_status ='2'  )
             ( mandt ='100' space_id ='000005' space_type_id ='02' owner_id ='000003' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000006' space_type_id ='02' owner_id ='000006' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000007' space_type_id ='02' owner_id ='000010' occupation_status ='2' payment_status ='2'  )
             ( mandt ='100' space_id ='000001' space_type_id ='01' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000004' space_type_id ='01' owner_id ='000003' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000008' space_type_id ='03' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000011' space_type_id ='04' owner_id ='000011' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000009' space_type_id ='03' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000010' space_type_id ='04' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000014' space_type_id ='04' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000015' space_type_id ='04' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000016' space_type_id ='04' owner_id ='000009' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000017' space_type_id ='04' owner_id ='000011' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000018' space_type_id ='04' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000019' space_type_id ='05' owner_id ='000005' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000020' space_type_id ='05' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000021' space_type_id ='05' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000022' space_type_id ='05' owner_id ='000015' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000023' space_type_id ='05' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000024' space_type_id ='06' owner_id ='000010' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000025' space_type_id ='06' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000026' space_type_id ='06' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000027' space_type_id ='06' owner_id ='000004' occupation_status ='2' payment_status ='2'  )
             ( mandt ='100' space_id ='000028' space_type_id ='06' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
             ( mandt ='100' space_id ='000029' space_type_id ='06' owner_id ='000009' occupation_status ='2' payment_status ='1'  )
             ( mandt ='100' space_id ='000030' space_type_id ='06' owner_id ='000001' occupation_status ='1' payment_status ='1'  )
        ).

        orders = VALUE #( ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000030' space_id ='000004' renter_id ='000003' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD90F4C' rent_beg_date ='20210211'
        rent_beg_time ='091622' rent_end_date ='20210214' rent_end_time ='091622' rental_total ='33.00 ' rental_discount ='3.00 ' rental_final ='30.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000031' space_id ='000009' renter_id ='000001' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8CF4C' rent_beg_date ='20210212'
     rent_beg_time ='140011' rent_end_date ='20210213' rent_end_time ='140011' rental_total ='9.00 ' rental_discount ='0.00 ' rental_final ='9.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000032' space_id ='000008' renter_id ='000005' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD92F4C' rent_beg_date ='20210215'
     rent_beg_time ='075520' rent_end_date ='20210216' rent_end_time ='075520' rental_total ='9.00 ' rental_discount ='0.00 ' rental_final ='9.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000033' space_id ='000001' renter_id ='000008' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAAF4C' rent_beg_date ='20210217'
     rent_beg_time ='184352' rent_end_date ='20210222' rent_end_time ='184352' rental_total ='55.00 ' rental_discount ='5.00 ' rental_final ='50.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000034' space_id ='000016' renter_id ='000006' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD94F4C' rent_beg_date ='20210221'
     rent_beg_time ='121231' rent_end_date ='20210222' rent_end_time ='121231' rental_total ='10.00 ' rental_discount ='0.50 ' rental_final ='9.50 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000035' space_id ='000019' renter_id ='000011' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD98F4C' rent_beg_date ='20210224'
     rent_beg_time ='224317' rent_end_date ='20210227' rent_end_time ='224317' rental_total ='36.00 ' rental_discount ='3.00 ' rental_final ='33.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000036' space_id ='000010' renter_id ='000004' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAEF4C' rent_beg_date ='20210227'
     rent_beg_time ='072611' rent_end_date ='20210329' rent_end_time ='072611' rental_total ='360.00 ' rental_discount ='54.00 ' rental_final ='306.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000037' space_id ='000004' renter_id ='000007' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD96F4C' rent_beg_date ='20210303'
     rent_beg_time ='151059' rent_end_date ='20210304' rent_end_time ='151059'  rental_total ='11.00 ' rental_discount ='1.10 ' rental_final ='9.90 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000038' space_id ='000026' renter_id ='000012' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDACF4C' rent_beg_date ='20210303'
     rent_beg_time ='231146' rent_end_date ='20210305' rent_end_time ='231146' rental_total ='16.00 ' rental_discount ='1.00 ' rental_final ='15.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000039' space_id ='000028' renter_id ='000013' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9EF4C' rent_beg_date ='20210303'
     rent_beg_time ='151059' rent_end_date ='20210308' rent_end_time ='151059' rental_total ='40.00 ' rental_discount ='6.00 ' rental_final ='34.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000040' space_id ='000017' renter_id ='000002' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8EF4C' rent_beg_date ='20210305'
     rent_beg_time ='091721' rent_end_date ='20210306' rent_end_time ='091721' rental_total ='10.00 ' rental_discount ='1.00 ' rental_final ='9.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000041' space_id ='000030' renter_id ='000009' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA2F4C' rent_beg_date ='20210306'
     rent_beg_time ='192032' rent_end_date ='20210307' rent_end_time ='192032' rental_total ='8.00 ' rental_discount ='0.50 ' rental_final ='7.50 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000042' space_id ='000001' renter_id ='000010' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9CF4C' rent_beg_date ='20210308'
     rent_beg_time ='142706' rent_end_date ='20210309' rent_end_time ='142706' rental_total ='11.00 ' rental_discount ='1.10 ' rental_final ='9.90 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000043' space_id ='000022' renter_id ='000007' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD96F4C' rent_beg_date ='20210311'
     rent_beg_time ='222145' rent_end_date ='20210312' rent_end_time ='222145' rental_total ='12.00 ' rental_discount ='1.20 ' rental_final ='10.80 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000044' space_id ='000018' renter_id ='000001' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8CF4C' rent_beg_date ='20210311'
     rent_beg_time ='235155' rent_end_date ='20210315' rent_end_time ='235155' rental_total ='40.00 ' rental_discount ='2.00 ' rental_final ='38.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000045' space_id ='000008' renter_id ='000012' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDACF4C' rent_beg_date ='20210313'
     rent_beg_time ='074412' rent_end_date ='20210315' rent_end_time ='074412' rental_total ='18.00 ' rental_discount ='0.90 ' rental_final ='17.10 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000046' space_id ='000025' renter_id ='000003' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD90F4C' rent_beg_date ='20210319'
     rent_beg_time ='114130' rent_end_date ='20210320' rent_end_time ='114130' rental_total ='8.00 ' rental_discount ='0.00 ' rental_final ='8.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000047' space_id ='000024' renter_id ='000009' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA2F4C' rent_beg_date ='20210320'
     rent_beg_time ='091047' rent_end_date ='20210321' rent_end_time ='091047' rental_total ='8.00 ' rental_discount ='0.00 ' rental_final ='8.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000048' space_id ='000026' renter_id ='000011' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD98F4C' rent_beg_date ='20210324'
     rent_beg_time ='065459' rent_end_date ='20210407' rent_end_time ='065459' rental_total ='112.00 ' rental_discount ='16.80 ' rental_final ='95.20 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000049' space_id ='000014' renter_id ='000001' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8CF4C' rent_beg_date ='20210327'
     rent_beg_time ='132227' rent_end_date ='20210403' rent_end_time ='132227' rental_total ='70.00 ' rental_discount ='7.00 ' rental_final ='63.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000050' space_id ='000016' renter_id ='000001' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8CF4C' rent_beg_date ='20210329'
     rent_beg_time ='071148' rent_end_date ='20210330' rent_end_time ='071148' rental_total ='10.00 ' rental_discount ='0.50 ' rental_final ='9.50 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000051' space_id ='000009' renter_id ='000004' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAEF4C' rent_beg_date ='20210406'
     rent_beg_time ='152440' rent_end_date ='20210408' rent_end_time ='152440' rental_total ='18.00 ' rental_discount ='0.90 ' rental_final ='17.10 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000052' space_id ='000026' renter_id ='000002' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8EF4C' rent_beg_date ='20210409'
     rent_beg_time ='172300' rent_end_date ='20210410' rent_end_time ='172300' rental_total ='8.00 ' rental_discount ='0.00 ' rental_final ='8.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000053' space_id ='000014' renter_id ='000010' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9CF4C' rent_beg_date ='20210415'
     rent_beg_time ='190351' rent_end_date ='20210418' rent_end_time ='190351' rental_total ='30.00 ' rental_discount ='3.00 ' rental_final ='27.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000054' space_id ='000001' renter_id ='000007' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD96F4C' rent_beg_date ='20210419'
     rent_beg_time ='081247' rent_end_date ='20210424' rent_end_time ='081247' rental_total ='55.00 ' rental_discount ='7.70 ' rental_final ='47.30 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000055' space_id ='000004' renter_id ='000012' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDACF4C' rent_beg_date ='20210422'
     rent_beg_time ='112427' rent_end_date ='20210427' rent_end_time ='112427' rental_total ='55.00 ' rental_discount ='3.00 ' rental_final ='52.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000056' space_id ='000028' renter_id ='000013' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9EF4C' rent_beg_date ='20210502'
     rent_beg_time ='141132' rent_end_date ='20210503' rent_end_time ='141132' rental_total ='8.00 ' rental_discount ='0.00 ' rental_final ='8.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000057' space_id ='000017' renter_id ='000014' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA0F4C' rent_beg_date ='20210507'
     rent_beg_time ='104751' rent_end_date ='20210508' rent_end_time ='104751' rental_total ='10.00 ' rental_discount ='0.00 ' rental_final ='10.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000058' space_id ='000023' renter_id ='000012' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDACF4C' rent_beg_date ='20211206'
     rent_beg_time ='172048' rent_end_date ='20211207' rent_end_time ='172048' rental_total ='12.00 ' rental_discount ='0.00 ' rental_final ='12.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000059' space_id ='000019' renter_id ='000009' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA2F4C' rent_beg_date ='20211207'
     rent_beg_time ='184940' rent_end_date ='20211208' rent_end_time ='184940' rental_total ='12.00 ' rental_discount ='0.00 ' rental_final ='12.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000060' space_id ='000001' renter_id ='000011' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD98F4C' rent_beg_date ='20211207'
     rent_beg_time ='185112' rent_end_date ='20211209' rent_end_time ='185112' rental_total ='22.00 ' rental_discount ='1.98 ' rental_final ='20.02 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000061' space_id ='000004' renter_id ='000003' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD90F4C' rent_beg_date ='20211207'
     rent_beg_time ='190633' rent_end_date ='20211210' rent_end_time ='190633' rental_total ='33.00 ' rental_discount ='0.00 ' rental_final ='33.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000062' space_id ='000028' renter_id ='000015' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA6F4C' rent_beg_date ='20211210'
     rent_beg_time ='135555' rent_end_date ='20220104' rent_end_time ='135555' rental_total ='200.00 ' rental_discount ='0.00 ' rental_final ='200.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000063' space_id ='000021' renter_id ='000007' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD96F4C' rent_beg_date ='20211213'
     rent_beg_time ='155345' rent_end_date ='20211214' rent_end_time ='155345' rental_total ='12.00 ' rental_discount ='2.40 ' rental_final ='9.60 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000064' space_id ='000009' renter_id ='000015' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA6F4C' rent_beg_date ='20211214'
     rent_beg_time ='155853' rent_end_date ='20220108' rent_end_time ='155853' rental_total ='225.00 ' rental_discount ='0.00 ' rental_final ='225.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000066' space_id ='000015' renter_id ='000015' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA6F4C' rent_beg_date ='20220126'
     rent_beg_time ='150913' rent_end_date ='20220130' rent_end_time ='150913' rental_total ='40.00 ' rental_discount ='0.00 ' rental_final ='40.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000067' space_id ='000028' renter_id ='000005' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD92F4C' rent_beg_date ='20220131'
     rent_beg_time ='204815' rent_end_date ='20220202' rent_end_time ='204815' rental_total ='16.00 ' rental_discount ='1.76 ' rental_final ='14.24 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000068' space_id ='000023' renter_id ='000009' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA2F4C' rent_beg_date ='20220203'
     rent_beg_time ='212314' rent_end_date ='20220204' rent_end_time ='212314' rental_total ='12.00 ' rental_discount ='0.00 ' rental_final ='12.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000069' space_id ='000009' renter_id ='000002' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8EF4C' rent_beg_date ='20220204'
     rent_beg_time ='150254' rent_end_date ='20220205' rent_end_time ='150254' rental_total ='9.00 ' rental_discount ='1.44 ' rental_final ='7.56 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000070' space_id ='000024' renter_id ='000014' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA0F4C' rent_beg_date ='20220204'
     rent_beg_time ='204121' rent_end_date ='20220205' rent_end_time ='204121' rental_total ='8.00 ' rental_discount ='0.00 ' rental_final ='8.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000071' space_id ='000022' renter_id ='000012' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDACF4C' rent_beg_date ='20220206'
     rent_beg_time ='180923' rent_end_date ='20220207' rent_end_time ='180923' rental_total ='12.00 ' rental_discount ='0.00 ' rental_final ='12.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000072' space_id ='000022' renter_id ='000011' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD98F4C' rent_beg_date ='20220206'
     rent_beg_time ='181055' rent_end_date ='20220207' rent_end_time ='181055' rental_total ='12.00 ' rental_discount ='0.00 ' rental_final ='12.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000073' space_id ='000004' renter_id ='000004' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAEF4C' rent_beg_date ='20220206'
     rent_beg_time ='194512' rent_end_date ='20220207' rent_end_time ='194512' rental_total ='11.00 ' rental_discount ='1.32 ' rental_final ='9.68 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000074' space_id ='000021' renter_id ='000007' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD96F4C' rent_beg_date ='20220206'
     rent_beg_time ='235458' rent_end_date ='20220207' rent_end_time ='235458' rental_total ='12.00 ' rental_discount ='2.40 ' rental_final ='9.60 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000075' space_id ='000023' renter_id ='000009' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA2F4C' rent_beg_date ='20220207'
     rent_beg_time ='194748' rent_end_date ='20220208' rent_end_time ='194748' rental_total ='12.00 ' rental_discount ='0.00 ' rental_final ='12.00 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000079' space_id ='000025' renter_id ='000039' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9AF4C' rent_beg_date ='20220207'
     rent_beg_time ='195500' rent_end_date ='20220208' rent_end_time ='195500' rental_total ='8.00 ' rental_discount ='0.00 ' rental_final ='8.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000081' space_id ='000008' renter_id ='000001' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD8CF4C' rent_beg_date ='20220207'
     rent_beg_time ='200500' rent_end_date ='20220208' rent_end_time ='200500' rental_total ='9.00 ' rental_discount ='0.54 ' rental_final ='8.46 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000082' space_id ='000020' renter_id ='000011' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD98F4C' rent_beg_date ='20220207'
     rent_beg_time ='201413' rent_end_date ='20220208' rent_end_time ='201413' rental_total ='12.00 ' rental_discount ='1.08 ' rental_final ='10.92 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000083' space_id ='000026' renter_id ='000039' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9AF4C' rent_beg_date ='20220207'
     rent_beg_time ='201944' rent_end_date ='20220208' rent_end_time ='201944' rental_total ='8.00 ' rental_discount ='0.00 ' rental_final ='8.00 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000086' space_id ='000015' renter_id ='000010' renter_uuid = '1271CE5BBC591EECACE9C8FFAFD9CF4C' rent_beg_date ='20220208'
     rent_beg_time ='150613' rent_end_date ='20220209' rent_end_time ='150613' rental_total ='10.50 ' rental_discount ='1.26 ' rental_final ='9.24 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000087' space_id ='000014' renter_id ='000009' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA2F4C' rent_beg_date ='20220208'
     rent_beg_time ='154112' rent_end_date ='20220209' rent_end_time ='154112' rental_total ='10.50 ' rental_discount ='0.00 ' rental_final ='10.50 ' payment_status ='2' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000088' space_id ='000016' renter_id ='000008' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDAAF4C' rent_beg_date ='20220208'
     rent_beg_time ='154802' rent_end_date ='20220209' rent_end_time ='154802' rental_total ='10.50 ' rental_discount ='0.84 ' rental_final ='9.66 ' payment_status ='1' currency_code = 'BYN' )
     ( mandt ='100' rent_order_uuid = cl_system_uuid=>create_uuid_x16_static(  ) rent_order_id ='000089' space_id ='000021' renter_id ='000015' renter_uuid = '1271CE5BBC591EECACE9C8FFAFDA6F4C' rent_beg_date ='20220208'
     rent_beg_time ='161924' rent_end_date ='20220209' rent_end_time ='161924' rental_total ='12.00 ' rental_discount ='0.00 ' rental_final ='12.00 ' payment_status ='2' currency_code = 'BYN' )
     ).
        pay_statuses = VALUE #( ( mandt ='100' status_id ='1' status_txt = 'Paid'  )
            ( mandt ='100' status_id ='2' status_txt = 'Unpaid'  ) ).
        park_names = VALUE #( ( mandt ='100' parking_name_id ='1' parking_name_txt = 'Underground parking'  )
            ( mandt ='100' parking_name_id ='2' parking_name_txt = 'Multilevel parking'  )
            ( mandt ='100' parking_name_id ='3' parking_name_txt = 'Outdoor parking'  ) ).
        bicycle_availability = VALUE #( ( mandt ='100' bicycle_availability_id ='1' bicycle_availability_txt = 'Available'  )
            ( mandt ='100' bicycle_availability_id ='2' bicycle_availability_txt = 'Not available'  ) ).


*        INSERT zshch_d_cont_a FROM TABLE @contacts.
*        out->write( |{ sy-dbcnt } Contact entries inserted successfully!| ).
*        INSERT zshch_d_renter_a FROM TABLE @renters.
*        out->write( |{ sy-dbcnt } Renter entries inserted successfully!| ).
*        INSERT zshch_d_renter_t FROM TABLE @renters_t.
*        out->write( |{ sy-dbcnt } Renter text entries inserted successfully!| ).
*        INSERT zshch_d_owner_a FROM TABLE @owners.
*        out->write( |{ sy-dbcnt } Owner entries inserted successfully!| ).
*        INSERT zshch_d_owner_t FROM TABLE @owners_t.
*        out->write( |{ sy-dbcnt } Owner text entries inserted successfully!| ).
*        INSERT zshch_d_ptype_a FROM TABLE @parking_types.
*        out->write( |{ sy-dbcnt } Park type entries inserted successfully!| ).
*        INSERT zshch_d_stype_a FROM TABLE @space_types.
*        out->write( |{ sy-dbcnt } Space type entries inserted successfully!| ).
*        INSERT zshch_d_pspace_a FROM TABLE @spaces.
*        out->write( |{ sy-dbcnt } Space entries inserted successfully!| ).
        INSERT zshch_d_rorder_a FROM TABLE @orders.
        out->write( |{ sy-dbcnt } Order entries inserted successfully!| ).
*        INSERT zshch_c_pay_stat FROM TABLE @pay_statuses.
*        out->write( |{ sy-dbcnt } Payment statuses entries inserted successfully!| ).
*        INSERT zshch_c_parkname FROM TABLE @park_names.
*        out->write( |{ sy-dbcnt } Park name entries inserted successfully!| ).
*        INSERT zshch_c_bicycle FROM TABLE @bicycle_availability.
*        out->write( |{ sy-dbcnt } Bicycle availability entries inserted successfully!| ).

      endmethod.
    ENDCLASS.
